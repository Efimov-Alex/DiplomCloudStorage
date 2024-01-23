package ru.netology.service;


import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ru.netology.entity.User;
import ru.netology.repository.UserRepository;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public Optional<User> getByEmail(@NonNull String email) {
        return userRepository.findFirstByEmail(email);
    }
}