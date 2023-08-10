#define_method
class Doctor
  ["surgery", "checkup"].each do |action|
    define_method("take_#{action}") do |argument|
      "The doctor takes a #{action} at #{argument}."
    end
  end
end

doctor = Doctor.new
puts doctor.take_surgery("9 AM")
puts doctor.take_checkup("10 PM")
puts doctor.take_checkup("9 AM")
puts doctor.take_surgery("10 PM")

puts '############################################################################################'

#Class macros

class MyMacroClass
    def MyMacroClass.my_class_method
      puts "Running class method my_class_method..."
    end
    def self.show_method_detail
      puts "I'm in show_method_detail..."
    end
end

puts MyMacroClass.my_class_method
puts MyMacroClass.show_method_detail

puts '############################################################################################'

#Prototype programming
class Car
  attr_accessor :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def clone
    Car.new(make, model)
  end
end

original_car = Car.new("Toyota", "Camry")
cloned_car = original_car.clone

cloned_car.model = "Corolla"

puts original_car.model  
puts cloned_car.model    
puts '############################################################################################'

#monkey Patching

class String
  def reverse_words
    split.reverse.join(' ')
  end
end

original_string = "Hello, world!"
reversed_words = original_string.reverse_words

puts reversed_words 

puts '############################################################################################'

#open classes

module Repetation
    def calculate
        puts "calculated values..."
    end
end
 class MyOpenClass
 include Repetation
end

obj = MyOpenClass.new
puts obj.calculate


puts '############################################################################################'

#ghost methods

class DynamicMethods
  def method_missing(method_name, *args)
    puts "Undefined method: #{method_name}"
  end
end

obj = DynamicMethods.new
obj.undefined_method 

puts '############################################################################################'

#inheritance
class Animal
  def speak
    puts "Animal speaks"
  end
end

class Dog < Animal
  def speak
    puts "Dog barks"
  end
end

class Cat < Animal
  def speak
    puts "Cat meows"
  end
end

dog = Dog.new
dog.speak   

cat = Cat.new
cat.speak   

puts '############################################################################################'

#Modules and mixins
module Greet
  def geeks_people
    puts 'Hello World!'
  end
end
class Class_user
  include Greet
end
class Class_employee
  extend Greet
end

puts Class_user.new.geeks_people
puts Class_employee.geeks_people

puts '############################################################################################'

#using Blocks
def count_even_numbers(array)
    count = 0
    array.each do |num|
      count += 1 if num.even?
    end
    count
  end
  
 numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  puts "Count of even numbers: #{count_even_numbers(numbers)}"

  #using Procs
  count_even = Proc.new { |num| num.even? }
def count_numbers(array, condition)
  array.count(&condition)
end


numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_numbers(numbers, count_even)}"

#using lambda

count_even = lambda { |num| num.even? }
def count_numbers(array, condition)
  array.count(&condition)
end


numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_numbers(numbers, count_even)}"

class MyClass
end

puts '############################################################################################'
#class eval, instance eval

MyClass.class_eval do
  def self.my_class_method
    puts "This is a class method"
  end
end

MyClass.my_class_method  # Output: This is a class method

class Person
end

person = Person.new
person.instance_eval do
  def greet
    puts "Hello, I'm an instance method"
  end
end

person.greet  # Output: Hello, I'm an instance method

puts '############################################################################################'







