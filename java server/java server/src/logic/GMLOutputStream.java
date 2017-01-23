package logic;

import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class GMLOutputStream {

	private ByteBuffer bb;
	private DataOutput byteWriter;
	
	public GMLOutputStream(OutputStream out) {
		bb = ByteBuffer.allocate(8);
		bb.order(ByteOrder.LITTLE_ENDIAN);
		byteWriter = new DataOutputStream(out);
	}
	
	private void write(int bytes) throws IOException {
		bb.rewind();
		for (int i=0; i<bytes; i++)
			byteWriter.writeByte(bb.get());
		bb.clear();
	}
	
	public void writeS8(byte S8) throws IOException{
		byteWriter.writeByte(S8);
	}
	
	public void writeS16(short S16) throws IOException{
		bb.putShort(S16);
		write(2);
	}
	
	public void writeS32(int S32) throws IOException{
		bb.putInt(S32);
		write(4);
	}
	
	public void writeF32(float F32) throws IOException{
		bb.putFloat(F32);
		write(4);
	}
	public void writeF64(double F64) throws IOException{
		bb.putDouble(F64);
		write(8);
	}
	public void writeString(String string) throws IOException {
		for (int i=0; i<string.length(); i++){
			char c = string.charAt(i);
			byteWriter.writeByte((byte)c);
		}
		byteWriter.writeByte((byte)0);
	}
	
	public void flush() throws IOException {
		((DataOutputStream)byteWriter).flush();
	}
	
	public void setByteWriter(DataOutput byteWriter) {
		this.byteWriter = byteWriter;
	}
}
