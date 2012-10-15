/**
 * 
 */
package edu.devry.web.model;


/**
 * @author harveya
 *
 * Note: for some reason yahoo.com uses a : separator in the query string instead of a ? hence the introduction
 * of a special variable.
 */
public class SearchEngine {
        private String queryVariable;
        private String querySeparator = "?";

        public SearchEngine(String queryVariable) {
                super();
                this.queryVariable = queryVariable;
        }

        public String getQueryVariable() {
                return queryVariable;
        }

        public void setQueryVariable(String queryVariable) {
                this.queryVariable = queryVariable;
        }

        public void setQuerySeparator(String querySeparator) {
                this.querySeparator = querySeparator;
        }

        public String getQuerySeparator() {
                return querySeparator;
        }
        
}