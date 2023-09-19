package helpers;

import java.sql.Timestamp;

public class TimeStamp {

    public String ts() {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Long timeStampStr = timestamp.getTime();
        String tst = timeStampStr.toString();
        System.out.println(tst);
        return tst;


    }

}