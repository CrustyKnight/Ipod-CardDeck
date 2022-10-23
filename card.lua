math.randomseed(rb.current_tick())
require("actions")
local _print = require("print")
_print.opt.overflow("auto")
local _draw = require("draw")
local _lcd = require("lcd")
local my_lcd = require("myLCD")
local options = {
  "Continue",
  "Reshuffle deck",
  "Reset deck",
  "Save Deck",
  "Screenshot",
  "Quit"
}
local Deck
do
  local _class_0
  local _base_0 = {
    shuffle = function(self)
      for i = #self.deck, 2, -1 do
        local j = math.random(i)
        self.deck[i], self.deck[j] = self.deck[j], self.deck[i]
      end
    end,
    draw_card = function(self)
      local card = table.remove(self.deck)
      table.insert(self.discard, card)
      return card
    end,
    left = function(self)
      return #self.deck
    end,
    save_out = function(self)
      local msg = ""
      msg = msg .. "[deck]\n"
      for i, v in ipairs(self.deck) do
        msg = msg .. tostring(string.sub(v.s, 1, 1)) .. ", " .. tostring(v.i) .. "\n"
      end
      msg = msg .. "[discard]\n"
      for i, v in ipairs(self.discard) do
        msg = msg .. tostring(string.sub(v.s, 1, 1)) .. ", " .. tostring(v.i) .. "\n"
      end
    end,
    draw = function(self)
      _print.clear()
      if self:left() > 0 then
        local ps = rb.lcd_putsxy
        local card = self:draw_card()
        local s = string.sub(card.s, 1, 1)
        my_lcd.drawrect(20, 20, 100, 100)
        ps(20, 20, tostring(s))
        ps(50, 50, tostring(card.i))
        ps(90, 90, tostring(s))
        return rb.lcd_update()
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.deck = { }
      self.discard = { }
      for _, s in ipairs({
        "Heart",
        "Diamond",
        "Spade",
        "Club"
      }) do
        for i = 1, 13 do
          table.insert(self.deck, {
            s = s,
            i = i
          })
        end
      end
    end,
    __base = _base_0,
    __name = "Deck"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Deck = _class_0
end
local deck = Deck()
while true do
  local action = rb.get_plugin_action(-1)
  if action == rb.actions.PLA_SELECT then
    _print.clear()
    _print.f("Drawing card...")
    if deck:left() > 0 then
      deck:draw()
    else
      _print.f("No cards remaining")
    end
    action = 0
  elseif action == rb.actions.PLA_UP then
    local menu_select = rb.do_menu("Cards Menu", options, nil, false)
    menu_select = menu_select + 1
    if menu_select == 6 then
      os.exit()
    elseif menu_select == 2 then
      deck:shuffle()
    elseif menu_select == 3 then
      deck = Deck()
    end
    _print.clear()
  elseif action == rb.actions.PLA_EXIT then
    os.exit()
  end
end
