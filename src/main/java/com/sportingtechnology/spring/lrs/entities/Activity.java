package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;
import org.springframework.hateoas.server.core.Relation;

import java.util.List;
import java.util.Map;

@Relation(collectionRelation = "activities", itemRelation = "activity")
@Accessors(chain = true)
public class Activity {
    private @Getter @Setter @Id String id;
    private @Getter @Setter String type;
    private @Getter @Setter Map<String, String> name;
    private @Getter @Setter Map<String, String> description;
    private @Getter @Setter String moreInfo;
    private @Getter @Setter InteractionType interactionType;
    private @Getter @Setter List<String> correctResponsesPattern;
    private @Getter @Setter List<InteractionComponent> choices;
    private @Getter @Setter List<InteractionComponent> scale;
    private @Getter @Setter List<InteractionComponent> source;
    private @Getter @Setter List<InteractionComponent> target;
    private @Getter @Setter List<InteractionComponent> steps;
    private @Getter @Setter Map<String, Object> extensions;
}
