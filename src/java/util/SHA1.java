package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author freddhy
 */
public class SHA1 {

    private static final String haskey = "54b59622e0d04";

    /**
     * Permite obtener el código Hash de una cadena de texto
     *
     * @param msg String
     * @return hash String
     */
    public static String getHash(String msg) {

        String hash = "";
        String message = msg + haskey;

        try {
            byte[] buffer = message.getBytes();
            MessageDigest md = MessageDigest.getInstance("SHA1");
            md.update(buffer);

            byte[] digest = md.digest();

            for (byte aux : digest) {
                int b = aux & 0xff;
                if (Integer.toHexString(b).length() == 1) {
                    hash += "0";
                }
                hash += Integer.toHexString(b);
            }
        } catch (NoSuchAlgorithmException nex) {

        }

        return hash;
    }
}
