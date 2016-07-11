require "lambda_driver"
require "kansuu/version"
require "kansuu/cast"
require "kansuu/combinator"
require "kansuu/control"
require "kansuu/enum"
require "kansuu/eq"
require "kansuu/func"
require "kansuu/num"
require "kansuu/obj"
require "kansuu/ord"

module Kansuu
  [
    Kansuu::Cast,
    Kansuu::Combinator,
    Kansuu::Control,
    Kansuu::Enum,
    Kansuu::Eq,
    Kansuu::Func,
    Kansuu::Num,
    Kansuu::Obj,
    Kansuu::Ord
  ].map &-> m {
    include m
    m.private_instance_methods.map &_.module_function
  }
end

