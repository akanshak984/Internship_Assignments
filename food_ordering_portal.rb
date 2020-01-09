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
			end
		end
		if (@present ==1)
			puts "Item Available"
		else
			puts "Item Unavilable"
		end

	end
	
	def order
	  @item = []     #ordered items
		@pamount = 0   #amount to be paid
		@tquantity = 0 #total quantity
		@titem = 0     #total item
		puts "\nMenu of food"
		puts "1. Chicken Roll $50"
		puts "2. Egg Roll $40"
		puts "3. Hamburger $60 "
		puts "\nEnter the number of item to be ordered"
		x = gets.to_i
		while x>0
			puts "\nEnter food name"
			i = gets.chomp
			puts "It's quantity"
			q = gets.to_i
			@item.push(i)
			@titem += 1
			@tquantity += q
			@pamount += q * @@menu[i]
			x = x - 1
		end
		if @tquantity>0
			@@status = "Order Confirmed"
		end	
		puts "\nOrder Summary"
		puts "You have ordered "
		puts @item
		puts "Total amount to be paid "
		puts @pamount	
	end
	
	def view_order_status
		puts "Order status " 
		puts @@status
	end

	def change_order_status (status)
		@@status = status
		puts "Order status changed to " 
		puts @@status
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
		o1 = User.new() #object created
		o1.order        
	elsif choice==2
		puts "\nEnter the item whose availability you want to check"
		item = gets.chomp	  	
		o1 = User.new()
		o1.check_availability (item)
	elsif choice==3
		o1 = User.new()
		o1.view_order_status
	elsif choice==4
	    	puts "Enter the new status"
		status = gets.chomp	  	
		o1 = User.new()
		o1.change_order_status (status)
	elsif choice==5
  		break
	end
end

=begin 
akansha@akansha-Latitude-E5440:~$ ruby food_ordering_portal.rb

Enter your choice
1. Order Food
2. Check Availability
3. View Order Status 
4. Change Order Status
5. Exit 
1

Menu of food
1. Chicken Roll $50
2. Egg Roll $40
3. Hamburger $60 

Enter the number of item to be ordered
2

Enter food name
Chicken Roll
It's quantity
2

Enter food name
Egg Roll
It's quantity
1

Order Summary
You have ordered 
Chicken Roll
Egg Roll
Total amount to be paid 
140

Enter your choice
1. Order Food
2. Check Availability
3. View Order Status 
4. Change Order Status
5. Exit 
2

Enter the item whose availability you want to check
Egg Roll
Item Available

Enter your choice
1. Order Food
2. Check Availability
3. View Order Status 
4. Change Order Status
5. Exit 
2

Enter the item whose availability you want to check
Pizza
Item Unavilable

Enter your choice
1. Order Food
2. Check Availability
3. View Order Status 
4. Change Order Status
5. Exit 
3
Order status 
Order Confirmed

Enter your choice
1. Order Food
2. Check Availability
3. View Order Status 
4. Change Order Status
5. Exit 
4   
Enter the new status
Order Delivered
Order status changed to 
Order Delivered

Enter your choice
1. Order Food
2. Check Availability
3. View Order Status 
4. Change Order Status
5. Exit 
5
akansha@akansha-Latitude-E5440:~$ 
=end
