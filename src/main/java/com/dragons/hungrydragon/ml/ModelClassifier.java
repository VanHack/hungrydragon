/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dragons.hungrydragon.ml;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import weka.classifiers.Classifier;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.Attribute;
import weka.core.DenseInstance;
import weka.core.Instances;
import weka.core.SerializationHelper;

/**
 *
 * @author Marcio
 */
public class ModelClassifier {
    private Attribute name;
    private Attribute type;

    private ArrayList attributes;
    private ArrayList classVal;
    private Instances dataRaw;
    
     public ModelClassifier() {
        name = new Attribute("name");
        type = new Attribute("type");
        attributes = new ArrayList();
        classVal = new ArrayList();
        classVal.add("Monday");
        classVal.add("Tuesday");
        classVal.add("Wednesday");
        classVal.add("Thursday");
        classVal.add("Friday");
        classVal.add("Saturday");
        classVal.add("Sunday");
        
        attributes.add(name);
        attributes.add(type);

        attributes.add(new Attribute("class", classVal));
        dataRaw = new Instances("TestInstances", attributes, 0);
        dataRaw.setClassIndex(dataRaw.numAttributes() - 1);
    }

      public Instances createInstance(double name, double type, double result) {
        dataRaw.clear();
        double[] instanceValue1 = new double[]{name, type, 0};
        dataRaw.add(new DenseInstance(1.0, instanceValue1));
        return dataRaw;
    }


    public String classifiy(Instances insts, String path) {
        String result = "Not classified!!";
        Classifier cls = null;
        try {
            cls = (MultilayerPerceptron) SerializationHelper.read(path);
            result = (String) classVal.get((int) cls.classifyInstance(insts.firstInstance()));
        } catch (Exception ex) {
            Logger.getLogger(ModelClassifier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }


    public Instances getInstance() {
        return dataRaw;
    }
}
