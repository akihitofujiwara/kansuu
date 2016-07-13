require "lambda_driver"
require "kansuu/util"
require "kansuu/func"

module Kansuu::Enum
  extend Kansuu::Util

  __define_funcs_from_method < {
    sort: [:sort, 1],
    sort_by: [:sort_by, 2, true],
    grep: [:grep, 2],
    count: [:count, 1],
    find: [:find, 2, true],
    detect: [:detect, 2, true],
    find_index: [:find_index, 2, true],
    find_all: [:find_all, 2, true],
    select: [:select, 2, true],
    filter: [:select, 2, true],
    reject: [:reject, 2, true],
    collect: [:collect, 2, true],
    map: [:map, 2, true],
    flat_map: [:flat_map, 2, true],
    collect_concat: [:collect_concat, 2, true],
    inject: [:inject, 3, true],
    reduce: [:reduce, 3, true],
    fold: [:reduce, 3, true],
    foldl: [:reduce, 3, true],
    fold1: [:reduce, 2, true],
    foldl1: [:reduce, 2, true],
    partition: [:partition, 2, true],
    group_by: [:group_by, 2, true],
    first: [:first, 1],
    all: [:all?, 2, true],
    any: [:any?, 2, true],
    one: [:one?, 2, true],
    none: [:none?, 2, true],
    min: [:min, 1],
    max: [:max, 1],
    minmax: [:minmax, 1],
    min_by: [:min_by, 2, true],
    max_by: [:max_by, 2, true],
    minmax_by: [:minmax_by, 2, true],
    is_member: [:member?, 2],
    include_: [:include?, 2],
    each_with_index: [:each_with_index, 2, true],
    reverse_each: [:reverse_each, 2, true],
    each_entry: [:each_entry, 2, true],
    each_slice: [:each_slice, 3, true],
    each_cons: [:each_cons, 3, true],
    each_with_object: [:each_with_object, 3, true],
    zipr: [:zip, 2],
    take: [:take, 2],
    take_while: [:take_while, 2, true],
    drop: [:drop, 2],
    drop_while: [:drop_while, 2, true],
    cycle: [:cycle, 3, true],
    chunk: [:chunk, 2, true],
    slice_before: [:slice_before, 2, true],
    slice_after: [:slice_after, 2, true],
    slice_when: [:slice_when, 2, true],
    lazy: [:lazy, 1],
    force: [:force, 1],
    at: [:at, 2],
    last: [:last, 1],
    concat: [:concat, 2],
    each: [:each, 2, true],
    each_index: [:each_index, 2, true],
    length: [:length, 1],
    size: [:size, 1],
    empty: [:empty?, 1],
    index: [:index, 2],
    rindex: [:rindex, 2],
    join: [:join, 2],
    reverse: [:reverse, 1],
    rotate: [:rotate, 2],
    slice: [:slice, 3],
    uniq: [:uniq, 1],
    unique: [:uniq, 1],
    compact: [:compact, 1],
    flatten: [:flatten, 1],
    shuffle: [:shuffle, 1],
    sample: [:sample, 1],
    samples: [:sample, 2],
    permutation: [:permutation, 2],
    combination: [:combination, 2],
    repeated_permutation: [:repeated_permutation, 2],
    repeated_combination: [:repeated_combination, 2],
    product: [:product, 2],
  }

  def zipl; zipr.flip 2 end

  def zip; zipl end

  def zip_with
    -> f, xs, ys {
      xs.zip(ys).map &app[f]
    } % 3
  end

  def pick
    -> ns, xs {
      xs.values_at *ns
    }
  end

  def sum
    fold1[-> x, y { x + y }]
  end

  def range
    -> x, y { x..y } % 2
  end

  def initial
    withl[length >> minus[1]] >>
    app[take]
  end

  def tail; drop[1] end

  __module_functionize[]
end

