/*
 * This sketch is adapted from the default WiFiClient example for use with the 
 * IoTuz board
 * 
 * This sketch includes code to use the LCD as a reporting tool.
 * 
 * This sketch includes the libraries to access the BME280, so you can get temp and humidity values.
 * 
 *  This sketch sends data via HTTP GET requests to data.sparkfun.com service.
 *
 *  You need to get streamId and privateKey at data.sparkfun.com and paste them
 *  below. Or just customize this script to talk to other HTTP servers.
 *  I have included a default one created, just for the giggles.  It accepts the
 *  parameters
 *  temp
 *  joyy
 *  joyx
 *  humidity
 *
 */

#include <WiFi.h>
#include "SPI.h"
#include "Adafruit_GFX.h"
#include "Adafruit_ILI9341.h"
#include <Wire.h>

#include <Adafruit_Sensor.h>
#include <Adafruit_BME280.h>

const char* ssid     = "openhardware";
const char* password = "OHMC2017";

const char* host = "data.sparkfun.com";
const char* streamId   = "pwKx5ZnY9pH4X2Dv17O1";
const char* privateKey = "64gD7dr68WcEr0xwd5Gd";

#define SEALEVELPRESSURE_HPA (1013.25)

Adafruit_BME280 bme; // I2C

#define TFT_DC 4
#define TFT_CS 19
#define TFT_MOSI 13
#define TFT_CLK 14
#define TFT_RST 32
#define TFT_MISO 12

Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC, TFT_MOSI, TFT_CLK, TFT_RST, TFT_MISO);

int address = 0x20; //0100000 (7bit) address of the IO expander on i2c bus
uint8_t dataReceive; //8bit data received
uint8_t dataSend;  //8bit data sent

void setup()
{

  pinMode(TFT_CS, OUTPUT);
  pinMode(TFT_MOSI, OUTPUT);
  pinMode(TFT_DC, OUTPUT);
  pinMode(TFT_CLK, OUTPUT);
  pinMode(TFT_RST, OUTPUT);
  pinMode(TFT_MISO, OUTPUT);
  
  digitalWrite(TFT_CS, LOW);
  Wire.begin();
  
    Serial.begin(115200);
    delay(10);

    dataSend = B01111111; //turn every pin to input except P7
  pcf8574_write(dataSend); //set up pins
  delay(100);
  dataSend = B01111111; //turn every pin to input except P7
  pcf8574_write(dataSend); //set up pins

  tft.begin();
  digitalWrite(TFT_CS, LOW);

    // We start by connecting to a WiFi network

    tft.fillScreen(ILI9341_BLACK);
    tft.setCursor(0, 0);
    tft.setTextColor(ILI9341_WHITE);  tft.setTextSize(1);
  tft.println("Hello World!");

    Serial.println();
    Serial.println();
    tft.print("Connecting to ");
    Serial.print("Connecting to ");
    tft.println(ssid);
    Serial.println(ssid);

    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        tft.print(".");
        Serial.print(".");
    }

    Serial.println("");
    tft.println("");
    Serial.println("WiFi connected");
    tft.println("WiFi connected");
    Serial.println("IP address: ");
    tft.println("IP address: ");
    Serial.println(WiFi.localIP());
    tft.println(WiFi.localIP());

    Serial.println(F("BME280 test"));
    tft.println(F("BME280 test"));

    if (!bme.begin()) {
      Serial.println("Could not find a valid BME280 sensor, check wiring!");
      tft.println("Could not find a valid BME280 sensor, check wiring!");
      while (1);
    }
}

int value = 0;

void loop()
{
    delay(5000);
    ++value;

    Serial.print("connecting to ");
    Serial.println(host);
    tft.print("connecting to ");
    tft.println(host);

    // Use WiFiClient class to create TCP connections
    WiFiClient client;
    const int httpPort = 80;
    if (!client.connect(host, httpPort)) {
        Serial.println("connection failed");
        tft.println("connection failed");
        return;
    }

    // We now create a URI for the request
    String url = "/input/";
    url += streamId;
    url += "?private_key=";
    url += privateKey;
    url += "&humidity=";
    url += bme.readHumidity();
    url += "&temp=";
    url += bme.readTemperature();
    url += "&joyx=";
    url += analogRead(35);
    url += "&joyy=";
    url += analogRead(39);

    Serial.print("Requesting URL: ");
    Serial.println(url);
    tft.print("Requesting URL: ");
    tft.println(url);

    // This will send the request to the server
    client.print(String("GET ") + url + " HTTP/1.1\r\n" +
                 "Host: " + host + "\r\n" +
                 "Connection: close\r\n\r\n");
    unsigned long timeout = millis();
    while (client.available() == 0) {
        if (millis() - timeout > 5000) {
            Serial.println(">>> Client Timeout !");
            tft.println(">>> Client Timeout !");
            client.stop();
            return;
        }
    }

    // Read all the lines of the reply from server and print them to Serial
    while(client.available()) {
        String line = client.readStringUntil('\r');
        tft.print(line);
        Serial.print(line);
    }

    Serial.println();
    Serial.println("closing connection");
    tft.println();
    tft.println("closing connection");
    delay(10000);
}

//I2C/TWI success (transaction was successful).
static const uint8_t ku8TWISuccess                   = 0;
//I2C/TWI device not present (address sent, NACK received).
static const uint8_t ku8TWIDeviceNACK                = 2;
//I2C/TWI data not received (data sent, NACK received).
static const uint8_t ku8TWIDataNACK                  = 3;
//I2C/TWI other error.
static const uint8_t ku8TWIError                     = 4;

uint8_t error;
void pcf8574_write(uint8_t dt){
  Wire.beginTransmission(address);
  Wire.write(dt);
  
  error = Wire.endTransmission();
  if(error == ku8TWISuccess){ //okay!
  
  }
  else{ //we have an error
    //do something here if you like
  }
}

