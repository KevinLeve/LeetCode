# @param {Integer} low
# @param {Integer} high
# @return {Integer[]}
def sequential_digits(low, high)
    ans = []
    1.upto(9) do |i|
        no = ""
        (i).upto(9) do |j|
            no += j.to_s
            ans << no.to_i if no.to_i >= low && no.to_i <= high
        end
    end
    ans.sort!
end