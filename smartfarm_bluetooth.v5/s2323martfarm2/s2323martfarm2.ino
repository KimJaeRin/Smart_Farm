#include <Wire.h>                     // i2C 통신을 위한 라이브러리
#include <LiquidCrystal_I2C.h>        // LCD 1602 I2C용 라이브러리
#include <Adafruit_NeoPixel.h>        // 네오픽셀 라이브러리 
#include "DHT.h"                      // 온습도 센서 라이브러리
#include <SoftwareSerial.h>           // 소프트웨어 시리얼 라이브러리

#define DHTPIN A0
#define DHTTYPE DHT11
#define JODO_PIN A3
#define water_PIN A2
#define RX_PIN 3    // 블루투스 모듈의 RX 핀
#define TX_PIN 2    // 블루투스 모듈의 TX 핀

SoftwareSerial bluetoothSerial(RX_PIN, TX_PIN); // RX, TX 핀 설정

DHT dht(DHTPIN, DHTTYPE);
Adafruit_NeoPixel RGB_LED = Adafruit_NeoPixel(12, 9, NEO_GRB);
LiquidCrystal_I2C lcd(0x27, 16, 2);   // 접근주소: 0x3F or 0x27

int AA = 5;               // 모터A 
int AB = 4;               // 모터A
int BA = 6;               // 모터B 
int BB = 7;               // 모터B 

int fanSpeed = 0;  // 팬 속도 상태 변수
int brightness = 0;  // 받은 밝기 값 변수
int watersupply = 0; // 급수


// 급수
const int relayPin = 11;
const unsigned long motorOnTime = watersupply;  // 모터가 켜져 있을 시간 (밀리초)
const unsigned long motorOffTime = 1000; // 모터가 꺼져 있을 시간 (밀리초)

unsigned long previousMillis = 0; // 마지막으로 모터 상태가 변경된 시간
bool motorState = false;          // 모터 상태 (켜짐: true, 꺼짐: false)

int JODO;

int fMax_hum = 0;                           // 센서 기준값 선언 및 초기화
int fMax_temp = 0;
int fMin_temp = 0;
int Soil_moisture_reference = 0;

void setup() {
  pinMode(relayPin, OUTPUT); // 릴레이 핀을 출력으로 설정
  digitalWrite(relayPin, LOW); // 릴레이 초기 상태를 꺼짐으로 설정

  // 센서 기준값 설정
  fMax_temp = 22;
  fMin_temp = 18;
  fanSpeed = 2;
  Soil_moisture_reference = 50;                // 기준 수분값 설정 0 ~ 100%
  watersupply = 1000;
  pinMode(JODO_PIN, INPUT);  // A0 핀을 입력으로 설정
  
  Serial.begin(9600);                          // 시리얼 통신 초기화 (USB)
  bluetoothSerial.begin(9600);                 // 블루투스 시리얼 통신 초기화
  dht.begin();                                 // DHT 초기화
   
  lcd.init();                                  // LCD 초기화
  lcd.backlight();                             // 백라이트 켜기
  
  RGB_LED.begin();                             // Neopixel 초기화
  RGB_LED.setBrightness(200);                  // RGB_LED 밝기조절
  RGB_LED.show();

  pinMode(AA, OUTPUT);                         // 모터 핀 설정          
  pinMode(AB, OUTPUT);
  pinMode(BA, OUTPUT);
  pinMode(BB, OUTPUT);


}

