-- bilgus 4/2021
require "buttons"
local BUTTON_NONE = 0

local _, w, h = rb.font_getstringsize("W", rb.FONT_UI)
local max_lines = rb.LCD_HEIGHT / h - 1

button_text = {}
for k, v in pairs(rb.buttons) do
    button_text[v] = k
end

--Add the system button codes to the button_text table
for k, v in pairs(rb) do
    if string.find(k or "", "SYS_", 1, true) and type(v) == "number" then
        button_text[v] = k
    end
end

local s = {[1] = "Buttons Found:"}
for k, v in pairs(button_text) do
    table.insert(s, tostring(k) .. " : " .. tostring(v))
end
rb.splash(rb.HZ, table.concat(s, "\n"))

button_text[BUTTON_NONE] = " "

local lastbtn = BUTTON_NONE
local lastkey = BUTTON_NONE
local s_t = {"Press same button 3x to exit"}
local keyrpt = 0

repeat
  local button
  rb.splash(rb.button_get(true))
until 
