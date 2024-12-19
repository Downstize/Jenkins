package org.example.jenkins.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {
    private static final Logger logger = LoggerFactory.getLogger(HelloWorldController.class);

    @GetMapping("/")
    public String sayHello() {
        String message = "Hello, World! It's my second time when i'm introduce myself. My name is Slava and i'm turtle!";
        logger.info("Method sayHello was called. Message: {}", message);
        return message;
    }
}
