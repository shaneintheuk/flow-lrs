package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;
import org.springframework.hateoas.server.core.Relation;

import java.util.Map;

@Relation(collectionRelation = "interaction_components", itemRelation = "interaction_component")
@Accessors(chain = true)
public class InteractionComponent {
    private @Getter @Setter @Id String id;
    private @Getter @Setter Map<String, String> description;
}
