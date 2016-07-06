require "lambda_driver"

module Kansuu::Control
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
end
