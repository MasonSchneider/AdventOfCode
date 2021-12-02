# path = "test.txt"
path = "real.txt"
input = File.read path
input = input.split "\n"
input = input.map { |i| i.to_i }
last = nil
increases = 0
input.each do |i|
  unless last.nil?
    if last < i
      increases += 1
    end
  end
  last = i
end

puts increases
