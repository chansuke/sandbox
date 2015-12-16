def select_numbers(array)
  result = []

  array.each do |n|
    if n.even?
      result << n
    end
  end

  result
end

def select_long_strings(strings, n)
  result = []

  strings.each do |s|
    if s.length > n
      result << s
    end
  end

  result
end

def select_short_strings(strings, n)
  result = []

  strings.each do |s|
    if s.length < n
      result << s
    end
  end

  result
end

def lookup_mail_address1(table, logins)
  mail_address = []

  logins.each do |login|
    mail_address << table[login]
  end

  mail_address
end

def fizz_buzz(num)
  result = []

  num.each do |n|
    if n % 3 == 0 && n % 5 == 0
      result << "FizzBuzz"
    elsif n % 3 == 0
      result << "Fizz"
    elsif n % 5 == 0
      result << "Buzz"
    else
      result << n
    end
  end

  result
end

def fizz_buzz2(num)
  num.map {|n|
    if n % 3 == 0 && n % 5 == 0
      "FizzBuzz"
    elsif n % 3 == 0
      "Fizz"
    elsif n % 5 == 0
      "Buzz"
    else
      n
    end
  }
end
