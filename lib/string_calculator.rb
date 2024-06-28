class StringCalculator

  def add(input)
    return 0 if input.empty?
    
    input.split(/[,|\n]/).map{|num| num.to_i }.reduce(0, :+)
  end
end
