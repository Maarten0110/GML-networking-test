package logic;
import java.io.IOException;

import utility.Print;

public class Main {
	
	public final static int PORT = 6510;
	public final static int MAGIC_NUMBER = 1313131313;

	public static void main(String[] args) {

		// Try to start the server
		Server server = new Server(PORT);
		Print.withTime("Starting server...");
		try {
			server.launch();
			Print.withTime("Server started!");
		} catch (IOException e) {
			Print.withTime("Failed to start server:");
			e.printStackTrace();
		}
	}

}
