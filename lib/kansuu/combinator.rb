require "lambda_driver"
require "kansuu/util"

module Kansuu::Combinator
  extend Kansuu::Util

  __define_func_from_method.(:flip, :flip, 2)

  def id
    -> x { x }
  end

  def const
    -> x, y { x } % 2
  end

  def i; id end

  def k; const end

  def c; flip end

  __module_functionize[]
end

