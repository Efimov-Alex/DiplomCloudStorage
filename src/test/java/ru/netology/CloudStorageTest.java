package ru.netology;


import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.*;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.util.TestPropertyValues;

import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;

import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;

import org.testcontainers.containers.PostgreSQLContainer;

import org.testcontainers.junit.jupiter.Testcontainers;
import ru.netology.component.Login;
import ru.netology.controller.AuthController;

import ru.netology.dto.JwtRequest;
import ru.netology.entity.User;
import ru.netology.repository.UserRepository;


@Testcontainers
@SpringBootTest()
@ContextConfiguration(initializers = CloudStorageTest.EnvInitializer.class)
class CloudStorageTest {

    @Autowired
    private UserRepository repository;
    @Autowired
    private AuthController authController;
    private static final PostgreSQLContainer<?> psql = new PostgreSQLContainer<>()
            .withUsername("root1")
            .withPassword("123")
            .withExposedPorts(5432);

    static class EnvInitializer implements ApplicationContextInitializer<ConfigurableApplicationContext> {
        @Override
        public void initialize(@NotNull ConfigurableApplicationContext applicationContext) {
            TestPropertyValues.of(
                    String.format("spring.datasource.url=jdbc:postgresql://localhost:5432/netology_diplom3"),
                    "spring.datasource.username=root1",
                    "spring.datasource.password=123"
            ).applyTo(applicationContext);
        }
    }

    @BeforeAll
    public static void setUp() {
        psql.withReuse(true);
        psql.start();
    }

    @AfterAll
    public static void setDown() {
        psql.stop();
    }

    @BeforeEach
    void init() {
        repository.save(
                User.builder()
                        .id(2L)
                        .login("alex")
                        .password("1234")
                        .build()
        );
    }


    @Test
    void testLoginController() {
        ResponseEntity<Login> login = authController.login(new JwtRequest("alex", "1234"));
        Assertions.assertNotNull(login.getBody().getAccessToken());
    }
}