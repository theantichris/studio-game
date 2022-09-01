time = Time.new
formatted_time = time.strftime("%A %m/%d/%Y at %I:%M%p")
puts "\nThe game started on #{formatted_time}.\n\n"

name1 = "larry"
health1 = 60
puts "#{name1.capitalize} has a health of #{health1}."

name2 = "curly"
health2 = 125
puts "#{name2.upcase} has a health of #{health2}."

name3 = "moe"
health3 = 100
puts "#{name3.capitalize} has a health of #{health3}.".center(50, '*')

name4 = "shemp"
health4 = 90
puts "#{name4.capitalize.ljust(30, '.')} #{health4} health"

