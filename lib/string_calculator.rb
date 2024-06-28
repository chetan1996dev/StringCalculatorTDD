class StringCalculator

  def add(input)
    return 0 if input.empty?
    
    numbers = input.split(/[,|\n]/).map(&:to_i)

    validate_numbers(numbers)

    numbers.reduce(0, :+)
  end

  private

  # Method to validate numbers for negative values
  def validate_numbers(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negative numbers not allowed: #{ negatives.join(', ') }" if negatives.any?
  end
end
