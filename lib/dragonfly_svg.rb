require "dragonfly"
require "dragonfly_svg/plugin"
require "dragonfly_svg/version"

Dragonfly.app.configure do
  plugin :svg
end