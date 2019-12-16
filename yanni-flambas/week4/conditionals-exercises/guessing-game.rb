random_num = rand 1..10
puts "Can you guess my number between 1 and 10"
user_num = gets.chomp.to_i
puts random_num
loop do
  if user_num != random_num
    puts "Incorrect Guess. Try again!"
  else
    break
  end
end
puts "#{random_num} is correct!"

# require 'colorize'
# print 'Enter Max Value: '
# max_value = gets.to_i
#
# secret_num = rand(0..max_value)
# guess = -1
#
# until guess == secret_num
#
#   print "enter your guess: "
#   guess = gets.to_i
#
#   require 'pry'; binding.pry
#
#   if guess > secret_num
#    puts "guess lower!".red
#  elsif guess < secret_num
#    puts "guess higher".yellow
#   end
#
#
#
# end
#
# puts "correct!".green
