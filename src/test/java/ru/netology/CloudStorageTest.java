package ru.netology;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.util.TestPropertyValues;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import ru.netology.component.Login;
import ru.netology.controller.AuthController;

import ru.netology.dto.JwtRequest;
import ru.netology.entity.User;
import ru.netology.repository.UserRepository;


// ru.netology.ServerJwtApplicationTest

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
                    String.format("spring.datasource.url=jdbc:postgresql://localhost:5432/postgres"),
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
    public static void tearDown() {
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

    @DisplayName("JUnit test for testLoginController")
    @Test
    void testLoginController() {
        ResponseEntity<Login> login = authController.login(new JwtRequest("alex", "1234"));
        Assertions.assertNotNull(login.getBody().getAccessToken());
    }
}