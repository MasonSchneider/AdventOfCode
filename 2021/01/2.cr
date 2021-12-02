# path = "test.txt"
path = "real.txt"
input = File.read path
input = input.split "\n"

input = input.map { |i| i.to_i }

increases = 0

last = input[0] + input[1] + input[2]
g1 = input[0] + input[1] + input[2]
g2 = input[1] + input[2]
g3 = input[2]

input[3..].each do |i|
  # puts "adding #{i}"
  g2 += i
  g3 += i

  # puts "last #{last}"
  # puts "g1 #{g1}"
  # puts "g2 #{g2}"
  # puts "g3 #{g3}"

  if last < g1
    increases += 1
  end

  last = g1
  g1 = g2
  g2 = g3
  g3 = i
end

if last < g1
  increases += 1
end

puts increases
