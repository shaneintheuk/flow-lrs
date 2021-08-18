package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.hateoas.server.core.Relation;

@Relation(collectionRelation = "accounts", itemRelation = "account")
@Accessors(chain = true)
public class Account {
    private @Getter @Setter String homePage;
    private @Getter @Setter String name;
}
