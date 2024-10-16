class Question
attr_accessor :number1, :number2, :ans

def initialize
@number1 = rand(1..20)
@number2 = rand(1..20)
@ans = @number1 + @number2
end

def ask_question(player_name)
  puts "#{player_name}, What does #{@number1} plus #{@number2} equal?"
  print "> "
  gets.chomp.to_i
end

def correct?(correct_answer)
  correct_answer == @ans
end

end