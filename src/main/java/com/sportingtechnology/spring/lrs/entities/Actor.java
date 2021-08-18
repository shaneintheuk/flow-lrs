package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;
import org.springframework.hateoas.server.core.Relation;

import java.util.List;
import java.util.Map;

@Relation(collectionRelation = "actors", itemRelation = "actor")
@Accessors(chain = true)
public class Actor {
    private @Getter @Setter @Id String id;
    private @Getter @Setter String objectType;
    private @Getter @Setter String name;
    private @Getter @Setter String mbox;
    private @Getter @Setter String mbox_sha1sum;
    private @Getter @Setter String openid;
    private @Getter @Setter List<Actor> member;
    private @Getter @Setter Account account;
}
