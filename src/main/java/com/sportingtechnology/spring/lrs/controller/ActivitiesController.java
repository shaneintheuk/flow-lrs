package com.sportingtechnology.spring.lrs.controller;

import com.sportingtechnology.spring.lrs.exception.LrsException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import uk.co.sportssoftware.account.IAccountService;
import uk.co.sportssoftware.account.valueobjects.SportsPersonVO;
import uk.co.sportssoftware.training.ITrainingService;
import uk.co.sportssoftware.training.valueobjects.TrainingActivityStateVO;
import uk.co.sportssoftware.training.valueobjects.TrainingDocumentVO;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;

@RestController
@RequestMapping(ApiEndpoints.ACTIVITIES_ENDPOINT)
public class ActivitiesController {

    private ITrainingService trainingService;
    private IAccountService accountService;

    static Logger logger = LogManager.getLogger(ActivitiesController.class);

    @GetMapping(value = "/state", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public @ResponseBody
    byte[] getActivitiesState(@RequestParam String activityId,
                                              @RequestParam String agent,
                                              @RequestParam String registration,
                                              @RequestParam String masterLicenseeId,
                                              @RequestParam(required = false) String stateId) {
        SportsPersonVO sportsPerson = getAccountService().findPerson(registration);
        TrainingDocumentVO trainingDocument = getTrainingService().findTrainingDocumentByActivityId(activityId, masterLicenseeId);
        TrainingActivityStateVO activityState = getTrainingService().findTrainingActivityState(stateId, trainingDocument.getTrainingDocumentId(), sportsPerson.getEntityAttributesId());

        byte[] returnBytes = new byte[0];

        if (activityState != null) {
            Byte[] value = activityState.getValue();

            returnBytes = new byte[value.length];

            int j=0;
            for(byte b: value)
            {
                returnBytes[j++] = b;
            }

            logger.info("Returning state value [" + sportsPerson.getName() + ":" + trainingDocument.getTrainingDocumentId() + ":" + stateId + "]");
        }

        return returnBytes;
    }

    @RequestMapping(value = "/state", method={RequestMethod.POST,RequestMethod.PUT})
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public @ResponseBody
    void putActivitiesState(@RequestParam String activityId,
                                              @RequestParam String agent,
                                              @RequestParam String registration,
                                              @RequestParam String masterLicenseeId,
                                              @RequestParam(required = false) String stateId,
                                              InputStream dataStream,
                                              HttpServletRequest request) throws LrsException {

        SportsPersonVO sportsPerson = getAccountService().findPerson(registration);
        TrainingDocumentVO trainingDocument = getTrainingService().findTrainingDocumentByActivityId(activityId, masterLicenseeId);

        byte[] value;
        try {
            value = new byte[dataStream.available()];
            dataStream.read(value);
        } catch (IOException e) {
            throw new LrsException("Failed to read bytes");
        }

        Byte[] data = new Byte[value.length];

        int j=0;
        for(byte b: value)
        {
            data[j++] = b;
        }

        TrainingActivityStateVO activityState = getTrainingService().findTrainingActivityState(stateId, trainingDocument.getTrainingDocumentId(), sportsPerson.getEntityAttributesId());

        if (activityState == null) {
            activityState = new TrainingActivityStateVO();
            activityState.setSportsPerson(sportsPerson);
            activityState.setTrainingDocument(trainingDocument);
            activityState.setState(stateId);
            activityState.setValue(data);

            getTrainingService().addTrainingActivityState(activityState);

            logger.info("Added a new state [" + sportsPerson.getName() + ":" + trainingDocument.getTrainingDocumentId() + ":" + stateId + "]");
        } else {
            activityState.setValue(data);

            getTrainingService().updateTrainingActivityState(activityState);

            logger.info("Updated state [" + sportsPerson.getName() + ":" + trainingDocument.getTrainingDocumentId() + ":" + stateId + "]");
        }
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
