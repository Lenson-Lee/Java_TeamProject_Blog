package com.project.blog.common.upload;

import org.junit.jupiter.api.Test;

import java.util.UUID;

class FileUtilsTest {

    @Test
    void uuidTest() {

        String fileName = "dog.jpg";
        String newFileName = UUID.randomUUID().toString() + "_" + fileName;

        System.out.println("newFileName = " + newFileName);
    }

}