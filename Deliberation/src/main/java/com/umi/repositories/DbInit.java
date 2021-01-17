package com.umi.repositories;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.umi.authentication.User;

import java.util.Arrays;
import java.util.List;

@Service
public class DbInit implements CommandLineRunner {
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    public DbInit(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        // Delete all
//        this.userRepository.deleteAll();
//
//        // Crete users
//        User dan = new User("dan",passwordEncoder.encode("dan123"),"RESPONSABLE","");
//        User admin = new User("admin",passwordEncoder.encode("admin123"),"ADMIN","ACCESS_TEST1,ACCESS_TEST2");
//        User prof = new User("prof",passwordEncoder.encode("prof123"),"PROF","ACCESS_TEST1");
////  	User aliBekri = new User("ali.bekri", passwordEncoder.encode("Fm32fd70b*-"), "PROF", "ACCESS_TEST1");
//        List<User> users = Arrays.asList(dan,admin, prof);
////    	User yassine = new User("yassine",passwordEncoder.encode("2151989__nokia"),"ADMIN","");
////    	userRepository.save(yassine);
////        // Save to db
//        this.userRepository.saveAll(users);
    }
}