package logic;

import utility.Print;

public class RequestHandler {
	
	private static final short PUT_NAME = 0;
	
	public static void handleRequest(short request, GMLInputStream in, GMLOutputStream out) {
		switch (request) {
			case PUT_NAME: handlePutName(in, out); break;
			default: Print.withTime("Recieved an unkown request.");
		}
	}
	
	private static void handlePutName(GMLInputStream in, GMLOutputStream out) {
		
	}
}
