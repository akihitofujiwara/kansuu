require "lambda_driver"
require "kansuu/util"

module Kansuu::Ord
  extend Kansuu::Util

  __define_funcs_from_method < {
    lt: [:<, 2],
    lte: [:<=, 2],
    gt: [:>, 2],
    gte: [:>=, 2],
  }
end
