-- NOTE: width the settings i have now, the width limit is 54 chars
-- First I want to get button interface working
-- DONE: Check to see how much of the deck is left before I draw, so I can handle that and not just crash the program
-- DONE: Also maybe make a reset deck menu option.
math.randomseed(rb.current_tick!)
require "actions"
_print = require "print"
_print.opt.overflow("auto")
_draw = require "draw"
_lcd = require "lcd"
my_lcd = require "myLCD"
options = {
  "Continue",
  "Reshuffle deck",
  "Reset deck",
  "Save Deck",
  "Screenshot",
  "Quit"
}

class Deck
  new: =>
    @deck = {}
    @discard = {}
    for _, s in ipairs({"Heart", "Diamond", "Spade", "Club"})
      for i = 1, 13
        table.insert(@deck, { :s, :i})
  shuffle: =>
    for i = #@deck, 2, -1
      j = math.random(i)
      @deck[i], @deck[j] = @deck[j], @deck[i]
  draw_card: =>
    card = table.remove(@deck)
    table.insert(@discard, card)
    card
  left: =>
    #@deck
  save_out: =>
    msg = ""
    msg ..= "[deck]\n"
    for i, v in ipairs(@deck)
      msg ..= "#{string.sub(v.s, 1, 1)}, #{v.i}\n"
    msg ..= "[discard]\n"
    for i, v in ipairs(@discard)
      msg ..= "#{string.sub(v.s, 1, 1)}, #{v.i}\n"
  draw: =>
    _print.clear!
    if @left! > 0
      ps = rb.lcd_putsxy
      card = @draw_card!
      s = string.sub(card.s, 1, 1)
      -- my_lcd.drawrect(x,y,width,height)
      my_lcd.drawrect(20,20,100,100)
      --ps(3, 9, "+------+")
      ps(20, 20, "#{s}")
      ps(50, 50, "#{card.i}")
      --ps(5, 9, "|      |")
      --ps(6, 9, "|      |")
      --ps(7, 9, "|     #{s}|")
      ps(90, 90, "#{s}")
      --ps(8, 9, "+------+")
      rb.lcd_update!

deck = Deck!
while true
  action = rb.get_plugin_action(-1)
  if action == rb.actions.PLA_SELECT
    _print.clear!
    _print.f("Drawing card...")
    if deck\left! > 0
      deck\draw!
      --card = deck\draw!
      --_print.f("Your card was a %d of %ss", card.i, card.s)
    else
      _print.f("No cards remaining")
    action = 0
  elseif action == rb.actions.PLA_UP
    menu_select = rb.do_menu("Cards Menu", options, nil, false)
    menu_select += 1
    if menu_select == 6
      os.exit!
    elseif menu_select == 2
      deck\shuffle!
    elseif menu_select == 3
      deck = Deck!
    -- elseif menu_select == 4
      -- save deck
    _print.clear!
  elseif action == rb.actions.PLA_EXIT
    os.exit!

