package logic;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import java.io.DataOutput;
import java.io.IOException;
import java.util.List;
import java.util.Arrays;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;

public class GMLOutputStreamTest {

	private GMLOutputStream out;
	private DataOutput byteWriter;
	ArgumentCaptor<Integer> capt;
	private Integer[][] bytes = 
		{
			{1},			      						// byte 1
	  		{4,     0},          						// short 4
	  		{11,   39,   0,   0},						// int 9995
	  	    {82,  -56, 121, -60},						// float -999.13
	  	    {-52,  93,  75, -56, -65, -20, -28, 64}    // double 42853.9932
		};
	
	@Before
	public void setup() {
		out = new GMLOutputStream(null);
		byteWriter = mock(DataOutput.class);
		out.setByteWriter(byteWriter);
		capt = ArgumentCaptor.forClass(Integer.class);
	}
	
	@Test
	public void writeS8test() throws IOException{
		out.writeS8((byte)1);
		verify(byteWriter).writeByte(capt.capture());
		Integer expected = bytes[0][0];
		Integer actual = capt.getValue();
		assertTrue(expected.equals(actual));
	}
	@Test
	public void writeS16test() throws IOException{
		out.writeS16((short)4);
		verify(byteWriter, times(2)).writeByte(capt.capture());
		List<Integer> expected = Arrays.asList(bytes[1]);
		List<Integer> actual = capt.getAllValues();
		assertTrue(expected.equals(actual));
	}
	@Test
	public void writeS32test() throws IOException{
		out.writeS32((int)9995);
		verify(byteWriter, times(4)).writeByte(capt.capture());
		List<Integer> expected = Arrays.asList(bytes[2]);
		List<Integer> actual = capt.getAllValues();
		assertTrue(expected.equals(actual));
	}
	@Test
	public void writeF32test() throws IOException{
		out.writeF32((float)-999.13);
		verify(byteWriter, times(4)).writeByte(capt.capture());
		List<Integer> expected = Arrays.asList(bytes[3]);
		List<Integer> actual = capt.getAllValues();
		assertTrue(expected.equals(actual));
	}
	@Test
	public void writeF64test() throws IOException{
		out.writeF64((double)42853.9932);
		verify(byteWriter, times(8)).writeByte(capt.capture());
		List<Integer> expected = Arrays.asList(bytes[4]);
		List<Integer> actual = capt.getAllValues();
		assertTrue(expected.equals(actual));
	}
}
