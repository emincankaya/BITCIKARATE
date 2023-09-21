package helpers;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.util.Base64;

public class PasswordEncp {





        public static String [] easEncryptString() {

            String [] result = new String[2];

            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            Long timest = timestamp.getTime();
            String times = timest.toString();
            String  password="Test1234*";
            String text=password+";"+ times;

            String paramKey ="KiGIWUgZU6G!EAQ0SyV3vdsMLISzJRHC";
            String paramIV="AJAbTBQQP7vDv2es";





            try {
                byte[] key = paramKey.getBytes(StandardCharsets.UTF_8);
                byte[] iv = paramIV.getBytes(StandardCharsets.UTF_8);

                SecretKeySpec secretKeySpec = new SecretKeySpec(key, "AES");
                IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);

                byte[] encryptedBytes = cipher.doFinal(text.getBytes(StandardCharsets.UTF_8));

                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                outputStream.write(iv);
                outputStream.write(encryptedBytes);
                byte[] result1 = outputStream.toByteArray();

                String Encodingstr = Base64.getEncoder().encodeToString(result1);

                result [0] = Encodingstr;

                result[1] = times;

                return result;

            } catch (Exception e) {
                e.printStackTrace();
                return null; // Hata durumunda null dönebilirsiniz veya hata yönetimini isteğinize göre düzenleyebilirsiniz.
            }
        }
}
