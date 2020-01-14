=begin
Problem Statement:
Given 3 Superheros flash, shaktiman, spiderman with each having superpower 
like run fast, fly, jump high respectively. 
Write a script to find the superpower of the superhero. 
Restriction: Use one class and one module only.
=end

#module "SuperPower" contains 3 methods which is for 3 diffrent superpower
module SuperPower
	def can_fly
		return "Fly"
	end
	def can_jump
		return "Jump High"
	end
	def can_run
		return "Run Fast"
	end
end

=begin
class "SuperHero" includes the above method and contains a hash and a method
hash contains name of super hero as key and corresponding 
method name from module as value 
=end
class SuperHero
	include SuperPower
	@@powers_of_superhero = {"Shaktiman"=>"can_fly", "Spiderman"=>"can_jump", "Flash"=>"can_run"}
	def has_super_power(hero)
		power = @@powers_of_superhero[hero]
		return power
	end
end

#To get the name of Superhero as an input from user
puts "Enter the name of the superhero to know their power
i.e Spiderman, Flash, or Shaktiman"
hero_name = gets.chomp

superhero1 = SuperHero.new #object created
name_of_power_func = superhero1.has_super_power(hero_name) #to get the name of method in module
power = superhero1.send(name_of_power_func) #to get the power
puts "The superhero #{hero_name} has Superpower to #{power}" #print results 


=begin
akansha@akansha-Latitude-E5440:~$ ruby superhero.rb
Enter the name of the superhero to know their power
i.e Spiderman, Flash, or Shaktiman
Spiderman
The superhero Spiderman has Superpower to Jump High
akansha@akansha-Latitude-E5440:~$ ruby superhero.rb
Enter the name of the superhero to know their power
i.e Spiderman, Flash, or Shaktiman
Flash
The superhero Flash has Superpower to Run Fast
akansha@akansha-Latitude-E5440:~$ ruby superhero.rb
Enter the name of the superhero to know their power
i.e Spiderman, Flash, or Shaktiman
Shaktiman
The superhero Shaktiman has Superpower to Fly
akansha@akansha-Latitude-E5440:~$ 
=end
