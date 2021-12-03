module AdventOfCode
  class DayOne
    def initialize(filename)
      @filename = File.expand_path(filename)
    end

    def self.call(test=false)
      filename = 'day_one' + (test ? '_test' : '')
      new("./lib/inputs/#{filename}").call
    end

    def call
      {
        part_one: process_part_one,
        part_two: process_part_two
      }
    end

    private

      def count_increases(values)
        count = 0
        last = nil

        values.each do |value|
          unless last.nil?
            count += 1 if value > last
          end

          last = value
        end

        count
      end

      def group_and_sum(values)
        first_index = 0
        last_index = 2
        window_open = true

        [].tap do |a|
          while window_open
            group = values[first_index..last_index]

            if group.size == 3
              a << group
              first_index += 1
              last_index += 1
            else
              window_open = false
            end
          end
        end.map(&:sum)
      end

      def process_part_one
        count_increases(readings)
      end

      def process_part_two
        count_increases(group_and_sum(readings))
      end

      def readings
        @readings ||= File.open(@filename, 'r') do |f|
          f.readlines(chomp: true).map(&:to_i)
        end
      end
  end
end
