#ifndef _DEFS_H_
#define _DEFS_H_

typedef enum _LCDtest {
    FINGERPAINT = 0,
    JOYABS = 1,
    JOYREL = 2,
    ACCELPAINT = 3,
    ROUNDREC = 8,
    ROUNDRECFILL = 9,                                                           
    TEXT = 10, 
    FILL = 11, 
    LINES = 12, 
    HORIZVERT = 13, 
    RECT = 14, 
    RECTFILL = 15, 
    CIRCLE = 16, 
    CIRCFILL = 17, 
    TRIANGLE = 18, 
    TRIFILL = 19
} LCDtest;

void lcd_test(LCDtest choice);

#endif
