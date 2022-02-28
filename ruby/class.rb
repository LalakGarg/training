$global_variable = 10
class Class1
   def print_global
      puts "Global variable in Class1 is #$global_variable"
   end
end
class Class2
   def print_global
      puts "Global variable in Class2 is #$global_variable"
   end
end

class1obj = Class1.new
class1obj.print_global
class2obj = Class2.new
class2obj.print_global

puts "------------------------------------------------------------";

class Customer
    @@no_of_customers = 0
    def initialize(id, name, addr)
       @cust_id = id
       @cust_name = name
       @cust_addr = addr
    end
    def display_details()
       puts "Customer id #@cust_id"
       puts "Customer name #@cust_name"
       puts "Customer address #@cust_addr"
    end
    def total_no_of_customers()
        @@no_of_customers += 1
        puts "Total number of customers: #@@no_of_customers"
    end
 end
 
 # Create Objects
 cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
 cust2 = Customer.new("2", "Poul", "New Empire road, Khandala")
 
 # Call Methods
 cust1.display_details()
 cust2.display_details()
 cust1.total_no_of_customers()
 cust2.total_no_of_customers()

 puts "---------------------------------------------------------------";

 class Example
    VAR1 = 100
    VAR2 = 200
    def show
       puts "Value of first Constant is #{VAR1}"
       puts "Value of second Constant is #{VAR2}"
    end
 end
 
 # Create Objects
 object = Example.new()
 object.show

 puts "-----------------------------------------------------------------";

puts 'escape using "\\"';
puts 'That\'s right';
puts "Multiplication Value : #{24*60*60}";

puts "-------------------------------------------------------------------";

ary = [  "fred", 10, 3.14, "This is a string", "last element", ]
ary.each do |i|
   puts i
end

puts "---------------------------------------------------------------------";

hsh = colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
   print key, " is ", value, "\n"
end

puts "----------------------------------------------------------------------";

(10..15).each do |n| 
    print n, ' ' 
 end