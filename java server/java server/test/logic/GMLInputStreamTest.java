package logic;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import java.io.IOException;
import java.io.DataInput;
import org.junit.Before;
import org.junit.Test;

public class GMLInputStreamTest {

	private final double ERROR = 1E-99;
	private GMLInputStream in;
	private DataInput byteReader;
	private byte[] bytes = 
		{
			 1,			      						// byte 1
	  		 4,   0,          						// short 4
	  		11,  39,   0,   0,						// int 9995
	  		82, -56, 121, -60,						// float -999.13
	  	   -52,  93,  75, -56, -65, -20, -28, 64    // double 42853.9932
		};
	
	private void assertEqualsFloatingPoint(double a, double b) {
		assertTrue(Math.abs(a-b)<ERROR);
	}
	@Before
	public void setup() throws IOException {
		in = new GMLInputStream(null);
		byteReader = mock(DataInput.class);
		in.setByteReader(byteReader);
	}

	@Test
	public void readS8Test() throws IOException{
		when(byteReader.readByte())
			.thenReturn(bytes[0]);
		assertTrue((byte)1 == in.readS8());
	}
	
	@Test
	public void readS16Test() throws IOException{
		when(byteReader.readByte())
			.thenReturn(bytes[1])
			.thenReturn(bytes[2]);
		assertTrue((short)4 == in.readS16());
	}
	@Test
	public void readS32Test() throws IOException{
		when(byteReader.readByte())
			.thenReturn(bytes[3])
			.thenReturn(bytes[4])
			.thenReturn(bytes[5])
			.thenReturn(bytes[6]);
		assertTrue((int)9995 == in.readS32());
	}
	@Test
	public void readF32Test() throws IOException{
		when(byteReader.readByte())
			.thenReturn(bytes[7])
			.thenReturn(bytes[8])
			.thenReturn(bytes[9])
			.thenReturn(bytes[10]);
		assertEqualsFloatingPoint((float)-999.13, in.readF32());
	}
	@Test
	public void readF64Test() throws IOException{
		when(byteReader.readByte())
			.thenReturn(bytes[11])
			.thenReturn(bytes[12])
			.thenReturn(bytes[13])
			.thenReturn(bytes[14])
			.thenReturn(bytes[15])
			.thenReturn(bytes[16])
			.thenReturn(bytes[17])
			.thenReturn(bytes[18]);
		assertEqualsFloatingPoint((double)42853.9932, in.readF64());
	}
	
}
