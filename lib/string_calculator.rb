class StringCalculator

  def add(input)
    return 0 if input.empty?
    
    delimiter, numbers = extract_delimiter_and_numbers(input)
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
  def extract_delimiter_and_numbers(input)
    if input.start_with?("//")
      delimiter = input.match(%r{//(.+)\n})[1].strip
    else
      delimiter =  ",|\n"
    end
    numbers_string = input.gsub(%r{//(.+)\n}, "").split(/[#{delimiter}]/).map(&:to_i)
    [delimiter, numbers_string]
  end
end
