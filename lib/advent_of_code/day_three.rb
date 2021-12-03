module AdventOfCode
  class DayThree
    def initialize(filename)
      @filename = File.expand_path(filename)
    end

    def self.call(test=false)
      filename = 'day_three' + (test ? '_test' : '')
      new("./lib/inputs/#{filename}").call
    end

    def call
      {
        part_one: process_part_one,
        part_two: process_part_two
      }
    end

    private

      def calculate_co2_scrubber_rating(values, index = 0)
        return values.first.to_i(2) if values.size == 1

        grouped_bits = values.map { |v| v.split('') }.transpose
        zeroes, ones = count_bits(grouped_bits[index])

        key_value = if zeroes == ones || zeroes < ones
                      '0'
                    else
                      '1'
                    end

        calculate_co2_scrubber_rating(values.select { |value| value[index] == key_value }, index + 1)
      end

      def calculate_o2_generator_rating(values, index = 0)
        return values.first.to_i(2) if values.size == 1

        grouped_bits = values.map { |v| v.split('') }.transpose
        zeroes, ones = count_bits(grouped_bits[index])

        key_value = if zeroes == ones || zeroes < ones
                      '1'
                    else
                      '0'
                    end

        calculate_o2_generator_rating(values.select { |value| value[index] == key_value }, index + 1)
      end

      def calculate_gamma_and_epsilon(values)
        most_common_bits = values.map { |v| v.split('') }.transpose.map do |bits|
          calculate_most_common_bit(bits)
        end

        least_common_bits = most_common_bits.map { |bit| flip_bit(bit) }

        [most_common_bits.join('').to_i(2), least_common_bits.join('').to_i(2)]
      end

      def calculate_most_common_bit(bits)
        frequency = bits.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
        bits.max_by { |v| frequency[v] }
      end

      def count_bits(bits)
        [bits.select { |bit| bit == '0' }.size, bits.select { |bit| bit == '1'}.size]
      end

      def flip_bit(bit)
        bit == '1' ? '0' : '1'
      end

      def readings
        @readings ||= File.open(@filename, 'r') do |f|
          f.readlines(chomp: true)
        end
      end

      def process_part_one
        gamma, epsilon = calculate_gamma_and_epsilon(readings)
        gamma * epsilon
      end
  
      def process_part_two
        o2_rating = calculate_o2_generator_rating(readings)
        co2_rating = calculate_co2_scrubber_rating(readings)
        o2_rating * co2_rating
      end
    end
  end
