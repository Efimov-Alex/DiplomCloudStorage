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