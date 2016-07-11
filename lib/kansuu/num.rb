require "lambda_driver"
require "kansuu/util"

module Kansuu::Num
  extend Kansuu::Util

  __define_funcs_from_method < {
    plus: [:+, 2],
    minus: [:-, 2],
    subtract: [:-, 2],
    sub: [:-, 2],
    multiply: [:*, 2],
    mul: [:*, 2],
    pow: [:**, 2],
    div: [:div, 2],
    modulo: [:modulo, 2],
    remainder: [:remainder, 2],
    rem: [:remainder, 2],
    divmod: [:divmod, 2],
    fdiv: [:fdiv, 2],
    abs: [:abs, 1],
    magnitude: [:magnitude, 1],
    bit_length: [:bit_length, 1],
    odd: [:odd?, 1],
    even: [:even?, 1],
    succ: [:succ, 1],
    upto: [:upto, 2],
    downto: [:downto, 2],
    repeat: [:times, 2, true],
    next: [:next, 1],
    pred: [:pred, 1],
    chr: [:chr, 1],
    ord: [:ord, 1],
    floor: [:floor, 1],
    ceil: [:ceil, 1],
    truncate: [:truncate, 1],
    round: [:round, 1],
    gcd: [:gcd, 2],
    lcm: [:lcm, 2],
    gcdlcm: [:gcdlcm, 2],
    rationalize: [:rationalize, 1],
    quo: [:quo, 2],
    abs2: [:abs2, 1],
    between: [:between?, 3],
  }

  __module_functionize[]
end

