/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dragons.hungrydragon.ml;

import com.dragons.hungrydragon.ml.ModelGenerator;
import java.io.File;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 *
 * @author Marcio
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ModelGeneratorTests extends ModelGenerator {

    @Test
    public void loadDatasetWithInvalidPath() {
        assertNull(super.loadDataset("/invalid-path/file.arff"));
    }

    @Test
    public void loadDatasetWithValidPath() {
        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("ml/food.arff").getFile());
        assertNotNull(file.getAbsolutePath());
    }
}
