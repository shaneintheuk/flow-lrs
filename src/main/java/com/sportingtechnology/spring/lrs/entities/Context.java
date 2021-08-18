package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.hateoas.server.core.Relation;

@Relation(collectionRelation = "contexts", itemRelation = "context")
@Accessors(chain = true)
public class Context {
    private @Getter @Setter String registration;
    private @Getter @Setter Actor instructor;
    private @Getter @Setter Actor team;
    private @Getter @Setter ContextActivities contextActivities;
    private @Getter @Setter String revision;
    private @Getter @Setter String platform;
    private @Getter @Setter String language;
    private @Getter @Setter StatementRef statement;
    private @Getter @Setter Object extension;
}
