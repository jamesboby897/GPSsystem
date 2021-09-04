#include <BluetoothSerial.h>
#include <HardwareSerial.h>
HardwareSerial GPS_Module(1);
BluetoothSerial BtSerial;
void setup() 
{
  GPS_Module.begin(9600,SERIAL_8N1,16,17);
  BtSerial.begin();
}

void loop() 
{
  while(GPS_Module.available() > 0)
  {
    uint8_t bytes = GPS_Module.read();
    BtSerial.write(bytes);
  }
}
