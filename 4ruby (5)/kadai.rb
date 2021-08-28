#1
num = 12

if num > 10
  puts "large"
elsif num == 10
  puts "eq"
else
  puts "small"
end

#2
a = 10
b = 20
if a < b
  puts a
else
  puts b
end

#3
a = 10
b = 20
puts "#{a},#{b}"
tmp = a
a = b
b = tmp
puts "#{a},#{b}"

#4
0.upto(9){ |num|
   puts("num = #{num}")
}

#5
n=5
(1..n).each do |num|
  print("*"*num)
  puts ""
end

#6,7
a=1
b=2
c=3
array1 = [a,b,c]
print array1 #[1, 2, 3]
puts ""
array1.each do |e|
  puts e
end

#8
new = 4
if !(array1.include?(new))
  array1 << new
end
print array1 #[1, 2, 3, 4]
puts ""

#9
def array_sum(array)
  sum = 0
  array.each do |e|
    sum += e
  end
  return sum
end
p array_sum(array1) #10

#10
def array_ave(array)
  sum = 0
  array.each do |e|
    sum += e
  end
  return sum.to_f/array.size
end
p array_ave(array1) #2.5

#11
array2 = [1,2,3,4,5,6,7,8,9]
sum = 0
count = 0
array2.each do |num|
  sum += num
  if sum > 15
    p array2[0..count] #[1, 2, 3, 4, 5, 6]
    break
  end
  count += 1
end

#12,13,14,15,16
scores = {:key1 => 1, :key2 => 2, :key3 => 3}
puts scores[:key2] #2

scores[:key4] = 4
puts scores #{:key1=>1, :key2=>2, :key3=>3, :key4=>4}

scores.each do |key, value|
  p "#{key} is #{value}"
end

scores.each do |key, value|
  scores[key] *= 2
end
p scores #{:key1=>2, :key2=>4, :key3=>6, :key4=>8}

#17
(1..20).each do |i|
  if i % 15 == 0
    puts "FizzBuzz"
  elsif i % 3 == 0
    puts "Fizz"
  elsif i % 5 == 0
    puts "Buzz"
  else
    puts i
  end
end

#18
a1 = [1,2,3]
a2 = a1.map{|n| n*2}
p a2 #[2, 4, 6]

#19
def check_array(array,target)
  if array.include?(target)
    return true
  else
    return false
  end
end
p check_array(a1, 5) #false

#20
def min_array(array)
  min = Float::INFINITY
  (0..array.size-1).each do |i|
    if array[i] < min
      min = array[i]
    end
  end
  return min
end
p min_array(a1) #1

#21
def dup_check_array(array)
  (0..array.size-1).each do |i|
    (i+1..array.size-1).each do |j|
      if array[i] == array[j]
        return true
      end
    end
  end
  return false
end
p dup_check_array(a1) #false

#22
def dup_array(array)
  d = [ ]
  (0..array.size-1).each do |i|
    (i+1..array.size-1).each do |j|
      #puts "#{i}, #{j}"
      if array[i] == array[j]
        d << array[i]
      end
    end
  end
  return d.uniq.sort
end
a3 = [1,3,2,3,8,3,2]
p dup_array(a3) #[2, 3]

#23
def dup_hash(array)
  d = dup_array(array)
  ans = {}
  d.each do |num|
    ans[num] = array.count(num)
  end
  return ans
end
a3 = [1,3,2,3,8,3,2]
p dup_hash(a3) #{2=>2, 3=>3}
