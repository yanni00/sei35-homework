puts "What is the current temperature?"
current_temp = gets.chomp.to_i

puts "Is the AC functional? Yes/No"
functional = gets.chomp

puts "What is your preferred temperature"
pref_temp = gets.chomp.to_i

if functional.downcase == "yes" && current_temp<pref_temp
 puts "Turn on the AC Please"
end

if functional.downcase == "no" && current_temp>pref_temp
 puts "Fix the AC now! It's hot!"
end

if functional.downcase == "no" && current_temp<pref_temp
  puts "Fix the AC whenever you have the chance... It's cool..."
end
