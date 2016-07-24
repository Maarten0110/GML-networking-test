package logic;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.io.DataInput;

public class GMLInputStream {

	private static ByteBuffer bb;
	private DataInput byteReader;
	
	public GMLInputStream(InputStream in) {
		bb = ByteBuffer.allocate(8);
		bb.order(ByteOrder.LITTLE_ENDIAN);
		byteReader = new DataInputStream(in);
	}
	
	private void prepare(int bytes) throws IOException {
		bb.clear();
		for (int i=0; i<bytes; i++)
			bb.put((byte)byteReader.readByte());
		bb.rewind();
	}
	
	public byte readS8() throws IOException {
		prepare(1);
		return bb.get();
	}

	public short readS16() throws IOException {
		prepare(2);
		return bb.getShort();
	}
	
	public int readS32() throws IOException {
		prepare(4);
		return bb.getInt();
	}
	
	public float readF32() throws IOException {
		prepare(4);
		return bb.getFloat();
	}
	
	public double readF64() throws IOException {
		prepare(8);
		return bb.getDouble();
	}
	
	public String readString() throws IOException {
		String result = "";
		byte b = byteReader.readByte();
		while (b != 0) {
			result += (char)b;
			b = byteReader.readByte();
		}
		return result;
	}
	
	public void setByteReader(DataInput byteReader) {
		this.byteReader = byteReader;
	}
}
