package MD5;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
    public static void main(String[] args) {
        String input = "Hello, World!"; // The string to calculate the MD5 hash for

        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // Add the input string bytes to the digest
            md.update(input.getBytes());

            // Get the MD5 hash bytes
            byte[] mdBytes = md.digest();

            // Convert the bytes to hexadecimal representation
            StringBuilder sb = new StringBuilder();
            for (byte mdByte : mdBytes) {
                sb.append(Integer.toString((mdByte & 0xff) + 0x100, 16).substring(1));
            }

            // Print the MD5 hash
            System.out.println("MD5 Hash: " + sb.toString());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
}