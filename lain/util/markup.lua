local string       = { format = string.format }
local setmetatable = setmetatable

-- Lain markup util submodule
-- lain.util.markup
local markup = { fg = {}, bg = {} }

-- Convenience tags.
function markup.bold(text)      return '<b>'     .. text .. '</b>'     end
function markup.italic(text)    return '<i>'     .. text .. '</i>'     end
function markup.strike(text)    return '<s>'     .. text .. '</s>'     end
function markup.underline(text) return '<u>'     .. text .. '</u>'     end
function markup.monospace(text) return '<tt>'    .. text .. '</tt>'    end
function markup.big(text)       return '<big>'   .. text .. '</big>'   end
function markup.small(text)     return '<small>' .. text .. '</small>' end

-- Set font and foreground.
function markup.fontfg(font, fg, text)
  return string.format('<span font="%s" foreground="%s">%s</span>', font, fg, text)
end

-- link markup.{fg,bg}(...) calls to markup.{fg,bg}.color(...)
setmetatable(markup.fg, { __call = function(_, ...) return markup.fg.color(...) end })
setmetatable(markup.bg, { __call = function(_, ...) return markup.bg.color(...) end })

-- link markup(...) calls to markup.fg.color(...)
return setmetatable(markup, { __call = function(_, ...) return markup.fg.color(...) end })
