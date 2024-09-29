package com.edtech.configs;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.edtech.models.User;
import com.edtech.repositories.UserRepository;

@Configuration
public class UserConfig {

	@Bean
	CommandLineRunner clr(UserRepository userRepo) {
		return args -> {
			User u1 = new User();
			u1.setEmail("prasad07143.vrsec@gmail.com");
			u1.setUsername("prasad07143");
			u1.setPassword("prasad07143");
			u1.setRole("LEARNER");
			if (!userRepo.existsByEmail("prasad07143.vrsec@gmail.com"))
				userRepo.save(u1);
		};
	}
}
