package helpers;

public class CalculatePrice {

    public static Double Calculate(int i,String s) {
        double price = 0.12;
        if (i == 1 & s.equals("g")) {

            price = price + 0.05;



       }
        return price;



   }

}
