package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.hateoas.server.core.Relation;

@Relation(collectionRelation = "statement_refs", itemRelation = "statement_ref")
@Accessors(chain = true)
public class StatementRef {
    private @Getter @Setter String id;
    private @Getter @Setter String objectType;
}
