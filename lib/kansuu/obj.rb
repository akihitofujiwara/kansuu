require "lambda_driver"
require "kansuu/util"

module Kansuu::Obj
  extend Kansuu::Util

  def let
    -> o, m, *args {
      args.last.instance_of?(Proc) ?
        o.send(m, *(args.take(args.length - 1)), &(args.last))
      : o._(m)[*args]
    } % 3
  end

  def disp
    -> m, *args, o {
      let o, m, *args
    } % 3
  end

  def disp
    -> m, *args, o {
      o._(m)[*args]
    } % 3
  end

  def get
    -> k, o {
      o.send(k)
    } % 2
  end

  def set
    -> k, v, o {
      o.send("#{k}=", v)
    } % 3
  end

  def set_ap
    -> k, f, o {
      set[k, f[get[k, o]], o]
    } % 3
  end

  __module_functionize[]
end

