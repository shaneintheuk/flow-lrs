package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.hateoas.server.core.Relation;

import java.util.Map;

@Relation(collectionRelation = "verbs", itemRelation = "verb")
@Accessors(chain = true)
public class Verb {
    private @Getter @Setter Map<String, String> display;
    private @Getter @Setter String id;
}
