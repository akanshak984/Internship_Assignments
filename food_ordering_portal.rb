=begin
Date of Given Assignment 8/01/2020
Implement a food ordering portal using class:
Food Ordering Portal has functionalities:
1. Accept Order
2. Display Order status
3. Check Food Item is available for ordering
4. Change status of order
=end

#class defined with name User
# It has four functionalities i.e check_availability, order, 
# view_order_status, change_order_status

class User
  	
	#class attributes
	@@menu = {"Chicken Roll"=> 50, "Egg Roll"=> 40, "Hamburger"=> 60}
	@@status = "Not Ordered"
	
	def check_availability (item)
		@present = 0
		@@menu.each do  |key, value| 
			if key==item 
				@present = 1
				return "Item Available"
				break
			end
		end
			return "Item Unavailable"
	end
	
 def order
    @array_of_item= []    #ordered items
    @amount_to_pay = 0    #amount to be paid
    @total_quantity = 0   #total quantity
    @size_of_item_array = @@menu.length  #length of array of items
    puts "\nMenu of food"
    count = 1
    @@menu.each do |key, value|
      puts "#{count}. #{key} #{value}"
      count+=1
    end
    puts "\nEnter the number of item to be ordered"
    no_of_item = gets.to_i     #number of item
    while no_of_item>0
			puts "\nEnter food name"
			food_name = gets.chomp
			while (check_availability(food_name)=="Item Unavailable")
				puts "Item Unavailable please enter another item"
				food_name = gets.chomp
			end
			puts "It's quantity"
			quantity = gets.to_i
			@array_of_item.push(food_name)
			@total_quantity += quantity
			@amount_to_pay += quantity * @@menu[food_name]
			no_of_item = no_of_item - 1
		end
		if @total_quantity>0
			@@status = "Order Confirmed"
		end	
		puts "\nOrder Summary \nYou have ordered ", @array_of_item,
		"Total amount to be paid #{@amount_to_pay}"	
	end
	
	def view_order_status
		puts "Order status #{@@status}"
	end

	def change_order_status (status)
		@@status = status
		puts "Order status changed to #{@@status}"
	end

end


loop do 
#Display options to user
puts "\nEnter your choice
1. Order Food
2. Check Availability
3. View Order Status 
4. Change Order Status
5. Exit "
choice = gets.to_i
	if choice==1
		User.new.order 
	elsif choice==2
		puts "\nEnter the item whose availability you want to check"
		item = gets.chomp	  	
		puts User.new.check_availability (item)
	elsif choice==3
		User.new.view_order_status
	elsif choice==4
	  puts "Enter the new status"
		status = gets.chomp	  	
		User.new.change_order_status(status)
	elsif choice==5
  		break
	end
end

