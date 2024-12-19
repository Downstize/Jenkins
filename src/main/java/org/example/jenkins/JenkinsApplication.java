package org.example.jenkins;

import org.example.jenkins.Controller.HelloWorldController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class JenkinsApplication {

    public static void main(String[] args) {
        var context = SpringApplication.run(JenkinsApplication.class, args);

        HelloWorldController helloWorldController = context.getBean(HelloWorldController.class);
        String message = helloWorldController.sayHello();
        System.out.println("HelloWorldController output: " + message);
    }
}
