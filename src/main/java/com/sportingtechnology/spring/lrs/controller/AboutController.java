package com.sportingtechnology.spring.lrs.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(ApiEndpoints.ABOUT_ENDPOINT)
public class AboutController {

    static Logger logger = LogManager.getLogger(AboutController.class);

    @GetMapping(value = "", produces = MediaType.TEXT_PLAIN_VALUE)
    public @ResponseBody
    ResponseEntity<String> updateTrainingDocumentStatus() {
       return ResponseEntity.ok("FLOW LRS version 1.0");
    }
}