void loop() {
  if (bluetoothSerial.available()) {
    String command = bluetoothSerial.readStringUntil('\n'); // 줄 바꿈 문자까지 데이터 받기
    command.trim(); // 문자열 양 끝의 공백 제거
    Serial.print("Received: ");
    Serial.println(command);

    int value = command.toInt(); // 문자열을 정수로 변환

    if (value >= 1 && value <= 10) {
      brightness = value;

      int mappedBrightness = map(brightness, 1, 10, 0, 255); // 받은 값 범위를 Neopixel 밝기 범위로 매핑
      RGB_LED.setBrightness(mappedBrightness); // Neopixel 밝기 설정
      RGB_LED.show(); // Neopixel 표시

      Serial.println(mappedBrightness);

    } else if (value >= 30 && value <= 80) {
      Soil_moisture_reference = value;
      Serial.println(Soil_moisture_reference);
    } else if (value >= 100 && value < 200) {
      // fMax_temp 조정
      fMax_temp = (value - 100);
    }
      else if (value >= 200 && value < 500) {
          watersupply = (value - 200)*37;
      }

    else if (command == "A") {
      fanSpeed = 1;
    } else if (command == "B") {
      fanSpeed = 2;
    } else if (command == "C") {
      fanSpeed = 3;
    }
  }
  RGB_Color(RGB_LED.Color(255, 255, 255), 10);  // 흰색으로 설정
  
  unsigned long currentMillis = millis();

  int waterAmount = analogRead(water_PIN);
  int waterStatus = (waterAmount == 3) ? "부족" : (waterAmount == 1023) ? "여유" : "측정 중";
  JODO = analogRead(JODO_PIN);       // 주변 광 조도 센서 값 지정 (A0 핀으로 변경)
  float hum = dht.readHumidity();    // 습도값 받아오기
  float temp = dht.readTemperature();// 온도값 받아오기
  int Soil_moisture = analogRead(A1);  // 토양 수분값 받아오기
  int C_Soil_moisture = map(Soil_moisture, 1023, 0, 0, 100);   // 토양 수분값 0~100으로 변환

  // 온도와 습도에 따른 팬 제어
  if (temp > fMax_temp && fanSpeed == 0){
    fanSpeed = 2;
    FanONOFF(fanSpeed); 
  }
  else if (temp > fMax_temp) {
    FanONOFF(fanSpeed); 
  } else if (temp < fMin_temp) {
    fanSpeed = 0; // OFF 상태
    FanONOFF(fanSpeed); 
  } else {
    fanSpeed = 0; // OFF 상태
    FanONOFF(fanSpeed); 
  }

  Serial.print("Soil_moisture : ");                            // 백분율로 변환한 값
  Serial.println(C_Soil_moisture);
  Serial.print("temp:");
  Serial.print(dht.readTemperature());
  Serial.print(",");
  Serial.print("humid:");
  Serial.println(dht.readHumidity());
  Serial.print("Water Level: ");
  Serial.print(waterAmount);
  Serial.print(" - ");
  Serial.println(waterStatus);          // 센서 값을 시리얼 모니터에 출력

  // 시리얼 모니터 및 블루투스 출력
  String data = "Soil_moisture: " + String(C_Soil_moisture) + ", Temp: " + String(temp) + ", Humid: " + String(hum) + ", 조도: " + String(JODO) + ", Water Level: " + String(waterStatus);
  Serial.println(data);  // USB 시리얼 모니터 출력
  bluetoothSerial.println(data);  // 블루투스 시리얼 출력

  String strC_Soil = int2String(C_Soil_moisture);  // 자릿수별 표시 변경

  if (C_Soil_moisture < Soil_moisture_reference)  // 수분 값이 기준 보다 낮을 경우
  {
    WarrningLCD();
    if (motorState) {
      if (currentMillis - previousMillis >= motorOnTime) {
        motorState = false; // 모터 상태를 꺼짐으로 설정
        previousMillis = currentMillis; // 현재 시간을 저장
        digitalWrite(relayPin, LOW); // 릴레이 OFF
      }
    } else {
      if (currentMillis - previousMillis >= motorOffTime) {
        motorState = true; // 모터 상태를 켜짐으로 설정
        previousMillis = currentMillis; // 현재 시간을 저장
        digitalWrite(relayPin, HIGH); // 릴레이 ON
      }
    }
  }
  else
  {
    lcd.setCursor(0, 0);
    lcd.print("T: "); lcd.print((int)temp); lcd.print("C ");
    lcd.setCursor(8, 0);
    lcd.print("H: "); lcd.print((int)hum); lcd.print("% ");
    lcd.setCursor(0, 1);
    lcd.print("Soil_M: "); lcd.print(strC_Soil); lcd.print("   ");
  }


  
}

void RGB_Color(uint32_t c, int wait) {  // float c 대신 uint32_t c로 수정
  for (int i = 0; i < RGB_LED.numPixels(); i++) 
  {  
     RGB_LED.setPixelColor(i, c);
     RGB_LED.show();
     delay(wait);
  }
}

String int2String(int val)
{
  String sval = "";

  int val2 = (val / 10) % 10;  // 10의 자리
  int val3 = (val / 100) % 10; // 100의 자리
  
  if (val3 >= 1)
  {
    sval = String(val);
  }
  else
  {
     if (val2 >= 1)
     {
      sval = " " + String(val);
     }
     else
     {
      sval = "  " + String(val);
     }
  }

  return sval;
}

void WarrningLCD() { 
    lcd.clear();
    delay(200);
    lcd.backlight();  // 백라이트 켜기
    lcd.setCursor(0, 0);  // 0번째, 0라인
    lcd.print("Not enough water");
    lcd.setCursor(0, 1);  // 1번째, 1라인
    lcd.print("supply water!!");
    delay(200);
}

void FanONOFF(int OnOff)
{
  switch(OnOff){
    case 0:
     analogWrite(AA, 0);
     analogWrite(BA, 0);
     break;
    case 1:
      analogWrite(AA, 70);
      analogWrite(BA, 70);
      break;
    case 2:
      analogWrite(AA, 150);
      analogWrite(BA, 150);
      break;
    case 3:
      analogWrite(AA, 255);
      analogWrite(BA, 255);
      break;
    default: // 오타 수정 및 기본 처리
      analogWrite(AA, 0);
      analogWrite(BA, 0);
      break;
  }
  
}
