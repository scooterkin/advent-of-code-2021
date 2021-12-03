$:.push File.expand_path('../lib/__FILE')

require_relative 'advent_of_code/day_one'
require_relative 'advent_of_code/day_two'
require_relative 'advent_of_code/day_three'

module AdventOfCode
  def self.day_one(test: false)
    DayOne.call(test)
  end

  def self.day_two(test: false)
    DayTwo.call(test)
  end

  def self.day_three(test: false)
    DayThree.call(test)
  end
end
