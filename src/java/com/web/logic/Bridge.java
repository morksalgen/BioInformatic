/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.logic;

import bioinformaticproject.SequenceAligner;
import bioinformaticproject.SequenceAssembler;
import bioinformaticproject.SequenceGenerator;
import bioinformaticproject.SequenceSpliterWithThread;
import com.web.model.AjaxResponseBody;
import com.web.model.SliceSession;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hadi
 */
public class Bridge {

    ArrayList<String> slices;
    

    public String generate(int a, int c, int t, int g, int len) {
        String sequence;
        int aPercent = a;
        int cPercent = c;
        int tPercent = t;
        int gPercent = g;
        int length = len;

        // window.call("clearTextTxtGenerate");
        //window.call("clearTextTxtSplit");
        sequence = "";
        sequence = SequenceGenerator.generateSequence(aPercent, cPercent, tPercent, gPercent, length);
        //javaLjs.setTextTxtGenerate(sequence);

        return sequence;
    }

    public String split(int min, int max, int copy, String sequence) {
        StringBuilder txtSplit = new StringBuilder();
        if (min < max) {
            /*slices = SequenceSpliter.splitSequence(sequence, min, max, copy);
            for (String s : slices) {
                txtSplit.append(s + "  ");
            }*/

            SequenceSpliterWithThread sS = new SequenceSpliterWithThread(sequence, min, max, copy);
            sS.setOnProgressListener(new SequenceSpliterWithThread.OnProgressListener() {
                @Override
                public void onProgress(int progress) {
                    //pbSlpliting.setValue(progress);
                }
            });

            sS.setOnProgressFinishListener(new SequenceSpliterWithThread.OnProgressFinishListener() {
                @Override
                public void onProgressFinish(ArrayList<String> s) {
                    slices = s;
                    for (String temp : slices) {
                        txtSplit.append(temp).append("  ");
                    }
                }
            });

            sS.start();
            try {
                sS.join();
            } catch (InterruptedException ex) {
                Logger.getLogger(Bridge.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
        }
        
        SliceSession.setSlices(slices);
        return txtSplit.toString();//change
    }

    public AjaxResponseBody rebuild(String sequence, ArrayList<String> sessionSlices) {
        ArrayList<String> assembleResult;
        StringBuilder txtAssemble = new StringBuilder();
        
        assembleResult = SequenceAssembler.assembleSequence(sessionSlices);//get from session
        
        for (String s : assembleResult) {
            txtAssemble.append(s).append("\n");
        }

        String output = SequenceAligner.align(assembleResult, sequence);
        //txtAlignment.setText(output);
        //System.out.println("\n" + output);

        
        return new AjaxResponseBody(txtAssemble.toString(), output);
    }

}
