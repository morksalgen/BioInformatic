/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.model;

import java.util.ArrayList;

/**
 *
 * @author hadi
 */
public class SliceSession {
    private static ArrayList<String> slices;
    
    public static void setSlices(ArrayList<String> slices) {
        SliceSession.slices = slices;
    }
    
    public static ArrayList<String> getSlices() {
        return slices;
    }
    
}
