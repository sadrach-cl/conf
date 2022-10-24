// kb: crkbd
// km: neoncornemac

#pragma once

#define OLED_DISABLE_TIMEOUT

// #define USE_MATRIX_I2C
// #define MASTER_LEFT
// #define MASTER_RIGHT
// #define SPLIT_USB_DETECT 

#define EE_HANDS

// #define USE_SERIAL_PD2

// #define TAPPING_FORCE_HOLD

#define TAPPING_TERM 200 // el doble pulso del Tap Dance debe hacerse en menos de 400ms

#define TAPPING_TERM_PER_KEY

#define OLED_BRIGHTNESS 130

#define OLED_DISABLE_TIMEOUT

#define SPLIT_OLED_ENABLE

#define SPLIT_WPM_ENABLE

#ifdef RGBLIGHT_ENABLE // si la linea RGBLIGHT_ENABLE = yes esta en rules.mk

    #undef RGBLED_NUM
       
    #define RGBLED_NUM 54 // numero de LEDs en el teclado
    
    #undef RGBLED_SPLIT
    
    #define RGBLED_SPLIT \
        {27,27}
       
    //#define RGBLIGHT_EFFECT_BREATHING
    // incluyendo el efecto RGB breathing
    
    //#define RGBLIGHT_EFFECT_RAINBOW_MOOD
    // incluyendo el efecto RGB rainbow mood
    
    //#define RGBLIGHT_EFFECT_RAINBOW_SWIRL
               
    #define RGBLIGHT_LIMIT_VAL 110
    // maximo valor para Value en HSV
    
    // #define RGBLIGHT_HUE_STEP 5
    // valor del step al modificar Hue
    
    // #define RGBLIGHT_SAT_STEP 17
    // valor del step al modificar Saturation
    
    // #define RGBLIGHT_VAL_STEP 17
    // valor del step al modificar Value
    
#endif

#define OLED_FONT_H "keyboards/crkbd/lib/glcdfont.c"

#define NO_ACTION_MACRO 
// ya que tengo EXTRAFLAGS += -flto en rules.mk

#define NO_ACTION_FUNCTION 
// ya que tengo EXTRAFLAGS += -flto en rules.mk

#define UNICODE_SELECTED_MODES UC_MAC
