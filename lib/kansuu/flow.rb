require "lambda_driver"
require "kansuu/util"

module Kansuu::Flow
  extend Kansuu::Util

  def act
    -> f, x { f >> (-> y { x }) < x} % 2
  end

  __module_functionize[]
end

