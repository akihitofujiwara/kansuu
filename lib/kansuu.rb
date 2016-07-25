require "lambda_driver"
require "kansuu/version"
require "kansuu/combinator"
require "kansuu/control"
require "kansuu/enum"
require "kansuu/eq"
require "kansuu/flow"
require "kansuu/func"
require "kansuu/num"
require "kansuu/obj"
require "kansuu/option"
require "kansuu/ord"

module Kansuu
  [
    Kansuu::Combinator,
    Kansuu::Control,
    Kansuu::Enum,
    Kansuu::Eq,
    Kansuu::Flow,
    Kansuu::Func,
    Kansuu::Num,
    Kansuu::Obj,
    Kansuu::Option,
    Kansuu::Ord
  ].map &-> m {
    include m
    m.private_instance_methods.map &_.module_function
  }

  refine Object do
    Kansuu.private_instance_methods.map &-> m {
      define_method m, (Kansuu.instance_method m)
    }
  end
end

