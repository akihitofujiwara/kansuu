require "lambda_driver"

module Kansuu::Util
  def __define_func_from_method
    -> name, method, arity, with_proc = false {
      define_method name, (
        with_proc ?
          -> *a, p, o { o._(method).(*a, &p) } % arity
        : -> *a, o { o._(method).(*a) } % arity
      )
    }
  end

  def __define_funcs_from_method
    -> hash { hash.each &-> k, v { __define_func_from_method.(k, *v) } }
  end
end
