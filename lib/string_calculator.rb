class StringCalculator

  def add(input)
    return 0 if input.empty?
    
    delimiter, numbers_string = extract_delimiter(input)
    numbers = numbers_string.split(delimiter).map(&:to_i)

    validate_numbers(numbers)

    numbers.reduce(0, :+)
  end

  private

  # Method to validate numbers for negative values
  def validate_numbers(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  end

  # Method to extract delimiter and numbers string
  def extract_delimiter(input)
    if input.start_with?("//")
      delimiter = input[2]
      numbers_string = input[4..]
    else
      delimiter = /[,\n]/
      numbers_string = input
    end
    [delimiter, numbers_string]
  end
end
