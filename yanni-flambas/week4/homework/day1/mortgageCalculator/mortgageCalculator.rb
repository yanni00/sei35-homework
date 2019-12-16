# Menu of operations + logging of user_input
# puts "Mortgage Calculator"
# puts "You'll need your principal(initial down payment), monthly interest rate and duration of payments in months to find out your monthly payment"
# puts "Principal Value:"
# temp_principal = gets.chomp
# principal = temp_principal + one
# puts principal
# puts "Monthly Interest Rate (example 0.005 for a 0.5% rate)"
# monthly_interest = gets.chomp
# puts "Duration of payment in months:"
# repayment = gets.chomp

## chose the wrong formula see **method1 in task.txt


#Round 2 using **method2 in task.txt
puts "Enter the Outstanding loan amount: "
loan = gets.chomp.to_i

print "Enter length of time in months: "
time = gets.chomp.to_i

print "Enter interest rate: "
rate = gets.chomp.to_f/100 #  chomp.to_f/100 is to_float. so user can enter % in .5 instead of 0.05. Basically dividing input by 100 removing 2 decimal places.

i = (1+rate/12)**(12/12)-1
annuity = (1-(1/(1+i))**time)/i

payment = loan/annuity

# puts "#{payment%} per month" Had way too many decimals tried % didnt work
#Searched and found %.2f works online
puts "$%.2f per month" % [payment]
