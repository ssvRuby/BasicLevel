a
#--------------------------------------------------------------------------
#    1
#--------------------------------------------------------------------------
year = {'jan': 31, 'feb': 28, 'mar': 31,
        'apr': 30, 'may': 31, 'jun': 30,
        'jul': 31, 'aug': 31, 'sep': 30,
        'okt': 31, 'nov': 30, 'dec': 31}

year.each do |key, value|
  puts key if value == 30
end

#--------------------------------------------------------------------------
#    2
#--------------------------------------------------------------------------

arr = []
i = 10
while i <= 100 do
  arr << i
  i += 5
end
# puts arr

#--------------------------------------------------------------------------
#    3
#--------------------------------------------------------------------------
fib = Array.new
fib[0] = 1
fib[1] = 1

i = 2
j = 1

loop do
  cf = fib[i-1] + fib[i-2]
  if cf < 100 then
    fib.push (cf)
  else
    break
  end
  puts cf
  i += 1
end
