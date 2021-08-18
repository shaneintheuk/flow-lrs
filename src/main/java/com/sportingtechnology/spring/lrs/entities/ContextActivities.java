package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.hateoas.server.core.Relation;

import java.util.List;

@Relation(collectionRelation = "context_activities", itemRelation = "context_activity")
@Accessors(chain = true)
public class ContextActivities {
    private @Getter @Setter List<XapiObject> parent;
    private @Getter @Setter List<XapiObject> grouping;
    private @Getter @Setter List<XapiObject> category;
    private @Getter @Setter List<XapiObject> other;
}
