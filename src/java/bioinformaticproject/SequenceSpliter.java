/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bioinformaticproject;

import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;

public class SequenceSpliter {
    public static ArrayList <String> splitSequence (String sequence, int min, int max, int copy){
        ArrayList <String> slices = new ArrayList<String> ();
        int slicePointer = 0;
        int tempLength=0;
        int length = sequence.length();
        for (int i=0 ; i<copy ; i++ ){
            while (slicePointer < length){
                if (length - slicePointer >= max) {
                    tempLength = ThreadLocalRandom.current().nextInt(min, max + 1);
                    slices.add(sequence.substring(slicePointer, slicePointer+tempLength));
                    slicePointer += tempLength;
                }
                else {
                   slices.add(sequence.substring(slicePointer, length));
                   slicePointer = length;
                }
            }
            slicePointer = 0;
        }
        return slices;
    }
}
