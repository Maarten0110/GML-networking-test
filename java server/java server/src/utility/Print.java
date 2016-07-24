package utility;

import java.time.LocalDateTime;

public class Print {

	// Prints the given message preceded with the current time
	public static void withTime(String message) {
		LocalDateTime date = LocalDateTime.now();
		System.out.println("[" + date.toString() + "] " + message);
	}
}
