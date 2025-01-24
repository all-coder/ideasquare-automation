from machine import Pin,I2C
from time import sleep
#these are api wrappers downloaded from github 
from libraries import lcd_api,pico_i2c_lcd

#setting up the lcd
sda = Pin(0)
scl = Pin(1)
i2c = I2C(0,sda=sda,scl=scl,freq = 40000)
#print(i2c.scan())  #run this before the following code
I2C_ADDR = 39
I2C_ROWS = 2
I2C_COLS = 16
lcd = I2cLcd(i2c,I2C_ADDR,I2C_ROWS,I2C_COLS)

#keys layed out in the form of a matrix
matrix_keys = [['1', '2', '3', 'A'],
               ['4', '5', '6', 'B'],
               ['7', '8', '9', 'C'],
               ['*', '0', '#', 'D']]

#GPIO Pin Numbers
keypad_rows = [9,8,7,6]
keypad_columns = [5,4,3,2]

#the passwod is already defined, if you are going to change the password
#in the future, all this will generated dynamically.
pin = ["7","8","6","0"]
guess = [] #this is where the user input will be stored into


#indicator components
gled = Pin(27, Pin.OUT)
rled = Pin(28,Pin.OUT)

#relay is used to send signal to turn on the 12v dc solenoid
relay= Pin(20,Pin.OUT)

#assigning gpio pin numbers to the respective key positions
col_pins = []
row_pins = []
for x in range(0,4):
    row_pins.append(Pin(keypad_rows[x], Pin.OUT))
    row_pins[x].value(1)
    col_pins.append(Pin(keypad_columns[x], Pin.IN, Pin.PULL_DOWN))
    col_pins[x].value(0)


#manually checking the keys pressed and if the number of inputs equals to the password length
#we use the checkPin() function.
def scankeys():
    cursor_pos = 0
    for row in range(4):
        for col in range(4): 
            row_pins[row].high()
            key = None
            
            if col_pins[col].value() == 1:
                print("Key Press:", matrix_keys[row][col])
                key_press = matrix_keys[row][col]
                sleep(0.3)
                guess.append(key_press)
                lcd.move_to(cursor_pos,1)
                lcd.putstr(''.join(guess))
                cursor_pos+=1
                sleep(0.3)
               
                
            if len(guess) == len(pin):
                lcd.clear()  # length of the pin guess, we can keep it at
                checkPin(guess)
                
                #changing the state of the guess variable
                guess = []
                    
        row_pins[row].low()
    

def checkPin(guess):      
    if guess == pin:
        print("Inventory is Unlocked")
        gled.value(1)
        relay.value(1)
        lcd.putstr("Unlocked")
    else:
        rled.value(1)
        print("Wrong Pin!!!Inventory remains locked")    
        lcd.putstr("Wrong Pin") 

print("Enter the secret Pin")


def main():
    lcd.putstr("Inventory System")
    lcd.move_to(0,1)
    lcd.putstr("Starting Up...")
    sleep(2)
    lcd.clear()
    lcd.move_to(0,0)
    lcd.putstr("Enter The Pin")
    while True:
        scankeys()    


main()
   
            
