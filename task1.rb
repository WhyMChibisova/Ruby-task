class Cipher

  DICTIONARY = "abcdefghijklmnopqrstuvwxyz"
  DICTIONARY_UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  attr_accessor :key

  def encrypt(file_path)
    file = File.open(file_path, "r")
    text = file.read()
    file.close()
    result = ""

    if @key == nil
      puts "Enter the encryption key: "
      @key = gets.to_i
    end

    text.split('').each do |letter|
      if DICTIONARY.include?(letter)
        index = DICTIONARY.index(letter)
        result += DICTIONARY[(index + @key) % DICTIONARY.length()]
      elsif DICTIONARY_UPPER.include?(letter)
        index = DICTIONARY_UPPER.index(letter)
        result += DICTIONARY_UPPER[(index + @key) % DICTIONARY_UPPER.length()]
      else result += letter
      end
    end
    puts result
    file = File.open(file_path, "w")
    file.print(result)
    file.close()
  end

  def decrypt(file_path)
    file = File.open(file_path, "r")
    text = file.read()
    file.close()
    result = ""

    if @key == nil
      puts "Enter the encryption key: "
      @key = gets.to_i
    end

    text.split('').each do |letter|
      if DICTIONARY.include?(letter)
        index = DICTIONARY.index(letter)
        result += DICTIONARY[(index - @key) % DICTIONARY.length()]
      elsif DICTIONARY_UPPER.include?(letter)
        index = DICTIONARY_UPPER.index(letter)
        result += DICTIONARY_UPPER[(index - @key) % DICTIONARY_UPPER.length()]
      else
        result += letter
      end
    end
    puts result
    file = File.open(file_path, "w")
    file.print(result)
    file.close()
  end

end

cipher = Cipher.new()
puts cipher.encrypt("text.txt")
puts "Encryption passed"
puts cipher.decrypt("text.txt")
puts "Decryption passed"

cipher1 = Cipher.new()
cipher1.key = 5
puts cipher1.encrypt("text.txt")
puts "Encryption passed"
puts cipher1.decrypt("text.txt")
puts "Decryption passed"
