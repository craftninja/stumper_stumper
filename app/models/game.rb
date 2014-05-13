class Game < ActiveRecord::Base

  def generate_random_number(level)
    r = "#{rand(1..9)}#{rand(0..9)}" if level == 2
    r = "#{rand(1..9)}#{rand(0..9)}#{rand(0..9)}" if level == 3
    r = "#{rand(1..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}" if level == 4
    r = "#{rand(1..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}" if level == 5
    r
  end

  def guess(input)
    input_array = input.split("")
    correct, incorrect = 0, 0
    our_array = generated_number.split("")
    our_availability = our_array.map { true }
    input_availability = our_array.map { true }

    our_array.each.with_index do |generated_number, index|
      if generated_number == input_array[index]
        correct += 1
        our_availability[index] = false
        input_availability[index] = false
      end
    end

    our_array.each.with_index do |generated_number, our_index|
      if our_availability[our_index]
        input_array.each.with_index do |their_number, their_index|
          if input_availability[their_index] && generated_number == their_number
            incorrect += 1
            our_availability[our_index] = false
            input_availability[their_index] = false
          end
        end
      end
    end

    [correct, incorrect]
  end

end