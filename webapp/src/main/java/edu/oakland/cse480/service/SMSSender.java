package edu.oakland.cse480.service;

import edu.oakland.cse480.mvc.models.TwilioInfo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import org.apache.http.message.BasicNameValuePair;
import org.apache.http.NameValuePair;
import java.util.*; 
import javax.annotation.Resource;
import com.twilio.sdk.*; 
import com.twilio.sdk.resource.factory.*; 
import com.twilio.sdk.resource.instance.*; 
import com.twilio.sdk.resource.list.*;

@Service
public class SMSSender {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Resource(name="twilioInfo")
    TwilioInfo twilioInfo;

    public void SendSMS(String phoneNumber, String drinkName) {
        try {
            TwilioRestClient client = new TwilioRestClient(TwilioInfo.ACCOUNT_SID, TwilioInfo.AUTH_TOKEN);

            // Build a filter for the MessageList
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("Body", "Jenny please?! I love you <3"));
            params.add(new BasicNameValuePair("To", phoneNumber));
            params.add(new BasicNameValuePair("From", TwilioInfo.NUMBER));


            MessageFactory messageFactory = client.getAccount().getMessageFactory();
            Message message = messageFactory.create(params);
        } catch (TwilioRestException e) {
            log.error("{}", e.getMessage());
        } catch(Exception e2) {
            log.error("", e2);
        }
    }
}
