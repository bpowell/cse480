package edu.oakland.cse480.mvc.models;

public class TwilioInfo {
    public static String ACCOUNT_SID;
    public static String AUTH_TOKEN;
    public static String NUMBER;

    public TwilioInfo(String sid, String token, String number) {
        this.ACCOUNT_SID = sid;
        this.AUTH_TOKEN = token;
        this.NUMBER = number;
    }
}
