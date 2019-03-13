class PigLatinizer
  attr_reader :words

  def piglatinize(words)
    alpha = ('a'..'z').to_a
    vowels = %w[a e i o u]
    consonants = alpha - vowels

    result = words.split.map do |word|
      if vowels.include?(word.downcase[0]) #downcase only for array[0] (first letter) 
        word + 'way'
      elsif consonants.include?(word.downcase[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
        word[3..-1] + word[0..2] + 'ay'
      elsif consonants.include?(word.downcase[0]) && consonants.include?(word[1])
        word[2..-1] + word[0..1] + 'ay'

      elsif consonants.include?(word.downcase[0])
        word[1..-1] + word[0] + 'ay'
      else
        word # return unchanged
      end
    end.join(" ")


  end

end
