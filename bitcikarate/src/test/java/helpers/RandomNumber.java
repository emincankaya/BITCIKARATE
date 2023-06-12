package helpers;

import java.util.Random;

public class RandomNumber {

    public static Integer getRandom() {
        Random random=new Random();
        int i=random.nextInt(10);
        return i;

    }


}
