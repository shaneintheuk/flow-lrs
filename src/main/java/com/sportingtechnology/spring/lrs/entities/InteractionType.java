package com.sportingtechnology.spring.lrs.entities;

public enum InteractionType {
    TRUEFALSE ("true-false"),
    CHOICE("choice"),
    FILLIN("fill-in"),
    LONGFILLIN("long-fill-in"),
    MATCHING("matching"),
    PERFORMANCE("performance"),
    SEQUENCING("sequencing"),
    LIKERT("likert"),
    NUMERIC("numeric"),
    OTHER("other");

    public final String label;

    private InteractionType(String label) {
        this.label = label;
    }
}
