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
  include Kansuu::Cast
  include Kansuu::Combinator
  include Kansuu::Control
  include Kansuu::Enum
  include Kansuu::Eq
  include Kansuu::Func
  include Kansuu::Num
  include Kansuu::Obj
  include Kansuu::Ord
end

