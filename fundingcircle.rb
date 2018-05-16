require 'colorize'

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
  print '|  X  '.colorize(:color => :black, :background => :green)
  primes.each_with_index do |num, index|
    if index % 2 == 0
      if num < 10
        print "|  #{num}  ".colorize(:color => :black, :background => :blue)
      elsif num < 100
        print "| #{num}  ".colorize(:color => :black, :background => :blue)
      else
        print "| #{num} ".colorize(:color => :black, :background => :blue)
      end
    else
      if num < 10
        print "|  #{num}  ".colorize(:color => :black, :background => :green)
      elsif num < 100
        print "| #{num}  ".colorize(:color => :black, :background => :green)
      else
        print "| #{num} ".colorize(:color => :black, :background => :green)
      end
    end
  end
  print "|"
  puts

  table.each_with_index do |row, index|
    if index % 2 == 0
      if primes[index] < 10
        print "|  #{primes[index]}  ".colorize(:color => :black, :background => :blue)
      elsif primes[index] < 100
        print "| #{primes[index]}  ".colorize(:color => :black, :background => :blue)
      else
        print "| #{primes[index]} ".colorize(:color => :black, :background => :blue)
      end
    else
      if primes[index] < 10
        print "|  #{primes[index]}  ".colorize(:color => :black, :background => :green)
      elsif primes[index] < 100
        print "| #{primes[index]}  ".colorize(:color => :black, :background => :green)
      else
        print "| #{primes[index]} ".colorize(:color => :black, :background => :green)
      end
    end

    row.each_with_index do |number, idx|
      if index % 2 == 0 && idx % 2 == 0 || index % 2 == 1 && idx % 2 == 1
        if number < 10
          print "|  #{number}  ".colorize(:color => :black, :background => :green)
        elsif number < 100
          print "| #{number}  ".colorize(:color => :black, :background => :green)
        else
          print "| #{number} ".colorize(:color => :black, :background => :green)
        end
      else
        if number < 10
          print "|  #{number}  ".colorize(:color => :black, :background => :blue)
        elsif number < 100
          print "| #{number}  ".colorize(:color => :black, :background => :blue)
        else
          print "| #{number} ".colorize(:color => :black, :background => :blue)
        end
      end
    end
    print "|"
    puts
  end
  puts
end

prime_multiplication_table(10)
