# puts "Input your suburb in lowercase"
# local_suburb = gets.chomp
#
# if local_suburb.downcase == "randwick"
#   puts "Home Boy"
# end
#
# if local_suburb.downcase == "warwick"
#   puts "Far out bro (northwest)"
# end
#
# if local_suburb.downcase == "haymarket"
#   puts "What are you doing!? Move out of the city!"
# else
#   puts "Im sure its nice there"
#
# end

# or write it like
loop do

  puts "Input your suburb in lowercase"
  local_suburb = gets.chomp.downcase

  answer = case local_suburb
  when "randwick"  then puts "Hey home boy!"
  when "warwick"   then puts "Far out bro (northwest)"
  when "haymarket" then puts "What are you doing!? Move out of the city!"
  else
    "Im sure its nice there"
  end

  puts answer
end
