require 'colorize'

class PrimeMultiplicationTable

  attr_reader :number, :multipliation_table, :n_primes

  def initialize(number)
    @number = number
    @n_primes = find_n_primes(number)
    @multipliation_table = prime_multiplication_table(number)
  end

  def prime_multiplication_table(number)
    i = 0
    multipliation_table = []
    while i < @n_primes.length
      j = 0
      prime_row = []
      while j < @n_primes.length
        prime_row.push(@n_primes[i] * @n_primes[j])
        j += 1
      end
      multipliation_table.push(prime_row)
      prime_row = []
      i += 1
    end

    multipliation_table
  end

  # 0(n^2)

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

  #O(n * sqrt(n))

  def prime?(number)
    return false if number < 2
    return true if number == 2
    return false if number % 2 == 0

    i = 3
    while i <= Math.sqrt(number)
      return false if (number % i).zero?
      i += 2
    end

    return true
  end

  # O(sqrt(n))

  def pretty_print_table()
    print '|  X  '.colorize(:color => :black, :background => :green)
    @n_primes.each_with_index do |num, index|
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

    @multipliation_table.each_with_index do |row, index|
      if index % 2 == 0
        if @n_primes[index] < 10
          print "|  #{@n_primes[index]}  ".colorize(:color => :black, :background => :blue)
        elsif @n_primes[index] < 100
          print "| #{@n_primes[index]}  ".colorize(:color => :black, :background => :blue)
        else
          print "| #{@n_primes[index]} ".colorize(:color => :black, :background => :blue)
        end
      else
        if @n_primes[index] < 10
          print "|  #{@n_primes[index]}  ".colorize(:color => :black, :background => :green)
        elsif @n_primes[index] < 100
          print "| #{@n_primes[index]}  ".colorize(:color => :black, :background => :green)
        else
          print "| #{@n_primes[index]} ".colorize(:color => :black, :background => :green)
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
end

mytable = PrimeMultiplicationTable.new(10)
mytable.pretty_print_table()
