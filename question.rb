class Question
  attr_reader :answer

  def initialize(player)
    @player = player
    @value_1 = rand(1...20)
    @value_2 = rand(1...20)
    @answer = @value_1 + @value_2
  end

  def ask_question
    puts "#{@player}: What does #{@value_1} plus #{@value_2} equal?"
  end
  
  def validate(answer)
    answer == @answer
  end
end