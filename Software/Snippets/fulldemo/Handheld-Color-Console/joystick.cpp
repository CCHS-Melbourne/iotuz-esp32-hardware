/*
    Arduino Tetris
    Copyright (C) 2015 João André Esteves Vilaça 
    
    https://github.com/vilaca/Handheld-Color-Console

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
#ifndef JOYSTICKCPP
#define JOYSTICKCPP

#include <Arduino.h>
#include "iotuz.h"

class Joystick
{
  public:

    // joystick position constants 
    
    static const int NEUTRAL = 0;
    static const int SOFT = 1;
    static const int HARD = 2;
    static const int HARDER = 3;

    static void init ()
    {
      pinMode ( JOYSTICK_BUT_PIN, INPUT_PULLUP );
    }

    static int getX()
    {
      return getPosition(JOYSTICK_X_PIN) * -1;
    }

    static int getY()
    {
      return getPosition(JOYSTICK_Y_PIN);
    }

    static boolean fire()
    {
      return digitalRead(JOYSTICK_BUT_PIN) == LOW;
    }

    static void waitForRelease()
    {
      while (fire());
    }

    static void waitForRelease(int howLong)
    {
      int c = 0;
      do
      {
        delay (10);
        c += 10;
      }
      while ((fire() || getY() != 0 || getX() != 0) && c < howLong);
    }

    static void waitForClick()
    {
      while (!fire());
    }

  private:

    static int getPosition (int pin)
    {
      int n = analogRead(pin);
//      Serial.print(n);
    
      if (pin == JOYSTICK_X_PIN) n -= JOYSTICK_CENTERX;
      if (pin == JOYSTICK_Y_PIN) n -= JOYSTICK_CENTERY;
//      Serial.print(" > ");
//      Serial.print(n);
    
      n /= 512;
//      Serial.print(" > ");
//      Serial.println(n);
    
      // Analog 0-4096 is turned into 1>9 for a speed to the left, -1>-6 for a speed to the right
      return n;
    }
};

#endif
