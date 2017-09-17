/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.controller;

import com.web.logic.Bridge;
import com.web.model.AjaxGenerateRequestBody;
import com.web.model.AjaxResponseBody;
import com.web.model.AjaxSplitRequestBody;
import com.web.model.SliceSession;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author hadi
 */
@Controller
public class AjaxController {

    @ResponseBody
    @RequestMapping(value = "api/generate")
    public AjaxResponseBody getGenerate(@RequestBody AjaxGenerateRequestBody request, HttpSession session) {

        AjaxResponseBody result = new AjaxResponseBody();
        Bridge bridge = new Bridge();
        result.result = bridge.generate(request.a, request.c, request.t, request.g, request.length);
        
        session.setAttribute("sequence", result.result);
        //logic
        return result;

    }
    
    @ResponseBody
    @RequestMapping(value = "api/split")
    public AjaxResponseBody getSplit(@RequestBody AjaxSplitRequestBody request, HttpSession session) {

        Bridge bridge = new Bridge();
        
        AjaxResponseBody result = new AjaxResponseBody();
        result.result = bridge.split(request.min, request.max, request.copy, (String)session.getAttribute("sequence"));
        
        session.setAttribute("slices", SliceSession.getSlices());
        //logic
        return result;

    }   
    
    
    @ResponseBody
    @RequestMapping(value = "api/assemble")
    public AjaxResponseBody getAssemble(@RequestBody AjaxSplitRequestBody request, HttpSession session) {

        Bridge bridge = new Bridge();
        
        AjaxResponseBody result = bridge.rebuild((String)session.getAttribute("sequence"), (ArrayList<String>)session.getAttribute("slices"));
        
        //logic
        return result;

    }      
    
}
