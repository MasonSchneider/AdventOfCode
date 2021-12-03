# path = "test.txt"
path = "real.txt"
input = File.read path
input = input.split "\n"

bits = input[0].size

def getCommon(rows : Array(String), index : Int32)
  total = 0
  rows.each do |r|
    if r[index] == '1'
      total += 1
    else
      total -= 1
    end
  end
  total >= 0 ? '1' : '0'
end

generator = 0
scrubber = 0

generator_candidates = input.clone
scrubber_candidates = input.clone

bits.times do |i|
  if generator_candidates.size != 1
    gCommon = getCommon generator_candidates, i
    generator_candidates.select! { |v| v[i] == gCommon }
  end
  if scrubber_candidates.size != 1
    sCommon = getCommon scrubber_candidates, i
    scrubber_candidates.select! { |v| v[i] != sCommon }
  end
end

puts "Answer: #{generator_candidates[0].to_i(2) * scrubber_candidates[0].to_i(2)}"
