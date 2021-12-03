# path = "test.txt"
path = "real.txt"
input = File.read path
input = input.split "\n"

bits = input[0].size
counts = [] of Int32

bits.times { |n| counts.push 0 }

input.each do |l|
  l.split("").each_with_index do |c, i|
    v = c.to_i
    v = -1 if v == 0
    counts[i] += v
  end
end

gamma = 0
epsilon = 0

counts.each_with_index do |c, i|
  if c > 0
    gamma += 2 ** (bits - i - 1)
  else
    epsilon += 2 ** (bits - i - 1)
  end
  puts "Most common at #{bits - i} = #{c}"
end

puts gamma
puts epsilon
puts gamma * epsilon
