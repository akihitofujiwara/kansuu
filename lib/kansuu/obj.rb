require "lambda_driver"

module Kansuu::Obj
  def let
    -> o, m, *args {
      o._(m)[*args]
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
end

