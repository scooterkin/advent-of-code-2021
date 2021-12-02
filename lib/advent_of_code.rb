$:.push File.expand_path('../lib/__FILE')

require_relative 'advent_of_code/day_one'

module AdventOfCode
  def self.day_one
    day = DayOne.new('./lib/inputs/day_one')

    {
      part_one: day.process_part_one,
      part_two: day.process_part_two
    }
  end
end
