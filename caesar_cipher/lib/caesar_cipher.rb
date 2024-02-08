# frozen_string_literal: true
class Caesar
  def caesar_cipher(string, shift)
    alphabet_upper = ('A'..'Z').to_a
    alphabet_lower = ('a'..'z').to_a
    arr = string.split('')
    arr = arr.map do |character|
      if alphabet_lower.include?(character)
        index = (alphabet_lower.find_index(character) + shift) % alphabet_lower.length
        alphabet_lower[index]
      elsif alphabet_upper.include?(character)
        index = (alphabet_upper.find_index(character) + shift) % alphabet_upper.length
        alphabet_upper[index]
      else
        character
      end
    end
    arr.join('')
  end
end

# caesar = Caesar.new
# puts caesar.caesar_cipher("haha3131!", 5)
