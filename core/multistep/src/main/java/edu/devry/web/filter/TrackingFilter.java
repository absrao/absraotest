/**
 * 
 */
package edu.devry.web.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.lang.String;
import java.net.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.felix.scr.annotations.sling.*;

import org.apache.commons.validator.GenericValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



//import com.google.inject.Singleton;

import edu.devry.Constants;
import edu.devry.web.model.SearchEngine;

/**
 * @author harveya
 * 
 */
@SlingFilter(generateComponent = false, generateService = true, order = -700, scope = SlingFilterScope.REQUEST)
public class TrackingFilter implements Filter {
        private static final String sc1Parameter = Constants.SC1_COOKIE_NAME;
        private static final String sc2Parameter = Constants.SC2_COOKIE_NAME;
        private static final String vcParameter = Constants.VC_COOKIE_NAME;
        private static final String SC1_DIRECT_SEARCH = "DTWB_NOSOURCE";
        private static final int cookieExpiry = 60 * 60 * 24 * 30; // one month expiration
        private String domain;
        private String ignorePath;
       
        private static final Logger  logger = LoggerFactory.getLogger(TrackingFilter.class);
        private Map<String, SearchEngine> engineMap;

        /*
         * (non-Javadoc)
         * 
         * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest,
         * javax.servlet.ServletResponse, javax.servlet.FilterChain)
         */
        @Override
        public void doFilter(ServletRequest request, ServletResponse response,
                        FilterChain chain) throws IOException, ServletException {

                try {
                        HttpServletRequest req = (HttpServletRequest)request;
                        HttpServletResponse resp = (HttpServletResponse)response;
                        String currentUrl = req.getRequestURL().toString().replace("http://", "");

                        if(currentUrl.toString().indexOf(".jpg")<0 && currentUrl.toString().indexOf(".png")<0 
                                        && currentUrl.toString().indexOf(".css")<0 && !currentUrl.toString().endsWith(".js"))
                        {
                                String host = currentUrl.substring(0, currentUrl.indexOf("/"));
                                logger.debug("path: " + req.getServletPath() + "; context + ignorePath: '" + req.getContextPath() + ignorePath + "'");

                                //if the path request is the ignorePath then return. this is
                                //used to prevent over-writing the LiveBall cookies.
                                if (req.getServletPath().equals(ignorePath)) {
                                        logger.debug("Request is in ignore path, ignoring.");
                                        chain.doFilter(request, response);
                                }
                                //Check for current cookie values
                                boolean vcCookie, sc1Cookie, sc2Cookie;
                                vcCookie = checkCookie(req, Constants.VC_COOKIE_NAME);
                                sc1Cookie = checkCookie(req, Constants.SC1_COOKIE_NAME);
                                sc2Cookie = checkCookie(req, Constants.SC2_COOKIE_NAME);
                                
                                //Get current querystring values
                                String sc_1 = request.getParameter(sc1Parameter);
                                String sc_2 = request.getParameter(sc2Parameter);
                                String vc = request.getParameter(vcParameter);
                                String referrer = req.getHeader("referer");
                                
                                //If organic search is found, decode the search terms and cookie the name of the search engine
                                if ((null != referrer) && (GenericValidator.isBlankOrNull(sc_1)) && isSearchEngine(referrer)) {
                                        URL url = new URL(referrer);
                                        SearchEngine se = engineMap.get(url.getHost());
                                        Map<String, String> map = mapUrlParameters(referrer);
                                        
                                        logger.debug("search engine found");
                                        sc_1 = url.getHost();
                                        if (se != null) {
                                                sc_2 = map.get(se.getQueryVariable());
                                                if (null == sc_2) {
                                                        logger.debug("query value not found. dumping all querystring values");
                                                        Set<String> keys = map.keySet();
                                                        for (String k : keys) {
                                                                logger.debug(k + " = " + map.get(k));
                                                        }
                                                }
                                        }
                                }
                                
                                //If we receive a sc and/or vc parameter, and a previous value does not already exist, then drop a cookie
                                if (!GenericValidator.isBlankOrNull(vc) && !vcCookie) {
                                        addCookie(resp, Constants.VC_COOKIE_NAME, vc, host);
                                }
                                if (!GenericValidator.isBlankOrNull(sc_1) && !sc1Cookie) {
                                        addCookie(resp, Constants.SC1_COOKIE_NAME, sc_1, host);
                                }
                                if (!GenericValidator.isBlankOrNull(sc_2) && !sc2Cookie) {
                                        addCookie(resp, Constants.SC2_COOKIE_NAME, sc_2, host);
                                }
                        }

                } catch (Exception e) {
                        logger.error("Exception caught in doFilter: " + e.getMessage());
                        StringWriter traceWriter = new StringWriter();
                        PrintWriter printWriter = new PrintWriter(traceWriter, false);
                        e.printStackTrace(printWriter);
                        printWriter.close();
                        logger.error(traceWriter.toString());
                }

                chain.doFilter(request, response);
        }

