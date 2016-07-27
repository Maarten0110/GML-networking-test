package logic;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import utility.Print;

public class ClientHandler implements Runnable{

	private Socket socket;
	private GMLInputStream streamIn;
	private GMLOutputStream streamOut;
	private Thread thread;
	private boolean running = false;
	
	public ClientHandler(Socket socket) {
		thread = new Thread(this);
		this.socket = socket;
	}
	
	public void launch() throws IOException {
		streamIn = new GMLInputStream(socket.getInputStream());
		streamOut = new GMLOutputStream(socket.getOutputStream());
		running = true;
		thread.start();
	}
	
	@Override
	public void run() {
		try {
			streamOut.writeString("HalloHalloHallo");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		while (running) {
			try {
				Print.withTime(""+streamIn.readString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
