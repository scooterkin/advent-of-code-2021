$:.push File.expand_path('../lib/__FILE')

require_relative 'advent_of_code/day_one'
require_relative 'advent_of_code/day_two'

module AdventOfCode
  def self.day_one
    day = DayOne.new('./lib/inputs/day_one')

    {
      part_one: day.process_part_one,
      part_two: day.process_part_two
    }
  end

  def self.day_two
    day = DayTwo.new('./lib/inputs/day_two')

    {
      part_one: day.process_part_one,
      part_two: day.process_part_two
    }
  end
end
