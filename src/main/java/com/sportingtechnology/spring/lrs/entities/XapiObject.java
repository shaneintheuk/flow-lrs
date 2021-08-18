package com.sportingtechnology.spring.lrs.entities;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.data.annotation.Id;
import org.springframework.hateoas.server.core.Relation;

import java.util.Date;
import java.util.List;

@Relation(collectionRelation = "xapi_objects", itemRelation = "xapi_object")
@Accessors(chain = true)
public class XapiObject {
    private @Getter @Setter @Id String id;
    private @Getter @Setter String objectType;
    private @Getter @Setter Activity definition;
    private @Getter @Setter String name;
    private @Getter @Setter String mbox;
    private @Getter @Setter String mbox_sha1sum;
    private @Getter @Setter String openid;
    private @Getter @Setter List<Actor> member;
    private @Getter @Setter Account account;
    private @Getter @Setter Actor actor;
    private @Getter @Setter Verb verb;
    private @Getter @Setter @JsonProperty("object") XapiObject xapiObj;
    private @Getter @Setter Result result;
    private @Getter @Setter Context context;
    private @Getter @Setter Date timestamp;
    private @Getter @Setter List<Attachment> attachments;
}
