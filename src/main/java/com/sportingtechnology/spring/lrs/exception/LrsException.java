package com.sportingtechnology.spring.lrs.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value= HttpStatus.INTERNAL_SERVER_ERROR, reason="LRS Exception") //404
public class LrsException
        extends Exception {

    private static final long serialVersionUID = -3332292346834265371L;

    public LrsException(String exception){
        super(exception);
    }
}
