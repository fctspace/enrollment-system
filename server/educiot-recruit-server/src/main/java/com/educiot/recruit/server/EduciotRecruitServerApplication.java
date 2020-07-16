package com.educiot.recruit.server;

import com.educiot.recruit.common.api.APIRequest;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@MapperScan({"com.educiot.recruit.data.mapper"})
@ServletComponentScan(basePackages = {"com.educiot.recruit.common", "com.educiot.recruit.server"})
@SpringBootApplication(scanBasePackages = {"com.educiot.recruit.data", "com.educiot.recruit.server"})
public class EduciotRecruitServerApplication {

    @Value("${api.url}")
    private static String apiUrl;

    @LoadBalanced
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    public static void main(String[] args) {
        APIRequest.apiUrl = "http://47.112.129.244:8081/recruit";
        SpringApplication.run(EduciotRecruitServerApplication.class, args);
    }
}