        public static Map<String, String> mapUrlParameters(String search) throws UnsupportedEncodingException {
            Map<String, String> paramsMap = new HashMap<String,String>();
            
            /**
             * Mask off everything in front of the '?'.
             */
            String q[] = search.split("\\?");

            if ((null == q) || (q.length < 1)) {
                    return paramsMap;
            }
            
            String params[] = q[1].split("&");

            if ((params == null) || (params.length < 1)) {
                    return paramsMap;
            }
            
            for (String param : params) {
               String temp[] = param.split("=");
               
               /**
                * length will be one if the param has no value e.g. 'q='
                */
               if ((null == temp) || (temp.length <= 1)) {
                       continue;
               }
               
               paramsMap.put(temp[0], java.net.URLDecoder.decode(temp[1], "UTF-8"));
            }
            
            return paramsMap;
        }

        /**
         * Utility function for setting correct cookie values.
         * @param response
         * @param name
         * @param value
         */
        private void addCookie(HttpServletResponse response, String name, String value, String currentHost) {
                
                //Code exceptions for local dev and Arc internal dev servers
                if (currentHost.contains("localhost:8080") || currentHost.contains(".local:8080"))
                        domain = "localhost";                                
                if (currentHost.contains("10.3.45.155"))
                        domain = "10.3.45.155";

                logger.debug("setting " + name + " cookie: " + value + " to domain: " + domain);
                try {
                        value = URLDecoder.decode(value, "UTF-8");
                } catch (UnsupportedEncodingException e) {
                        logger.error(e.getMessage());
                }
                Cookie userCookie = new Cookie(name, value);
                userCookie.setDomain(domain);
                userCookie.setMaxAge(cookieExpiry);
                userCookie.setPath("/");
                response.addCookie(userCookie);
        }
        
        /**
         * Utility function for reading cookie values
         * @param request
         * @param name
         */
        private boolean checkCookie(HttpServletRequest request, String name) 
        {
                Cookie[] cookies = request.getCookies();
                boolean result;
                result = false;
                if (cookies != null)
                {
                        for (Cookie ck : cookies) 
                        {
                                if (name.equals(ck.getName())) 
                            {
                                        result=true;
                            }
                        }
                }
                else
                {
                        result = false;
                }
                return result;
        }
        
        /**
         * Lookup the specified URL in local map of supported search engines.
         * @param referrer
         * @return
         */
        private boolean isSearchEngine(String referrer) {
                if (referrer.equalsIgnoreCase("/")) {
                        return false;
                }
                
                URL url;
                try {
                        url = new URL(referrer);
                } catch (MalformedURLException e) {
                        logger.error(e.getMessage());
                        logger.error(referrer);
                        
                        return false;
                }
                
                if (engineMap.containsKey(url.getHost())) {
                        return true;
                } else {
                        return false;
                }
        }

        /*
         * (non-Javadoc)
         * 
         * @see javax.servlet.Filter#destroy()
         */
        @Override
        public void destroy() {
        }

