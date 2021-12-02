module AdventOfCode
  class DayTwo
    def initialize(filename)
      @filename = File.expand_path(filename)
    end

    def process_part_one
      sum_x_values(directions) * sum_y_values(directions)
    end

    def process_part_two
      aim = 0
      x = 0
      y = 0

      directions.each do |direction|
        delta_x = direction.first

        aim += direction.last
        x += delta_x

        if delta_x.positive?
          y += delta_x * aim
        end
      end

      x * y
    end

    private

      def calculate_delta(value)
        axis, vector = value.split(' ')

        case axis
        when "forward"
          [vector.to_i, 0]
        when "up"
          [0, vector.to_i * -1]
        when "down"
          [0, vector.to_i]
        end
      end

      def directions
        @directions ||= File.open(@filename, 'r') do |f|
          f.readlines(chomp: true).map { |direction| calculate_delta(direction) }
        end
      end

      def sum_x_values(values)
        values.map(&:first).sum
      end

      def sum_y_values(values)
        values.map(&:last).sum
      end
  end
end
