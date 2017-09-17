
package com.web.model;

/**
 *
 * @author hadi
 */
public class AjaxResponseBody {
    public String result = "";
    public String otherResult = "";

    public AjaxResponseBody() {
        
    }
    
    public AjaxResponseBody(String result, String otherResult) {
        this.result = result;
        this.otherResult = otherResult;
    }
}