        /*
         * (non-Javadoc)
         * 
         * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
         */
        @Override
        public void init(FilterConfig filterConfig) throws ServletException {
                logger.debug("in init");
                
                domain = filterConfig.getInitParameter("domain");
                
                if (domain == null) {
                        domain = ".devry.edu";
                }
                
                logger.info("using domain: " + domain);
                ignorePath = filterConfig.getInitParameter("ignorePath");
                if (ignorePath == null) {
                        ignorePath = "undefined";
                }
                
                logger.info("ignorePath = " + ignorePath);
                engineMap = new ConcurrentHashMap<String, SearchEngine>();
                SearchEngine se = new SearchEngine("terms");
                engineMap.put("search.about.com", se);
                
                /**
                 * altavista - resolves to yahoo.com
                 */
                se = new SearchEngine("q");
                engineMap.put("us.yhs4.search.yahoo.com", se);
                
                se = new SearchEngine("q");
                engineMap.put("search.aol.com", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.ask.com", se);

                se = new SearchEngine("wd");
                engineMap.put("www.baidu.com", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.bing.com", se);

                se = new SearchEngine("query");
                engineMap.put("websearch.cs.com", se);

                se = new SearchEngine("q");
                engineMap.put("search.daum.net", se);
                
                se = new SearchEngine("q");
                engineMap.put("search.earthlink.net", se);
                
                se = new SearchEngine("q");
                engineMap.put("msxml.excite.com", se);

                se = new SearchEngine("q");
                engineMap.put("www.google.com", se);

                se = new SearchEngine("q");
                engineMap.put("www.google.com.af", se);

                se = new SearchEngine("q");
                engineMap.put("www.google.com.ag", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.am", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.au", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.at", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.az", se);

                se = new SearchEngine("q");
                engineMap.put("www.google.bs", se);

                se = new SearchEngine("q");
                engineMap.put("www.google.com.bh", se);

                se = new SearchEngine("q");
                engineMap.put("www.google.com.bd", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.be", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.bz", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.bo", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.ba", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.co.bw", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.br", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.vg", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.bn", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.bg", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.ca", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.cl", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.co", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.co.cr", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.ci", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.hr", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.cz", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.cd", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.dk", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.dj", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.dm", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.do", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.ec", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.eg", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.sv", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.ee", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.et", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.fm", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.fj", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.fi", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.fr", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.gm", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.ge", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.de", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.gh", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.gr", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.gt", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.ht", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.hn", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.com.hk", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.google.hu", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.is", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.in", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.id", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.ie", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.il", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.it", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.jm", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.jp", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.jo", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.ke", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.kr", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.kg", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.lv", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.ls", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.ly", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.lt", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.my", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.mv", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.mu", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.mx", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.md", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.mn", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.ma", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.na", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.np", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.nl", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.nz", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.ni", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.ng", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.no", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.om", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.pk", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.py", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.pe", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.ph", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.pl", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.pt", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.pr", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.qa", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.ro", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.ru", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.rw", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.vc", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.sa", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.sn", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.sc", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.sg", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.sk", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.si", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.za", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.es", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.lk", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.se", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.ch", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.tw", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.th", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.tt", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.tr", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.ae", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.ug", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.uk", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.ua", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.uy", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.vi", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.uz", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.ve", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.com.vn", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.zm", se);
                se = new SearchEngine("q");
                engineMap.put("www.google.co.zw", se);
                
                se = new SearchEngine("query");
                engineMap.put("www.hotbot.com", se);
                
                se = new SearchEngine("query");
                engineMap.put("search.lycos.com", se);
                
                se = new SearchEngine("query");
                engineMap.put("search.naver.com", se);
                
                se = new SearchEngine("q");
                engineMap.put("www.search.com", se);

                se = new SearchEngine("q");
                engineMap.put("searchalot.com", se);
                
                se = new SearchEngine("se--qq");
                engineMap.put("smarter.com", se);
                
                se = new SearchEngine("q");
                engineMap.put("search.twitter.com", se);
                
                
                /**
                 * example yahoo query string:
                 *                 http://search.yahoo.com/search;_ylt=AhAGWBDu.x_EKIK736bPpz2bvZx4?p=devry+school&toggle=1&cop=mss&ei=UTF-8&fr=yfp-t-701
                 */
                se = new SearchEngine("p");
                engineMap.put("search.yahoo.com", se);

                se = new SearchEngine("p");
                engineMap.put("au.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("ca.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("fr.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("de.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("hk.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("in.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("it.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("search.yahoo.co.jp", se);
                se = new SearchEngine("p");
                engineMap.put("kr.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("mx.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("sg.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("es.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("tw.search.yahoo.com", se);
                se = new SearchEngine("p");
                engineMap.put("uk.search.yahoo.com", se);

                se = new SearchEngine("text");
                engineMap.put("www.yandex.com", se);
        }
        
}
