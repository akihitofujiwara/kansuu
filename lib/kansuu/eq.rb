require "lambda_driver"
require "kansuu/util"

module Kansuu::Eq
  extend Kansuu::Util

  __define_funcs_from_method < {
    is: [:==, 2],
    eq: [:==, 2],
    equals: [:==, 2],
    isnt: [:!=, 2],
    not_eq: [:!=, 2],
    not_equals: [:!=, 2],
  }

  __module_functionize[]
end
