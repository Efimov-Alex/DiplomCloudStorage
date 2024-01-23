package ru.netology.service;


import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import ru.netology.component.Login;
import ru.netology.dto.JwtAuthentication;
import ru.netology.dto.JwtRequest;
import ru.netology.entity.User;

import javax.security.auth.message.AuthException;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final UserService userService;
    private final JwtProvider jwtProvider;

    public Login login(@NonNull JwtRequest authRequest) throws AuthException {
        final User user = userService.getByEmail(authRequest.getEmail())
                .orElseThrow(() -> new AuthException("Пользователь не найден"));
        if (user.getPassword().equals(authRequest.getPassword())) {
            final String accessToken = jwtProvider.generateAccessToken(user);
            return new Login(accessToken);
        } else {
            throw new AuthException("Неправильный пароль");
        }
    }

}