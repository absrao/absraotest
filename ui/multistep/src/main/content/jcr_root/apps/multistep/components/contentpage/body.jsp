<%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%>
<!DOCTYPE html>
<!-- saved from url=(0044)http://smg.postclickmarketing.com/iontesturl -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en"><head id="ball_page_title"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- code injection 1 --><!-- end code injection 1 -->
    
	<title>
	Why DeVry | Career Success |  DeVry University 
</title><meta id="ball_page_description" name="description" content="Discover the advantages of earning your degree from DeVry University.  See the degree programs that can help you succeed in today&#39;s fastest-growing careers. Learn more now. 
"><meta id="ball_page_keywords" name="keywords" content="degree programs, why devry, career success, devry degree programs,  devry university
">

	<!--    FRAMEWORK:    ion Framework v4.0    -->
	<!--    PAGE:         fc-form_right_m_grid_layout      -->
	
	<link href="css/common.css" rel="stylesheet" type="text/css"><link href="css/theme.css" rel="stylesheet" type="text/css"><link href="css/themeform.css" rel="stylesheet" type="text/css">
	
    <!-- Internet Explorer HTML5 enabling script: -->
	<!--[if lt IE 9]>
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
    
    <!-- code injection 2 --><!-- end code injection 2 -->

<script src="js/liveball_api.js" type="text/javascript"></script>
<script type="text/javascript">
 var _lbapi_lb3id="2195577$6UGCFSUK$2207082";
</script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
<!--
/*!
* jQuery Cookie Plugin
* https://github.com/carhartl/jquery-cookie
** Copyright 2011, Klaus Hartl
* Dual licensed under the MIT or GPL Version 2 licenses.
* http://www.opensource.org/licenses/mit-license.php
* http://www.opensource.org/licenses/GPL-2.0
*/
(function($) {
    $.cookie = function(key, value, options) {

        // key and at least value given, set cookie...
        if (arguments.length > 1 && (!/Object/.test(Object.prototype.toString.call(value)) || value === null || value === undefined)) {
            options = $.extend({}, options);

            if (value === null || value === undefined) {
                options.expires = -1;
            }

            if (typeof options.expires === 'number') {
                var days = options.expires, t = options.expires = new Date();
                t.setDate(t.getDate() + days);
            }

            value = String(value);

            return (document.cookie = [
                encodeURIComponent(key), '=', options.raw ? value : encodeURIComponent(value),
                options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
                options.path ? '; path=' + options.path : '',
                options.domain ? '; domain=' + options.domain : '',
                options.secure ? '; secure' : ''
            ].join(''));
        }

        // key and possibly options given, get cookie...
        options = value || {};
        var decode = options.raw ? function(s) { return s; } : decodeURIComponent;

        var pairs = document.cookie.split('; ');
        for (var i = 0, pair; pair = pairs[i] && pairs[i].split('='); i++) {
            if (decode(pair[0]) === key) return decode(pair[1] || ''); // IE saves cookies with empty string as "c; ", e.g. without "=" as opposed to EOMB, thus pair[1] may be undefined
        }
        return null;
    };
})(jQuery);


function getUrlVars(qsVar) {
    var queryString = unescape(location.search);
    if (!queryString) {
        return null;
    }
    queryString = queryString.substring(1);
    var pairs = queryString.split("&");
    for (var i = 0; i < pairs.length; i++) {
        var keyValuePair = pairs[i].split("=");         
        if (keyValuePair[0].toLowerCase() == qsVar) {
            return keyValuePair[1];
        }
    }
    return null;
}

function getQsValFromRef(name) {
	ref = document.referrer;
	ref_qs = ref.substring(ref.indexOf("?"), ref.length);
	var refValues = ref_qs.split("&");

	for(i = 0; i < refValues.length; i++) { 
		if (refValues[i].indexOf(name) != -1) { 
			var superCode = refValues[i].split("="); 
			return superCode[1]; 
		} 
	} 
        return "unassigned"; 
}

