if not _lcd then
_lcd = {}

-- Functions
_lcd.bitmap                     =     rb.lcd_bitmap
_lcd.bitmap_part                =     rb.lcd_bitmap_part
_lcd.bitmap_transparent         =     rb.lcd_bitmap_transparent
_lcd.bitmap_transparent_part    =     rb.lcd_bitmap_transparent_part
_lcd.clear_display              =     rb.lcd_clear_display
_lcd.drawline                   =     rb.lcd_drawline
_lcd.drawpixel                  =     rb.lcd_drawpixel
_lcd.drawrect                   =     rb.lcd_drawrect
_lcd.fillrect                   =     rb.lcd_fillrect
_lcd.framebuffer                =     rb.lcd_framebuffer
_lcd.get_backdrop               =     rb.lcd_get_backdrop
_lcd.get_background             =     rb.lcd_get_background
_lcd.get_drawmode               =     rb.lcd_get_drawmode
_lcd.get_foreground             =     rb.lcd_get_foreground
_lcd.hline                      =     rb.lcd_hline
_lcd.mono_bitmap                =     rb.lcd_mono_bitmap
_lcd.mono_bitmap_part           =     rb.lcd_mono_bitmap_part
_lcd.puts                       =     rb.lcd_puts
_lcd.puts_scroll                =     rb.lcd_puts_scroll
_lcd.putsxy                     =     rb.lcd_putsxy
_lcd.rgbpack                    =     rb.lcd_rgbpack
_lcd.rgbunpack                  =     rb.lcd_rgbunpack
_lcd.scroll_stop                =     rb.lcd_scroll_stop
_lcd.set_background             =     rb.lcd_set_background
_lcd.set_drawmode               =     rb.lcd_set_drawmode
_lcd.set_foreground             =     rb.lcd_set_foreground
_lcd.setfont                    =     rb.lcd_setfont
_lcd.update                     =     rb.lcd_update
_lcd.update_rect                =     rb.lcd_update_rect
_lcd.vline                      =     rb.lcd_vline

-- Constants
_lcd.DEFAULT_BG                 =     rb.LCD_DEFAULT_BG
_lcd.DEFAULT_FG                 =     rb.LCD_DEFAULT_FG
_lcd.DEPTH                      =     rb.LCD_DEPTH
_lcd.H                          =     rb.LCD_HEIGHT
_lcd.W                          =     rb.LCD_WIDTH
_lcd.CX                         =     (rb.LCD_WIDTH / 2)
_lcd.CY                         =     (rb.LCD_HEIGHT / 2)


return _lcd

else
     rb.splash(rb.HZ, "_lcd already exists!")
end
