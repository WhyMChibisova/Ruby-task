class Cipher
  DICTIONARY = "abcdefghijklmnopqrstuvwxyz"
  DICTIONARY_UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  attr_accessor :key

  def crypt(file_path)
    begin
      file = File.open(file_path, "r")
      text = file.read()
    rescue
      puts "File error"
    ensure
      file.close()
    end
    result = ""
    if @key.nil?
      puts "Enter the encryption key: "
      @key = gets.to_i
    else @key = -@key
    end

    text.each_char do |letter|
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

    begin
    file = File.open(file_path, "w")
    file.print(result)
    rescue
      puts "File error"
    ensure
      file.close()
    end
  end

end

cipher = Cipher.new()
puts cipher.crypt("text.txt")
puts "Encryption passed"
puts cipher.crypt("text.txt")
puts "Decryption passed"

cipher1 = Cipher.new()
cipher1.key = 5
puts cipher1.crypt("text.txt")
puts "Encryption passed"
puts cipher1.crypt("text.txt")
puts "Decryption passed"
