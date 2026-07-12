# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
    h = arr.uniq.sort.each_with_index.to_h
    arr.map { |x| h[x] + 1 }
end