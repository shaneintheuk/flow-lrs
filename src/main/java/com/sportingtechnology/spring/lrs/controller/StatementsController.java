package com.sportingtechnology.spring.lrs.controller;

import com.sportingtechnology.spring.lrs.entities.Statement;
import com.sportingtechnology.spring.lrs.entities.XapiObject;
import com.sportingtechnology.spring.lrs.exception.LrsException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import uk.co.sportssoftware.account.IAccountService;
import uk.co.sportssoftware.account.valueobjects.SportsPersonVO;
import uk.co.sportssoftware.training.ITrainingService;
import uk.co.sportssoftware.training.valueobjects.TrainingDocumentVO;
import uk.co.sportssoftware.training.valueobjects.TrainingStatementVO;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@RestController
@RequestMapping(ApiEndpoints.STATEMENTS_ENDPOINT)
public class StatementsController {
    static Logger logger = LogManager.getLogger(StatementsController.class);

    private ITrainingService trainingService;
    private IAccountService accountService;

    @PostMapping(value = "", consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    ResponseEntity<List<String>> postStatements(InputStream dataStream,
                                                @RequestParam String masterLicenseeId,
                                                HttpServletRequest request) throws LrsException {
        logger.info("Adding " + "datastream" + " statements");

        List<String> statementIds = new ArrayList<>();

        // Needs to return an array of identifiers
        return ResponseEntity.ok(statementIds);
    }

    @PutMapping(value = "", consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public @ResponseBody
    void putStatement(@RequestBody Statement statement,
                      @RequestParam String masterLicenseeId,
                                              HttpServletRequest request) throws LrsException {
        addStatement(statement, masterLicenseeId, request);
    }

    private TrainingStatementVO addStatement(Statement statement, String masterLicenseeId, HttpServletRequest request) throws LrsException {
        SportsPersonVO sportsPerson = getAccountService().findPerson(statement.getContext().getRegistration());

        String activityId = null;
        if ("activity".equals(statement.getXapiObj().getObjectType().toLowerCase(Locale.ROOT)) && statement.getContext().getContextActivities() != null &&  statement.getContext().getContextActivities().getParent() != null) {
            activityId = statement.getContext().getContextActivities().getParent().iterator().next().getId();
        } else if (statement.getContext().getContextActivities() != null && statement.getContext().getContextActivities().getGrouping() != null) {
            for (XapiObject xapiObject : statement.getContext().getContextActivities().getGrouping()) {
                if ("activity".equals(xapiObject.getObjectType().toLowerCase(Locale.ROOT))) {
                    activityId = xapiObject.getId();
                    if (activityId != null) {
                        break;
                    }
                }
            }
        } else {
            activityId = statement.getXapiObj().getId();
        }

        TrainingDocumentVO trainingDocument = getTrainingService().findTrainingDocumentByActivityId(activityId, masterLicenseeId);

        if (trainingDocument == null) {
            throw new LrsException("Failed to find training document for statement activity");
        }

        TrainingStatementVO foundStatement = getTrainingService().findTrainingActivityStatement(statement.getId(), trainingDocument.getTrainingDocumentId(), sportsPerson.getEntityAttributesId());

        if (foundStatement == null) {

            getTrainingService().findOrAddTrainingVerb(statement.getVerb().getId(), statement.getVerb().getDisplay());

            TrainingStatementVO trainingStatement = new TrainingStatementVO();
            trainingStatement.setStatementId(statement.getId());
            trainingStatement.setTrainingDocument(trainingDocument);
            trainingStatement.setSportsPerson(sportsPerson);
            trainingStatement.setObjectName(getObjectName(statement.getXapiObj().getDefinition().getName(), trainingDocument, request));
            trainingStatement.setObjectId(statement.getXapiObj().getId());
            trainingStatement.setObjectType(statement.getXapiObj().getObjectType());
            trainingStatement.setTimestamp(statement.getTimestamp());
            trainingStatement.setVerbName(getObjectName(statement.getVerb().getDisplay(), trainingDocument, request));
            trainingStatement.setVerbId(statement.getVerb().getId());

            logger.info("Added a new statement [" + sportsPerson.getName() + ":" + trainingDocument.getTrainingDocumentId() + ":" + statement.getId() + "]");

            return getTrainingService().addTrainingStatement(trainingStatement);

        } else {
            logger.info("Statement already exists");
        }

        return null;
    }

    private String getObjectName(Map<String, String> map, TrainingDocumentVO trainingDocument, HttpServletRequest request) throws LrsException {
        String objectName = map.get(trainingDocument.getLmsActivityLanguage());

        if (objectName == null) {
            // We can occasionally get this issue where it is saved in config usd en-us and comes back as en-US in the statement
            for (String key : map.keySet()) {
                if (key.toLowerCase(Locale.ROOT).equals(trainingDocument.getLmsActivityLanguage().toLowerCase(Locale.ROOT))) {
                    objectName = map.get(key);
                }
            }
        }

        if (objectName == null) {
            objectName = map.get("und");
        }

        if (objectName == null && map.keySet().size() == 1) {
            objectName = map.get(map.keySet().iterator().next());
        }

        if (objectName == null) {
            throw new LrsException("Failed to find object name for language " + trainingDocument.getLmsActivityLanguage());
        }

        return objectName;
    }

    public ITrainingService getTrainingService() {
        return trainingService;
    }

    @Autowired
    public void setTrainingService(ITrainingService trainingService) {
        this.trainingService = trainingService;
    }

    public IAccountService getAccountService() {
        return accountService;
    }

    @Autowired
    public void setAccountService(IAccountService accountService) {
        this.accountService = accountService;
    }
}
