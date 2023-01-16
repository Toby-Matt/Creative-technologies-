   /**
   ENEL599 2022 -  Final Assignment
   this promgram uses an LDR to detect the daylight in the room,
   after the light gets below the threshhold a 12v led strip turns on
   after checking with processing if its ok to activate the lights


   @author Toby Matthews 21150297 ENEL599
*/
import processing.serial.*;// librarys 
import javax.swing.*;
Serial serialPort;//serial communication 

int allowed;

void setup()
{
  String serialPortName = selectSerialPort("insert your portname");
  size(400, 400);//basicaly the button size
  if (serialPortName == null)// if you dont enter one 
  {
    System.exit(0);
  }
  // open serial port
  serialPort = new Serial(this, serialPortName, 115200);
}
void draw()
{
  textSize(64);
  background(100);
  text("Click to allow lights?", width / 2, height / 2 - 40);
  serialPort.write(allowed); //constantly saying the value of the int
  if(allowed == 1)
  {
      background(255, 255, 0); //make it yellow
      text("on", width / 2, height / 2 - 40);
  }
  else
  {
    text("off", width / 2, height / 2 - 40);
    background(0); //make it black
  }
}
void mousePressed(){
  allowed += 1; 
  if (allowed > 1){allowed = 0;} // basically a yes or no.
}
