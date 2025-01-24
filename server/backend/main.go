package main

import (
	"backend/handlers"
	"backend/models"

	"github.com/gin-gonic/gin"
)

var components []models.Component = []models.Component{
	{
		Name:        "Raspberry Pi-5",
		Available:   4,
		Id:          56,
		Datasheet:   "nothing",
		Description: "The latest microcontroller from the Raspberry Pi foundation",
		Image:       "lib/assets/images/pi-5.jpg",
		Position:    []uint{10, 4, 3},
	},
	{
		Name:        "Arduino Uno R3",
		Available:   12,
		Id:          57,
		Datasheet:   "datasheet available",
		Description: "A microcontroller board based on the ATmega328P.",
		Image:       "lib/assets/images/arduino-uno.jpg",
		Position:    []uint{5, 2, 1},
	},
	{
		Name:        "ESP32",
		Available:   8,
		Id:          58,
		Datasheet:   "ESP32 datasheet",
		Description: "A Wi-Fi and Bluetooth combo chip for IoT projects.",
		Image:       "lib/assets/images/esp32.jpg",
		Position:    []uint{7, 3, 2},
	},
	{
		Name:        "L298N Motor Driver",
		Available:   6,
		Id:          59,
		Datasheet:   "motor driver datasheet",
		Description: "Dual H-bridge motor driver for controlling DC motors.",
		Image:       "lib/assets/images/l298n.jpg",
		Position:    []uint{3, 1, 5},
	},
	{
		Name:        "HC-SR04 Ultrasonic Sensor",
		Available:   15,
		Id:          60,
		Datasheet:   "ultrasonic sensor datasheet",
		Description: "Ultrasonic sensor for distance measurement.",
		Image:       "lib/assets/images/hc-sr04.jpg",
		Position:    []uint{2, 2, 3},
	},
	{
		Name:        "16x2 LCD Display",
		Available:   10,
		Id:          61,
		Datasheet:   "lcd datasheet",
		Description: "A 16x2 character LCD display module.",
		Image:       "lib/assets/images/lcd-16x2.jpg",
		Position:    []uint{6, 3, 4},
	},
	{
		Name:        "BMP180 Pressure Sensor",
		Available:   5,
		Id:          62,
		Datasheet:   "pressure sensor datasheet",
		Description: "Barometric pressure sensor for altitude and weather measurement.",
		Image:       "lib/assets/images/bmp180.jpg",
		Position:    []uint{1, 5, 2},
	},
	{
		Name:        "74HC595 Shift Register",
		Available:   20,
		Id:          63,
		Datasheet:   "shift register datasheet",
		Description: "A shift register for expanding GPIO pins.",
		Image:       "lib/assets/images/74hc595.jpg",
		Position:    []uint{4, 3, 1},
	},
	{
		Name:        "IR Receiver Module",
		Available:   18,
		Id:          64,
		Datasheet:   "IR receiver datasheet",
		Description: "Infrared receiver module for remote control systems.",
		Image:       "lib/assets/images/ir-receiver.jpg",
		Position:    []uint{2, 1, 6},
	},
	{
		Name:        "Relay Module 5V",
		Available:   14,
		Id:          65,
		Datasheet:   "relay module datasheet",
		Description: "5V relay module for controlling high voltage devices.",
		Image:       "lib/assets/images/relay-module.jpg",
		Position:    []uint{3, 4, 5},
	},
	{
		Name:        "DS3231 RTC Module",
		Available:   9,
		Id:          66,
		Datasheet:   "rtc module datasheet",
		Description: "Real-time clock module with battery backup.",
		Image:       "lib/assets/images/ds3231.jpg",
		Position:    []uint{6, 2, 4},
	},
	{
		Name:        "NRF24L01 Wireless Module",
		Available:   7,
		Id:          67,
		Datasheet:   "wireless module datasheet",
		Description: "2.4GHz RF wireless communication module.",
		Image:       "lib/assets/images/nrf24l01.jpg",
		Position:    []uint{8, 1, 3},
	},
	{
		Name:        "WS2812B LED Strip",
		Available:   25,
		Id:          68,
		Datasheet:   "LED strip datasheet",
		Description: "Individually addressable RGB LED strip.",
		Image:       "lib/assets/images/ws2812b.jpg",
		Position:    []uint{5, 4, 1},
	},
	{
		Name:        "DHT11 Temperature Sensor",
		Available:   11,
		Id:          69,
		Datasheet:   "temperature sensor datasheet",
		Description: "Basic digital temperature and humidity sensor.",
		Image:       "lib/assets/images/dht11.jpg",
		Position:    []uint{7, 2, 3},
	},
	{
		Name:        "Servo Motor SG90",
		Available:   13,
		Id:          70,
		Datasheet:   "servo motor datasheet",
		Description: "A small servo motor for precise angular movement.",
		Image:       "lib/assets/images/sg90.jpg",
		Position:    []uint{4, 5, 6},
	},
}

func main() {
	router := gin.Default()

	router.GET("/components/get-component-list", handlers.GetComponents(&components))
	router.Run("localhost:8080")

}
