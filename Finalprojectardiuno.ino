/**
   ENEL599 2022 -  Final Assignment
   
   this promgram uses an LDR to detect the daylight in the room,
   after the light gets below the threshhold a 12v led strip turns on
   after checking with processing if its ok to activate the lights
   
   @author Toby Matthews 21150297 ENEL599
*/
const int SENSOR_IN = A0;
const int LED = 11;

int lightValue;//whats value of LDR
boolean night = false;// Have we ented the range classified as Night
int allowed = 0;// the data sent from processing decides if its ok to turn on 

void setup() {
  Serial.begin(115200);
  pinMode(LED, OUTPUT);
}
void loop() {
  lightValue = analogRead(A0);
 // Serial.println(lightValue);
  if (lightValue <= 20) {
    night = true;
  }
  while (Serial.available() >= 1) {
    allowed = Serial.read();
  }
  if (night == true && allowed == 1) {
    digitalWrite(LED , HIGH);
  }
  else{
   digitalWrite(LED , LOW);
  }
  if (night = true && lightValue >= 25){//this call of light value is here to stop interferance boosting the signal of light 
    night = false;
    digitalWrite(LED, LOW);
  }
  delay(500);//bit of cleanlyness 
}
