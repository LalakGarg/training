$i = 0
$num = 5

while $i < $num  do
   puts("Inside the loop i = #$i" )
   $i +=1
end

puts "-----------------------------------------------------";

$i = 0
$num = 5

until $i > $num  do
   puts("Inside the loop i = #$i" )
   $i +=1;
end

puts "-----------------------------------------------------";

for i in 0..5
    puts "Value of local variable is #{i}"
 end

puts "-----------------------------------------------------";

(0..5).each do |i|
    puts "Value of local variable is #{i}"
 end

 puts "-----------------------------------------------------";

for i in 0..5
    if i > 2 then
       break
    end
    puts "Value of local variable is #{i}"
 end

 puts "-----------------------------------------------------";

 for i in 0..5
    if i < 2 then
       next
    end
    puts "Value of local variable is #{i}"
 end