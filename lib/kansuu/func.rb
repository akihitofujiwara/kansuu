require "lambda_driver"
require "kansuu/util"

module Kansuu::Func
  extend Kansuu::Util

  def ap
    -> f, x { f[x] } % 2
  end

  def app
    -> f, xs { f[*xs] } % 2
  end

  def ap_all
    -> fs, x { p fs, x; fs.map &(Kansuu::Func.ap * x) } % 2
  end

  def ap_at
    -> n, f, xs { 
      xs[0...n] + [(f[xs[n]])] + xs[(n+1)...xs.length]
    } % 3
  end

  def ap_zip
    -> fs, ys {
      fs.zip(ys).map &Kansuu::Func.app[Kansuu::Func.ap]
    } % 2
  end

  def ap_head
    Kansuu::Func.ap_at[0]
  end

  def ap_last
    -> f, xs {
      Kansuu::Func.ap_at[xs.length - 1, f, xs]
    } % 2
  end

  def dist
    Kansuu::Func.ap_all.flip 2
  end

  def withl
    -> f, x {
      [f[x], x]
    } % 2
  end

  def withr
    -> f, x {
      [x, f[x]]
    } % 2
  end

  def args
    -> *xs { xs }
  end

  def arg
    -> n, *xs { xs[n] } % 2
  end

  def ap_arg
    -> n, f, g {
      Kansuu::Func.args >> Kansuu::Func.ap_at[n, f] >> Kansuu::Func.app[g]
    } % 3
  end

  def ap_find
    -> f, g, xs {
      Kansuu::Func.ap_at[Kansuu::Enum.find_index[f, xs], g, xs]
    } % 3
  end

  def ap_select
    -> f, g, xs {
      xs.map &-> x {
        f[x] ? g[x] : x
      }
    } % 3
  end

  __module_functionize[]
end

