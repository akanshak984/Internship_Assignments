=begin
Write program for Hangman game -
            Its game for guessing word from one by one char input. 
user will have limited number of chances to guess the character.
=end

#array of words
valid_words = ["monkey", "donut", "great", "idea", "personality"]
#select a random word from array of words
word = valid_words[rand(valid_words.length)]
length_of_word = word.length

#no. of chances to guess
total_try = 5

#create a hash of selected word with key as alphabet
#and value as array of alphabet position (0 indexing)
hash_of_word = Hash.new{|hsh,key| hsh[key] = [] }
x = 0
word.split('').each { |c| hash_of_word[c].push(x)
        x+=1 
    }

puts "The word to guess"
#word to guess initially contains underscore for all places
array_of_word = []
for i in 0...length_of_word do 
    array_of_word.append("_")
end
print array_of_word

#array of alphabets already entered by user
array_of_input_alphabet = []

#give user a chance until he/she is out of attempts
while (total_try>0)
    #all characters of word guessed
    if (hash_of_word.empty?)
        puts "\nCongratulations!, You Won!!!"
        break
    else
        puts "\nEnter an alphabet to guess the word"
        puts "You have #{total_try} no. of tries left"
        input_alphabet = gets.chomp
        #until alphabet entered is entered before
        while(array_of_input_alphabet.include?(input_alphabet))
            puts "You have already used the alphabet, enter something else"
            input_alphabet = gets.chomp
        end 
        #add the aphabet to array of alphabets already entered by user
        array_of_input_alphabet.append(input_alphabet)
        #if alphabet entered is present in word to guess
        if (hash_of_word.has_key?(input_alphabet))
            #replace all the places of the word with the identified alphabet
            for i in hash_of_word[input_alphabet]
                array_of_word[i]=input_alphabet
            end
        #if alphabet entered is not present in word to guess
        else
            total_try-=1   #decrease the chance to guess/try
        end 
        #print partially guessed word
        print array_of_word
        #delete the alphabet from hash
        hash_of_word.delete(input_alphabet)  
    end
end

#if all alphabets of word not guessed i.e hash not empty and attempts is 0
if (total_try==0)
    puts "\nGame Over, You Lost!!! Man hanged \nOut of attempt. \nThe word was #{word}"
end


=begin

akansha@akansha:~/MyFolder$ ruby hanging_game.rb
The word to guess
["_", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_"]
Enter an alphabet to guess the word
You have 5 no. of tries left
p
["p", "_", "_", "_", "_", "_", "_", "_", "_", "_", "_"]
Enter an alphabet to guess the word
You have 5 no. of tries left
e
["p", "e", "_", "_", "_", "_", "_", "_", "_", "_", "_"]
Enter an alphabet to guess the word
You have 5 no. of tries left
f
["p", "e", "_", "_", "_", "_", "_", "_", "_", "_", "_"]
Enter an alphabet to guess the word
You have 4 no. of tries left
h
["p", "e", "_", "_", "_", "_", "_", "_", "_", "_", "_"]
Enter an alphabet to guess the word
You have 3 no. of tries left
s
["p", "e", "_", "s", "_", "_", "_", "_", "_", "_", "_"]
Enter an alphabet to guess the word
You have 3 no. of tries left
l
["p", "e", "_", "s", "_", "_", "_", "l", "_", "_", "_"]
Enter an alphabet to guess the word
You have 3 no. of tries left
i
["p", "e", "_", "s", "_", "_", "_", "l", "i", "_", "_"]
Enter an alphabet to guess the word
You have 3 no. of tries left
p
You have already used the alphabet, enter something else
l
You have already used the alphabet, enter something else
t
["p", "e", "_", "s", "_", "_", "_", "l", "i", "t", "_"]
Enter an alphabet to guess the word
You have 3 no. of tries left
y
["p", "e", "_", "s", "_", "_", "_", "l", "i", "t", "y"]
Enter an alphabet to guess the word
You have 3 no. of tries left
f
You have already used the alphabet, enter something else
z
["p", "e", "_", "s", "_", "_", "_", "l", "i", "t", "y"]
Enter an alphabet to guess the word
You have 2 no. of tries left
y
You have already used the alphabet, enter something else
x
["p", "e", "_", "s", "_", "_", "_", "l", "i", "t", "y"]
Enter an alphabet to guess the word
You have 1 no. of tries left
b
["p", "e", "_", "s", "_", "_", "_", "l", "i", "t", "y"]
Game Over, You Lost!!! Man hanged 
Out of attempt. 
The word was personality

=end