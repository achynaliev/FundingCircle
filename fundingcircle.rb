def prime_multiplication_table(number)
  n_primes = find_n_primes(number)

  i = 0
  multipliation_table = []
  while i < n_primes.length
    j = 0
    prime_row = []
    while j < n_primes.length
      prime_row.push(n_primes[i] * n_primes[j])
      j += 1
    end
    multipliation_table.push(prime_row)
    prime_row = []
    i += 1
  end

  pretty_print_table(multipliation_table, n_primes)
end

def find_n_primes(number)
  primes = []
  return primes if number <= 0

  i = 2
  while primes.length < number
    primes.push(i) if prime?(i)
    i += 1
  end

  primes
end

def prime?(number)
  return false if number < 2
  return true if number == 2

  i = 2
  while i <= number / 2
    return false if (number % i).zero?
    i += 1
  end

  return true
end

def pretty_print_table(table, primes)
  print ' X |'
  primes.each do |num|
    print "| #{num} |"
  end
  puts

  table.each_with_index do |row, index|
    print " #{primes[index]} "
    row.each do |number|
      print "| #{number} |"
    end
    puts
  end
  puts
end

prime_multiplication_table(10)
