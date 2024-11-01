package ru.netology;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CloudStorage {

    public static void main(String[] args) {
        SpringApplication.run(CloudStorage.class, args);
    }

}


// http://localhost:8080/login
// {"email":"alex", "password":"1234"}

// http://localhost:8080/file?filename=file1.txt


/*
http://localhost:8091/login
{"login":"alex", "password":"1234"}


eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbGV4IiwiZXhwIjoxNzMwNDc2MjYxLCJpZCI6NH0.E-8NKUUhtwscARl5hwwnaCxnB65-VtwrDoQv9XAeuiUO38MH4OSYE-nWnAJRMx6UODuLFuT1WJm5RQtk5Sx7sQ


http://localhost:8091/file?filename=file2.txt
 */