//search engine mapping object for parsing action
searchEngineMapping = [
{q:"terms",d:"turnstyl.com",e:"Turnstyl.com",t:"search engine"},
{q:"terms",d:"search.about.com",e:"About.com",t:"search engine"},{q:"q",d:"us.yhs4.search.yahoo.com",e:"Yahoo",t:"search engine"},{q:"q",d:"search.aol.com",e:"Aol",t:"search engine"},{q:"q",d:"www.ask.com",e:"Ask.com",t:"search engine"},
{q:"wd",d:"www.baidu.com",e:"Baidu",t:"search engine"},{q:"q",d:"www.bing.com",e:"Bing",t:"search engine"},
{q:"query",d:"websearch.cs.com",e:"CS.com",t:"search engine"},{q:"q",d:"search.daum.net",e:"Daum.net",t:"search engine"},{q:"q",d:"search.earthlink.net",e:"Earthlink",t:"search engine"},{q:"q",d:"msxml.excite.com",e:"Excite.com",t:"search engine"},{q:"q",d:"www.google.com",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.af",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.ag",e:"Google",t:"search engine"},
{q:"q",d:"www.google.am",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.au",e:"Google",t:"search engine"},
{q:"q",d:"www.google.at",e:"Google",t:"search engine"},{q:"q",d:"www.google.az",e:"Google",t:"search engine"},
{q:"q",d:"www.google.bs",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.bh",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.bd",e:"Google",t:"search engine"},{q:"q",d:"www.google.be",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.bz",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.bo",e:"Google",t:"search engine"},
{q:"q",d:"www.google.ba",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.bw",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.br",e:"Google",t:"search engine"},{q:"q",d:"www.google.vg",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.bn",e:"Google",t:"search engine"},{q:"q",d:"www.google.bg",e:"Google",t:"search engine"},
{q:"q",d:"www.google.ca",e:"Google",t:"search engine"},{q:"q",d:"www.google.cl",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.co",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.cr",e:"Google",t:"search engine"},
{q:"q",d:"www.google.ci",e:"Google",t:"search engine"},{q:"q",d:"www.google.hr",e:"Google",t:"search engine"},
{q:"q",d:"www.google.cz",e:"Google",t:"search engine"},{q:"q",d:"www.google.cd",e:"Google",t:"search engine"},
{q:"q",d:"www.google.dk",e:"Google",t:"search engine"},{q:"q",d:"www.google.dj",e:"Google",t:"search engine"},
{q:"q",d:"www.google.dm",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.do",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.ec",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.eg",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.sv",e:"Google",t:"search engine"},{q:"q",d:"www.google.ee",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.et",e:"Google",t:"search engine"},{q:"q",d:"www.google.fm",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.fj",e:"Google",t:"search engine"},{q:"q",d:"www.google.fi",e:"Google",t:"search engine"},
{q:"q",d:"www.google.fr",e:"Google",t:"search engine"},{q:"q",d:"www.google.gm",e:"Google",t:"search engine"},
{q:"q",d:"www.google.ge",e:"Google",t:"search engine"},{q:"q",d:"www.google.de",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.gh",e:"Google",t:"search engine"},{q:"q",d:"www.google.gr",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.gt",e:"Google",t:"search engine"},{q:"q",d:"www.google.ht",e:"Google",t:"search engine"},
{q:"q",d:"www.google.hn",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.hk",e:"Google",t:"search engine"},
{q:"q",d:"www.google.hu",e:"Google",t:"search engine"},{q:"q",d:"www.google.is",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.in",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.id",e:"Google",t:"search engine"},
{q:"q",d:"www.google.ie",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.il",e:"Google",t:"search engine"},
{q:"q",d:"www.google.it",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.jm",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.jp",e:"Google",t:"search engine"},{q:"q",d:"www.google.jo",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.ke",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.kr",e:"Google",t:"search engine"},
{q:"q",d:"www.google.kg",e:"Google",t:"search engine"},{q:"q",d:"www.google.lv",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.ls",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.ly",e:"Google",t:"search engine"},
{q:"q",d:"www.google.lt",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.my",e:"Google",t:"search engine"},
{q:"q",d:"www.google.mv",e:"Google",t:"search engine"},{q:"q",d:"www.google.mu",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.mx",e:"Google",t:"search engine"},{q:"q",d:"www.google.md",e:"Google",t:"search engine"},
{q:"q",d:"www.google.mn",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.ma",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.na",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.np",e:"Google",t:"search engine"},
{q:"q",d:"www.google.nl",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.nz",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.ni",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.ng",e:"Google",t:"search engine"},
{q:"q",d:"www.google.no",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.om",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.pk",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.py",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.pe",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.ph",e:"Google",t:"search engine"},
{q:"q",d:"www.google.pl",e:"Google",t:"search engine"},{q:"q",d:"www.google.pt",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.pr",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.qa",e:"Google",t:"search engine"},
{q:"q",d:"www.google.ro",e:"Google",t:"search engine"},{q:"q",d:"www.google.ru",e:"Google",t:"search engine"},
{q:"q",d:"www.google.rw",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.vc",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.sa",e:"Google",t:"search engine"},{q:"q",d:"www.google.sn",e:"Google",t:"search engine"},
{q:"q",d:"www.google.sc",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.sg",e:"Google",t:"search engine"},
{q:"q",d:"www.google.sk",e:"Google",t:"search engine"},{q:"q",d:"www.google.si",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.za",e:"Google",t:"search engine"},{q:"q",d:"www.google.es",e:"Google",t:"search engine"},
{q:"q",d:"www.google.lk",e:"Google",t:"search engine"},{q:"q",d:"www.google.se",e:"Google",t:"search engine"},
{q:"q",d:"www.google.ch",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.tw",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.th",e:"Google",t:"search engine"},{q:"q",d:"www.google.tt",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.tr",e:"Google",t:"search engine"},{q:"q",d:"www.google.ae",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.ug",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.uk",e:"Google",t:"search engine"},
{q:"q",d:"www.google.com.ua",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.uy",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.vi",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.uz",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.ve",e:"Google",t:"search engine"},{q:"q",d:"www.google.com.vn",e:"Google",t:"search engine"},
{q:"q",d:"www.google.co.zm",e:"Google",t:"search engine"},{q:"q",d:"www.google.co.zw",e:"Google",t:"search engine"},
{q:"query",d:"www.hotbot.com",e:"HotBot",t:"search engine"},{q:"query",d:"search.lycos.com",e:"Lycos",t:"search engine"},{q:"query",d:"search.naver.com",e:"Naver",t:"search engine"},{q:"q",d:"www.search.com",e:"Search.com",t:"search engine"},{q:"q",d:"searchalot.com",e:"SearchALot.com",t:"search engine"},{q:"se--qq",d:"smarter.com",e:"Smarter.com",t:"search engine"},{q:"q",d:"search.twitter.com",e:"Twitter",t:"social media"},
{q:"p",d:"search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"au.search.yahoo.com",e:"Yahoo!",t:"search engine"},
{q:"p",d:"ca.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"fr.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"de.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"hk.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"in.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"it.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"search.yahoo.co.jp",e:"Yahoo!",t:"search engine"},{q:"p",d:"kr.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"mx.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"sg.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"es.search.yahoo.com",e:"Yahoo!",t:"search engine"},
{q:"p",d:"tw.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"p",d:"uk.search.yahoo.com",e:"Yahoo!",t:"search engine"},{q:"text",d:"www.yandex.com",e:"Yandex",t:"search engine"}
                ]



function getUri(href) {
        var l = document.createElement("a");
        l.href = href;
        return l;
}


getQueryVariable = function(url, variable) {
  if (url == null) { 
       return null; }

   var indx = url.indexOf("?"), h, query, vars;

if (indx == -1) { 
      return null; }
   query = url.substring(indx + 1, url.length);
   vars = query.split("&");

for (h = 0; h < vars.length; h++) {
    var pair = vars[h].split("=");
    if (pair[0] == variable) {
    return unescape(pair[1]);}}
                    return null;
                }

if(document.referrer != null){
 var refUri = getUri(document.referrer);

    for(var i=0; i < searchEngineMapping.length; i++){
        var m = searchEngineMapping[i];

        if(m.d === refUri.hostname){
          var  sc1 = refUri.hostname;
         //var  sc2 = getQueryVariable(document.referrer, m.q);
    

        //$.cookie('Sc1', sc1, {expires: 30, path: '/'}); 
       //$.cookie('Sc2', sc2, {expires: 30, path: '/'});
    

//liveballData("lb_supercode_sc2", sc2);
break;
}}
}
-->
</script>

</head>


<body id="ball_page_fc_form_right_m_grid_layout" data-liveball="styleonly">
	<!-- code injection 3 --><!-- end code injection 3 -->
    
	<!-- begin wrapper-->
	<div id="wrapper">
    	
  
        <!-- begin container-->
    	<div id="container">
        <div id="container_hook">
    		<!-- **begin header**-->
 <cq:include script="header.jsp"/>

            <!-- **end header**-->    
    	
<div id="content_wrapper">    
    	
        
        	
        	
        	
            
            <!-- **begin content**-->
        	<section class="content">
            	<div class="content_hook">
                
                			
                            
                             <!-- begin left content--> 
                           <div id="left_col_wrap" class="grid col7 first"> 
                            
                            <div id="block_wrap_1_b" class="block">
                                <h3 id="ball_Col_1_a" style="color:#1E447B; padding-top: 10px;"><strong><span style="font-size:26px;">
                                
                                <cq:include path="blockText" resourceType="foundation/components/text" />
                                </span></strong></h3>       
 
                                
                                    
                            </div>
              			  	
							<div id="block_wrap_1_c" class="block">
                            	
                               <cq:include path="bodyImage" resourceType="foundation/components/image" />
                               
                                
                            </div>
                            
                            <div id="block_wrap_1_d" class="block">
                            	<div id="ball_Col_1_e" class="block" style="padding-top:10px;"><p>We've developed our associate, bachelor's, and master's degree programs with the help of industry leaders to prepare you to work in today's fastest-growing careers. The proof is in our students' success. In fact, thousands of our graduates find themselves right where they want to beâemployed in their field of study.</p>
<ul>
	<li>
		We work with business leaders like IBM and Cisco to develop degree programs that provide real-world knowledge</li>
</ul>
<ul>
	<li>
		For the last 10 years, our graduates have worked at over 95 of the Fortune 100 companies<sup>1</sup></li>
</ul>
<ul>
	<li>
		With year-round class offerings, you can earn your bachelor's degree in as few as three years</li>
</ul>
<ul>
	<li>
		Attend class on campus at 95+ locations nationwide, online, or a mix of both</li>
</ul>
<br>
<p><strong>If you'd like more information on our programs, take the next step by filling out the simple form to the right.</strong></p>
<p><strong><a href="http://my.devry.edu/"><span style="color:#ff0000;">Current Student? Click here to login to MyDeVry </span></a></strong></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><span style="font-size:10px;"><sup><span style="font-style: italic;">1</span></sup><em>DeVry University graduates from Feb 2001 to Oct 2010 in the active job market. Active job market includes those employed prior to graduation. Fortune 500 ranking, 2011.</em></span></p>
<p>&nbsp;</p></div>
                                
                                
                            </div>
                            
                            
                            
                             
                            </div>
                             <!-- end left content--> 
                			
                            <!-- begin right content-->
                            <div id="right_col_wrap" class="grid col5">
                            
                                       	
                            
                                <!-- begin form container -->
                                <div id="form_container" class="form_container form_380_container">
                               
                               		<div class="form_hook form_380_hook">
                                    	<div class="form_content form_m form_380_content">

                                        	<div id="ball_Form_1_a" style="padding-left: 15px; padding-bottom:5px"><span style="font-size:14px;"><strong>Progress:</strong></span></div>
							
											<div id="form_top_wrap" class="form_indent form_top_content"> 
                                                <div class="img_right"></div>
                                                <img src="images/dvu_ms_arrows_3_steps_1_progress.png" id="ball_Form_1_c" width="351" height="26" style="padding-bottom:10px;" border="0">
                                                <h3 id="ball_Form_1_d" style="line-height:80%; padding-top:12px;"><p><span style="font-size: 12px;"><span style="font-size:14px;"><strong>Take the first step toward a university education.</strong></span><br>
Complete the short form below<br>
Canada students, please visit&nbsp;<a href="http://information.devry.ca/degree-programs?vc=167011" target="_blank">information.DeVry.ca</a>.</span></p>
<p><span style="color:#ff0000;"><span style="font-size: 12px; ">*Required field</span></span></p></h3>
                                                <div id="ball_Form_1_e" width="150" height="150"><style type="text/css">
#lbFormErrorBox {
	display:none;
	background-color:#CF2B31;
	border:1px solid #a00;
	color:#fff;
	font-size:12px;
	text-shadow: 0 2px 0 #a00;
	padding:8px 6px;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
}
</style>
<div id="lbFormErrorBox"></div>
<script type="text/javascript">window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"><\/script>')</script>
<script type="text/javascript">
function displayError (txt) {
	var errorEle = $("#lbFormErrorBox");
	if (txt && txt != "") {
		errorEle.text(txt);
		errorEle.show();
	}
}
	
function getErrorMsg (inputName) {
	var data; 
	try {
		data= liveballScriptlet(3,"rct=json","errorkey="+inputName);
		data = jQuery.parseJSON(data);
	} catch (e) {
		data = null;
	}
	//console.log(data);
	if (data) {
		return data.errorTxt;
	}
	return "";
}
$(document).ready(function () {

	var frm,inputs;

	frm = $("#liveballform");
	
	
	
	if (frm && frm.length > 0) {
		inputs = frm.find(".pf_field_cell_bad").find(":input");
		//console.log(inputs.length);
		if (inputs && inputs.length > 0) {
			var inputName = "ion_multi_error";
			if (inputs.length == 1) {
				inputName = inputs[0].name;
			}
			var msg = getErrorMsg(inputName);
			if (msg && msg != "") {
				displayError(msg);
			}
		}
	}

});
</script></div>
                                        	</div>
                                        
                                        	<div id="form_block" class="form_block">
                                                <div class="pf_upleft_corner"></div><div class="pf_upright_corner"></div><form name="liveballform" id="liveballform" method="post" action="why_devry.html" style="padding-right: 15px;">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTIzNjIzMDUzNmRk">
</div>
<table class="pf_form_table" cellpadding="0" cellspacing="0" border="0">
	<tbody><tr>
		<td style="width:30%"><img src="images//spacer.gif" width="1" height="1"></td>
		<td style="width:50%"><img src="images//spacer.gif" width="1" height="1"></td>
		<td style="width:0%"><img src="images//spacer.gif" width="1" height="1"></td>
		<td style="width:10%"><img src="images//spacer.gif" width="1" height="1"></td>
		<td style="width:10%"><img src="images//spacer.gif" width="1" height="1"></td>
	</tr>
	<tr>
		<td colspan="2"><img src="images//spacer.gif" width="1" height="1"></td>
		<td colspan="1" class="pf_2col_gutter"><img src="images//spacer.gif" width="1" height="1"></td>
		<td colspan="2"><img src="images//spacer.gif" width="1" height="1"></td>
	</tr>
	<tr>
		<td class="pf_label_cell"><span class="pf_label_text">*Classroom Preference</span></td>
		<td class="pf_field_cell" colspan="1"><select name="classroom_preference" id="ballform_classroom_preference" class="pf_dropdown_wide">
			<option selected="selected" value="">Select</option>
			<option value="ONSITE/ONLINE">On Campus &amp; Online</option>
			<option value="ONSITE">On Campus</option>
			<option value="ONLINE">Online</option>

		</select><span class="pf_hint_text"></span></td>
		<td colspan="1" class="pf_2col_gutter"><img src="images//spacer.gif" width="1" height="1"></td>
		<td><span><img src="images//spacer.gif" width="1" height="1"></span></td>
		<td class="pf_field_cell" colspan="1"><img src="images//spacer.gif" width="1" height="1"></td>
	</tr>
	<tr>
		<td colspan="2"><img src="images//spacer.gif" width="1" height="1"></td>
		<td colspan="1" class="pf_2col_gutter"><img src="images//spacer.gif" width="1" height="1"></td>
		<td colspan="2"><img src="images//spacer.gif" width="1" height="1"></td>
	</tr>
	<tr>
		<td colspan="5" class="pf_submit_cell" align="center"><input type="submit" name="ball$ctl36" value="Take Step One" class="pf_submit_button"></td>
	</tr>
</tbody></table>
</form><div class="pf_loleft_corner"></div><div class="pf_loright_corner"></div>
						  					</div>
 	
                                            
                                        
                                        </div>                               
                               		</div>
                                </div>
                                <!-- end form container -->
                                
                                 
                                
                                
                            
                            </div>
                           <!-- end right content-->
                           
                           <!-- begin 2 col pod content -->
                            
                             
                            
                            <!-- end 2 col pod content -->
                
                			<!-- begin 3 col pod content -->
                            
                             
                            
                            <!-- end 3 col pod content -->

                	
                             <!-- begin 4 col pod content -->
                            
                             
                            
                            <!-- end 4 col pod content -->
                            
                            
                            
                            
                            
                                      
                                                   
                </div>
        	</section>
        	<!-- **end content**-->
            
           
            
            
            </div>
            
         
            
        
        </div>
    	</div>
    	<!-- end container-->
        
        <!-- **begin footer** -->
        
		<div id="footer_wrap">
        
            <footer>
           			<div id="footer_logo"></div>
                     
					  
                    
                   
					<div id="footer_wrap_2" class="footer_fineprint"><div id="ball_Footer_1_h"><div style="text-align: center;">
	<div>
		<span style="font-size: 14px; ">For comprehensive consumer information, visit&nbsp;<a href="http://www.devry.edu/studentconsumerinfo" target="_blank">devry.edu/studentconsumerinfo</a>.</span></div>
	<div>
		&nbsp;</div>
	<div id="footer">
		<p>DeVry University is accredited by The Higher Learning Commission of the North Central Association of Colleges and Schools,&nbsp;<a href="http://www.ncahlc.org/" target="_blank">www.ncahlc.org</a>.<br>
		Keller Graduate School of Management is included in this accreditation.<br>
		<strong>In New York, DeVry University operates as DeVry College of New York.</strong>&nbsp;DeVry University operates as DeVry Institute of Technology in Calgary, Alberta.<br>
		DeVry is certified to operate by the State Council of Higher Education for Virginia. AC0060.</p>
		<p>DeVry University is authorized for operation by the THEC.&nbsp;<a href="http://www.state.tn.us/thec" target="_blank">www.state.tn.us/thec</a>. Nashville Campus - 3343 Perimeter Hill Dr., Nashville, TN 37211.&nbsp;Licensed by the Mississippi Commission on Proprietary School and College Registration, Certification No. C-498.</p>
		<p>Program availability varies by location.<br>
		<a href="http://www.devry.edu/terms-of-service.jsp" target="_blank">Terms of Service</a>.&nbsp;<a href="http://www.devry.edu/devry_privacy_policy.jsp" target="_blank">Privacy Policy</a>.</p>
	</div>
</div>
<p>&nbsp;</p></div></div>
            </footer>
        
        </div>        
        <!-- **end footer** -->
        
  
    </div>
    <!-- end wrapper-->

	<!-- code injection 4 --><!-- end code injection 4 -->

<script src="js/tag.js">{ site: "rs7stCU" }</script>
<noscript>&lt;iframe src="//s.thebrighttag.com/iframe?c=rs7stCU" width="1" height="1" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"&gt;&lt;/iframe&gt;</noscript>
<script type="text/javascript">
    $(document).ready(function () {

		var cookie_sc1_name = "Sc1";
                var cookie_sc2_name = "Sc2";
		
                //set cookie expiration time
                var cookie_exp_days = 30;

                //searchable query string paramters
		var qsp1_name = "sc_1";
                var qsp2_name = "sc_2";



                //extraction logic
		var cookie_sc1_val = $.cookie(cookie_sc1_name);
                var cookie_sc2_val = $.cookie(cookie_sc2_name);
		
                var qs_src = getUrlVars(qsp1_name);
                var kw_src = getUrlVars(qsp2_name);
		
                var retval = null;
                var keyval = null;

               //capture and store vendor code
               var vendor_code = getUrlVars("vc");
               if(vendor_code != null && vendor_code != ""){
                   liveballData("VC",vendor_code);
                   $.cookie("vendor", vendor_code, { expires: cookie_exp_days, domain: '.devry.edu', path: '/' });
                }


               // capture and test logic for SC_1
		if (cookie_sc1_val != null){//changed  && qs_src == null
			// returning user with no querystring parameter
			// cookie value is returned for sc1 value, but not reset in cookie to avoid expiration extension
                         retval = cookie_sc1_val;
		} else if (qs_src != null) {
			// new user with a querystring parameter
			$.cookie(cookie_sc1_name, qs_src, { expires: cookie_exp_days, domain: '.devry.edu', path: '/' });
			retval = qs_src;
		} else {
			// new user with maybe a referrer
			var ref_src = getQsValFromRef(qsp1_name);
			$.cookie(cookie_sc1_name, ref_src, { expires: cookie_exp_days, domain: '.devry.edu', path: '/' });
			retval = ref_src;
		}


               // capture and test logic for SC_2
		if (cookie_sc2_val != null){//  && kw_src == null
			// returning user with no querystring parameter
			// cookie value is returned for sc2 value, but not reset in cookie to avoid expiration extension
                         keyval = cookie_sc2_val;
		} else if (kw_src != null) {
			// new user with a querystring parameter
			$.cookie(cookie_sc2_name, kw_src, { expires: cookie_exp_days, domain: '.devry.edu', path: '/' });
			keyval = kw_src;
		} else {
			// new user with maybe a referrer
			var ref_src2 = getQsValFromRef(qsp2_name);
			$.cookie(cookie_sc2_name, ref_src2, { expires: cookie_exp_days, domain: '.devry.edu', path: '/' });
			keyval = ref_src2;
		}

		 liveballData("sc1", 'SC_1'+retval);
                 liveballData("sc2", 'SC_2'+keyval);
	});
(function(){
    var btuserID;
    var btBoo = false;
   
    $(window).load(function(){
        window.btuserID = bt_data('user id');
        if(window.btuserID == null || window.btuserID == ""){
            window.btuserID = "bt_data unavailable";
        }
        liveballData("BT_1",window.btuserID);
    });
    $('#liveballform').submit(function(ev) {
        if(window.btuserID == null || window.btuserID == ""){
            window.btuserID = "bt_data unavailable at form submission";
        }
        else{
            window.btuserID = bt_data('user id');
            liveballData("BT_1",window.btuserID);
        }
    });   
    
})();
</script>
<script type="text/javascript">
$(document).ready(function() {

  $("#ballform_optin").closest('.pf_field_row').hide();
 });

$('#ballform_phone').blur(function() {

var jerseyCodes = ["201","551","609","732","848","856","862","908","973"];
var phoneNumberFull = document.liveballform.phone.value;

if(phoneNumberFull.indexOf("1") == 0) {
    phoneNumberFull = phoneNumberFull.substring(1,phoneNumberFull.length);
}

var areaCode = phoneNumberFull.substring(0,3);

if(jQuery.inArray(areaCode,jerseyCodes) > -1){
   $("#ballform_optin").closest('.pf_field_row').show();
     $('#ballform_ac_hidden').val("1");

   // "ballform_ac_hidden"
} else {
   $("#ballform_optin").closest('.pf_field_row').hide();
     $('#ballform_ac_hidden').val("0");
}

});
</script>


<img src="Why_DeVry_files/KeyGrip.ashx">
</body></html>