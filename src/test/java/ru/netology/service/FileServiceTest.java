package ru.netology.service;


import io.restassured.http.ContentType;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;

import org.junit.runner.RunWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;

import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;

import org.springframework.test.web.servlet.request.MockMultipartHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import org.springframework.web.context.WebApplicationContext;
import ru.netology.config.FileUploadProperties;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static io.restassured.RestAssured.given;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.BDDMockito.then;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@ExtendWith(MockitoExtension.class)
@WebAppConfiguration
//@SpringBootTest

public class FileServiceTest {

    private FileService fileService;
    private String filename;


    MockMvc mockMvc;

    @Autowired
    private WebApplicationContext webApplicationContext;

    MockMultipartFile sampleFile;

    @BeforeEach
    public void initEach() {
        fileService = new FileService(FileUploadProperties.builder().location("./upload").build());
        fileService.init();

        filename = "testFile";

        sampleFile = new MockMultipartFile(
                "uploaded-file",
                filename,
                "./upload",
                "Test File".getBytes());


    }

    @Test
    public void testUpload() throws Exception {
        fileService.upload(filename, sampleFile);
        Assertions.assertTrue(fileService.delete(filename));

    }

    @Test
    public void testDelete() {
        fileService.upload(filename, sampleFile);
        Assertions.assertTrue(fileService.delete(filename));
    }

    @Test
    public void testChange() {
        fileService.upload(filename, sampleFile);
        Assertions.assertTrue(fileService.change(filename, "anotherName"));
        fileService.delete("anotherName");
    }


}