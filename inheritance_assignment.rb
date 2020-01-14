# Problem Statement -
# Create Person, Customer, Employee, Manager classes and 
# implement inheritance between them

#superclass or Parent class
class Person

    attr_accessor :name, :age, :contact_no, :address

    protected

    def create_person_profile
        puts "Enter your name"
        @name = gets.chomp
        puts "Enter your age"
        @age = gets.chomp
        puts "Enter your contact no."
        @contact_no = gets.chomp
        puts "Enter your address"
        @address = gets.chomp
    end

    def view_person_profile
        puts "Name: #{@name} \nAddress: #{@address} \nAge: #{@age} 
        Contact no.: #{@contact_no}"
    end

end

#child of Person Class and parent of Manager class
class Employee < Person

    attr_accessor :joining_date, :ctc, :no_of_working_hrs

    def create_profile 
        create_emp_profile
    end

    def view_profile 
        view_emp_profile
    end

    protected

    def create_emp_profile
        create_person_profile
        puts "Enter the joining date"
        @joining_date = gets.chomp
        puts "Enter the salary"
        @ctc = gets.chomp
        puts "Enter the working hours"
        @no_of_working_hrs = gets.chomp
    end

    def view_emp_profile
        view_person_profile
        puts "Date of Joining: #{@joining_date} \nSalary: #{@ctc}
        No. of Working hours: #{@no_of_working_hrs}"
    end

end

#child of person class
class Customer < Person

    attr_accessor :wallet_balance, :cart_items

    def create_customer_profile
        create_person_profile
        @wallet_balance = 0
        @cart_items = []
    end

    def add_money_to_wallet
        puts "Enter the amount to add to wallet"
        amount = gets.chomp
        @wallet_balance += amount
    end

    def view_customer_profile
        view_person_profile
    end

    def view_wallet_balance
        puts "Your wallet balance is #{@wallet_balance}"
    end

    def add_items_to_cart
        puts "Enter the item name to add to cart "
        item = gets.chomp
        @cart_items.append(item)
    end

    def view_cart_items
        puts @cart_items
    end

end

#child of Employee class
class Manager < Employee

    attr_accessor :department 

    def create_manager_profile
        create_emp_profile
        puts "Enter your department "
        @department = gets.chomp
    end

    def view_manager_profile
        view_emp_profile
        puts "Department: #{@department}"
    end

end


manager1 = Manager.new

puts "Create profile of manager"
manager1.create_manager_profile

puts "View profile of manager"
manager1.view_manager_profile


employee1 = Employee.new

puts "Create profile of employee"
employee1.create_profile

puts "View profile of employee"
employee1.view_profile


customer1 = Customer.new

puts "Create profile of customer"
customer1.create_customer_profile

puts "View profile of customer"
customer1.view_customer_profile

puts "Add money to wallet"
customer1.add_money_to_wallet

puts "View wallet balance"
customer1.view_wallet_balance

puts "Add items to cart"
customer1.add_items_to_cart

puts "View cart items"
customer1.view_cart_items
