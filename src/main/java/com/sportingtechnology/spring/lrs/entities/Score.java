package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.hateoas.server.core.Relation;

@Relation(collectionRelation = "scores", itemRelation = "score")
@Accessors(chain = true)
public class Score {
    private @Getter @Setter Double scaled;
    private @Getter @Setter Double raw;
    private @Getter @Setter Double min;
    private @Getter @Setter Double max;
}
