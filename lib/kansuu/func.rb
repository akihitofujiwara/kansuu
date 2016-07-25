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
    -> fs, x { fs.map &(ap * x) } % 2
  end

  def ap_at
    -> n, f, xs { 
      xs[0...n] + [(f[xs[n]])] + xs[(n+1)...xs.length]
    } % 3
  end

  def ap_zip
    -> fs, ys {
      fs.zip(ys).map &app[ap]
    } % 2
  end

  def ap_head
    ap_at[0]
  end

  def ap_last
    -> f, xs {
      ap_at[xs.length - 1, f, xs]
    }
  end

  def dist
    ap_all.flip % 2
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
      args >> ap_at[n, f] >> app[g]
    } % 3
  end

  def ap_find
    -> f, g, xs {
      ap_at[find_index[f, xs], g, xs]
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

