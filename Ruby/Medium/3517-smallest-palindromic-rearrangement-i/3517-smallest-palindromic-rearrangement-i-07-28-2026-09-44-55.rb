# @param {String} s
# @return {String}
def smallest_palindrome(s)
  cnt = Array.new(26, 0)

  s.each_byte do |c|
    cnt[c - 97] += 1
  end

  left = +""
  mid = ""

  26.times do |i|
    left << ((i + 97).chr * (cnt[i] / 2))

    if cnt[i].odd?
      mid = (i + 97).chr
    end
  end

  left + mid + left.reverse
end