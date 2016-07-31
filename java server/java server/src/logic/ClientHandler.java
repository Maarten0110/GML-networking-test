package logic;

import java.io.IOException;
import java.net.Socket;
import java.nio.ByteBuffer;

import utility.Print;

public class ClientHandler implements Runnable{

	private Socket socket;
	private GMLInputStream in;
	private GMLOutputStream out;
	private Thread thread;
	private boolean running = false;
	
	public ClientHandler(Socket socket) {
		thread = new Thread(this);
		this.socket = socket;
	}
	
	public void launch() throws IOException {
		in = new GMLInputStream(socket.getInputStream());
		out = new GMLOutputStream(socket.getOutputStream());
		running = true;
		thread.start();
	}
	
	@Override
	public void run() {
		while (running) {
			try {
				int magicNumber = in.readS32();
				if (magicNumber != Main.MAGIC_NUMBER) {
					throw new Exception("Message did not start with the magic number, but: " + magicNumber + ".");
				}
				short request = in.readS16();
				RequestHandler.handleRequest(request, in, out);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				Print.withTime(e.getMessage());
				e.printStackTrace();
			}
		}
	}

}
