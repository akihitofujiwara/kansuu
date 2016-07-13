require "lambda_driver"
require "kansuu/util"

module Kansuu::Option
  extend Kansuu::Util

  def may
    -> f, x { !x.nil? ? f[x] : x } % 2
  end

  __module_functionize[]
end
