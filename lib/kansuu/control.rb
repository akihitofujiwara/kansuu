require "lambda_driver"
require "kansuu/num"

module Kansuu::Control
  extend Kansuu::Util

  def when_
    -> f, g, x {
      f[x] ? g[x] : x
    } % 3
  end

  def except
    -> f, g, x {
      f[x] ? x : g[x]
    } % 3
  end

  __module_functionize[]
end
