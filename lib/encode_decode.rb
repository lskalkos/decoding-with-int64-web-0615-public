require 'pry'

def encode_int64(message)
  # code this method first

  h = 7
  letters = "acdegilmnoprstuw"
  error_message = "The word should only contain letters in acdegilmnoprstuw"

  message.split("").each{ |character| return error_message if !letters.include?(character) }

  for i in 0..(message.length-1)
    h = (h * 37 + letters.index(message[i]))
  end

  h
end



def decode_int64(encoded_message)
  # code this second

  letters = "acdegilmnoprstuw"

  "".tap do |string|
    while encoded_message > 7
      letters.split("").each do |letter|
        letter_index = letters.index(letter)

        #This gives you back h and determines the index of the last letter added
        number = (encoded_message - letter_index)/37.0

        if number % 1 == 0 #if number is a whole number, we must have found the letter index for the last letter
          string << letters[letter_index]
          encoded_message = number #repeat for the next h
        end

        break if encoded_message <= 7.0
      end
    end

    string.reverse!
  end


end