import com.oracle.shubook.util.MD5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class Test {
    public static void main (String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String srt = "admin";
        System.out.println(MD5Util.getEncryptedPwd(srt));
    }
}
