package test.sha1;

import util.SHA1;

/**
 *
 * @author freddhy
 */
public class SHA1Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        String pass = "";

        System.out.println("PASSWORD: " + pass);
        System.out.println("HASH: " + SHA1.getHash(pass));

        System.out.println("\n***************COMPROBACIÓN***************\n");

        System.out.println("PASSWORD: " + pass);
        System.out.println("HASH: " + SHA1.getHash(pass));
    }

}
