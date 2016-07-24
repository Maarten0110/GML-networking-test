package logic;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import utility.Print;

public class Server implements Runnable{
	
	private ServerSocket serverSocket;
	private boolean running = false;
	private int port;
	private Thread thread;
	
	public Server(int port) {
		this.port = port;
	}

	// Launch the server.
	public void launch() throws IOException {
		serverSocket = new ServerSocket(port);
		thread = new Thread(this);
		thread.start();
		running = true;
	}
	
	// Listen for connecting clients
	@Override
	public void run() {
		while (running) {
			try {
				Socket socket = serverSocket.accept();
				ClientHandler clientHandler = new ClientHandler(socket);
				clientHandler.launch();
				Print.withTime("A new connection was made.");
			} catch (IOException e) {
				Print.withTime("Exception occured while accepting a new connection:");
				e.printStackTrace();
			}
		}
	}
	
	// Shutdown the server.
	public void shutdown() throws IOException {
		running = false;
		serverSocket.close();
	}
	
	// Return true if the server is running.
	public boolean isRunning(){
		return running;
	}

}
