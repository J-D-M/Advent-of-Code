#!/usr/bin/env ruby

class Integer
  def is_pwd?()
    nums = self.to_s.chars.to_a
    return [false, false] if nums != nums.sort

    count = Hash.new
    count.default = 0
    nums.each { |x| count[x] += 1 }

    [count.values.any? { |x| x > 1 }, count.value?(2)]
  end
end

class String
  def find_pwds()
    lower, upper = self.split("-")
    res = (lower.to_i..upper.to_i).to_a.map &:is_pwd?

    [res.count(&:first), res.count(&:last)]
  end
end

range = File.read(ARGV.first).chomp
puts range.find_pwds
