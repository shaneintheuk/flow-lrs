package com.sportingtechnology.spring.lrs.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.hateoas.server.core.Relation;

import java.util.Map;

@Relation(collectionRelation = "attachments", itemRelation = "attachment")
@Accessors(chain = true)
public class Attachment {
    private @Getter @Setter String usageType;
    private @Getter @Setter Map<String, String> display;
    private @Getter @Setter Map<String, String> description;
    private @Getter @Setter String contentType;
    private @Getter @Setter Integer length;
    private @Getter @Setter String sha2;
    private @Getter @Setter String fileUrl;
}
