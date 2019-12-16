puts "What is your age? Can you drink legally?"
age = gets.chomp.to_i
case
when age < 18
 puts "#{age} is too young to drink"
when age >= 18
 puts "#{age} is old enough to drink"
end
