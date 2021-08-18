package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.hateoas.server.core.Relation;

@Relation(collectionRelation = "results", itemRelation = "result")
@Accessors(chain = true)
public class Result {
    private @Getter @Setter Score score;
    private @Getter @Setter Boolean success;
    private @Getter @Setter Boolean completion;
    private @Getter @Setter String response;
    private @Getter @Setter String duration;
    private @Getter @Setter Object extension;
}
