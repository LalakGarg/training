val1 = "This is variable one"
val2 = "This is variable two"
puts val1
puts val2

puts "----------------------------------";

puts "Enter a value :"
val = gets
puts val

puts "----------------------------------";

str = "Hello Ruby!"
putc str

puts "----------------------------------";

aFile = File.new("input.txt", "r")
if aFile
    content = aFile.sysread(20)
    puts content
 else
    puts "Unable to open file!"
 end

 puts "----------------------------------";

 aFile = File.new("input.txt", "r+")
 if aFile
    aFile.syswrite("ABCDEF")
 else
    puts "Unable to open file!"
 end

puts "----------------------------------";

aFile = File.new("input.txt", "r+")
if aFile
   aFile.syswrite("ABCDEF")
   aFile.each_byte {|ch| putc ch; putc ?. }
else
   puts "Unable to open file!"
end

puts "----------------------------------";

arr = IO.readlines("input.txt")
puts arr[0]
puts arr[1]

puts "----------------------------------";

IO.foreach("input.txt"){|block| puts block}