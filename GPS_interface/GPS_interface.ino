#include <HardwareSerial.h>
HardwareSerial GPS_Module(1);
void setup() 
{
  GPS_Module.begin(9600,SERIAL_8N1,16,17);
  Serial.begin(115200);
}

void loop() 
{
  while(GPS_Module.available() > 0)
  {
    uint8_t bytes = GPS_Module.read();
    Serial.write(bytes);
  }
}
