package com.sportingtechnology.spring.lrs.entities;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;
import org.springframework.hateoas.server.core.Relation;

import java.util.Date;
import java.util.List;

@Relation(collectionRelation = "statements", itemRelation = "statement")
@Accessors(chain = true)
public class Statement {
    private @Getter @Setter @Id String id;
    private @Getter @Setter Actor actor;
    private @Getter @Setter Verb verb;
    private @Getter @Setter @JsonProperty("object") XapiObject xapiObj;
    private @Getter @Setter Result result;
    private @Getter @Setter Context context;
    private @Getter @Setter
    Date timestamp;
    private @Getter @Setter String stored;
    private @Getter @Setter Actor authority;
    private @Getter @Setter String version;
    private @Getter @Setter List<Attachment> attachments;
}
