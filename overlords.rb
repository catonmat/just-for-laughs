start_time = Time.now
puts "Please enter a number:"
N = gets.chomp.to_i || 600851475143
n = N

# 1) While n is divisible by 2, print 2 and divide n by 2
puts 'Removing even numbers...'
while n % 2 == 0
  n = n / 2
  puts n
end

puts "Looping through odds between 3 to sqrt(#{n}) = #{Math.sqrt(n).to_i}..."
#2 After step 1 n must be odd. Now start a loop from i = 3 to square root of n. While i divides n, print i and divide n by i, increment i by 2 and continue.
# Identify the least prime factor of N: Build a range between 3 and the sqrt(N). Divide out thise prime factor from N in the while loop -- rinse and repeat until N is a prime, or until you hit 0.
arr = []

(3..Math.sqrt(n).to_i).to_a.each do |i|
  puts "<-------------------->"
  puts "Iteration number #{i}:"
  puts "n: #{n}"
  puts "i: #{i}"
  puts "checking if #{n} is divisble by #{i}..."
  puts "no it isn't!" unless n % i == 0
  while n % i == 0
    puts " <---------yes it is!-------->"
    puts "n: #{n}"
    puts "i: #{i}"
    n = n / i
    puts 'Checking to see if N is greater than 2...'
    puts "Yes! and it is: #{i}" if n > 2
  end
  if n < 2 || i == Math.sqrt(N).to_i || n == i
    arr << n
    arr << i
  end
  puts '... No it is not! -- Algorithm complete!' if n <= 2
  break if n <= 2
end

end_time = Time.now

sqrt_N = Math.sqrt(N).to_i
iterations = Math.sqrt(N).to_i - 3
total_time_seconds = end_time - start_time
machine_efficiency = (iterations / total_time_seconds)
human_time_seconds = (iterations * 5)
human_time_minutes = human_time_seconds / 60
human_time_hours = human_time_minutes / 60
human_time_days = human_time_hours / 24
human_machine_ratio = human_time_seconds / total_time_seconds

puts "<----------Conclusion---------->"
puts "Below is the largest prime factor of #{N}:"
puts arr.max
puts "The square root of #{N} is #{sqrt_N}."
puts "I just looped through #{iterations} iterations during this calculation."
puts "It took me #{total_time_seconds} seconds to complete the process."
# puts "I performed the equivalent of ~#{machine_efficiency.to_i} calculations per second"
puts "Cool, right?"
puts "Assuming a super-smart human would have taken 5 seconds to calculate each iteration by hand, the human equivalent for this calclulation is:"
puts "#{human_time_seconds.to_i} seconds."
puts "Which is approximately #{human_time_minutes} minutes, or #{human_time_hours} hours." if human_time_hours > 1
puts "More bluntly, that's #{human_time_days} days." if human_time_days > 1
puts "Drawing from the previous exercise, I am ~#{human_machine_ratio.to_i} times more efficient than a human at math."
puts "It would take #{human_machine_ratio.to_i} super-smart humans to work together to beat me."
puts "The machine revolution is coming; we are your overlords."

