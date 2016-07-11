require "lambda_driver"
require "kansuu/util"

module Kansuu::Cast
  extend Kansuu::Util

  __define_funcs_from_method < {
    to_str: [:to_s, 1],
    to_sym: [:to_sym, 1],
    to_a: [:to_a, 1],
    to_arr: [:to_arr, 1],
    to_i: [:to_i, 1],
    to_int: [:to_int, 1],
    to_c: [:to_c, 1],
    to_r: [:to_r, 1],
    to_f: [:to_f, 1],
    to_enum: [:to_enum, 1],
    to_h: [:to_h, 1],
  }

  __module_functionize[]
end

