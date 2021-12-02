# path = "test.txt"
path = "real.txt"
input = File.read path
input = input.split "\n"

input = input.map do |i|
  parts = i.split " "
  [parts[0], parts[1].to_i]
end

horizontal = 0
aim = 0
depth = 0

input.each do |pair|
  v = pair[1].as(Int32)
  case pair[0]
  when "forward"
    horizontal += v
    depth += aim * v
  when "down"
    aim += v
  when "up"
    aim -= v
  end
end

puts horizontal * depth
