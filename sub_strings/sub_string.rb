# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
def substrings(string, dictionary)
  dictionary.each_with_object(Hash.new(0)) do |substring, result|
    result[substring] = string.downcase.scan(/(?=#{substring})/).count if string.downcase.include?(substring)
  end
end
puts 'Enter some string: '
inputString = gets.chomp
hashListing = substrings(inputString, dictionary)
puts hashListing
