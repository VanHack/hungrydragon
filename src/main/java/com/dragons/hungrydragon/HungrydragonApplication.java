package com.dragons.hungrydragon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * @author Fahad Ahmed
 */
@SpringBootApplication
@EnableJpaRepositories(value = "/rest/")
@ComponentScan(value = "com.dragons.hungrydragon")
public class HungrydragonApplication {

	public static void main(String[] args) {
		SpringApplication.run(HungrydragonApplication.class, args);
	}
}
