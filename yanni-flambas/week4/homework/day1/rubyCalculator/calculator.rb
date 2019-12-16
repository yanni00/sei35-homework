# Specification:
# A user should be given a menu of operations
# A user should be able to choose from the menu
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
# The menu should be displayed again, and process should continue until the user selects a quit option from the menu
# puts "Which numbers would you like to add?"
# num1 = gets.chomp
# num2 = gets.chomp
# result == num1 + num2
# puts "The sum of the two numbers is #{result}."

# Menu of operations + logging of user_input
puts "Would you like to [add] [sub]tract [mul]tiply [div]ide [exp]onent [squ]are?"
user_input = gets.chomp

#take the users choice and when scenarios for a list of operations
loop do
  case user_input.downcase
    when "add"
    puts "[Addition] Type two numbers you want to add:"
    num1 = gets.chomp.to_i
    num2 = gets.chomp.to_i
    answer = num1 + num2
    when "sub"
    puts "[Subtraction] First type a number you want to subtract, then one you want to subtract from:"
    num1 = gets.chomp.to_i
    num2 = gets.chomp.to_i
    answer = num1 - num2
    when "mul"
    puts "[Multiplication] Type two numbers you want to multiply:"
    num1 = gets.chomp.to_i
    num2 = gets.chomp.to_i
    answer = num1 * num2
    when "div"
    puts "[Division] Type a numerator, then a denominator:"
    num1 = gets.chomp.to_i
    num2 = gets.chomp.to_i
    answer = num1 / num2
    when "exp"
    puts "[TothePowerof] Type a positive real number, then an exponent:"
    num1 = gets.chomp.to_i
    num2 = gets.chomp.to_i
    answer = num1 **= num2
    when "squ"
    puts "Type a number to find its square:"
    num1 = gets.chomp.to_i
    answer = Math.sqrt(num1)

  end
  puts answer #log the answer
  puts "Would you like to [add]ition [sub]tract [mul]tiply [div]ide [exp]onent [squ]are" #reprint the question for next round
  user_input = gets.chomp #request users input again. Proceed through loop
end   # End of loop
