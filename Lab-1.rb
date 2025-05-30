class Book
    attr_accessor :title, :author, :isbn
  
    def initialize(title, author, isbn)
      @title = title
      @author = author
      @isbn = isbn
    end
  
    def to_s
      "#{title},#{author},#{isbn}"
    end
  
    def self.from_string(line)
      title, author, isbn = line.strip.split(",")
      Book.new(title, author, isbn)
    end
  end
  
  class Inventory
    FILE_NAME = "DB.txt"
  
    def add_book(book)
      File.open(FILE_NAME, "a") do |file|
        file.puts book.to_s
      end
      puts "Book added"
    end
  
    def list_books
      if File.exist?(FILE_NAME)
        puts "\nAll Books:"
        File.readlines(FILE_NAME).each_with_index do |line, index|
          book = Book.from_string(line)
          puts "#{index + 1}. #{book.title} by #{book.author} (ISBN: #{book.isbn})"
        end
      else
        puts "No books yet"
      end
    end
  
    def remove_book(isbn)
      if File.exist?(FILE_NAME)
        books = File.readlines(FILE_NAME)
        new_books = books.reject { |line| line.include?(isbn) }
  
        if books.length == new_books.length
          puts "Book not found"
        else
          File.open(FILE_NAME, "w") do |file|
            file.puts new_books
          end
          puts "Book removed"
        end
      else
        puts "No books to remove"
      end
    end
  end
  
  # ==== Very Simple Menu ====
  
  inventory = Inventory.new
  
  loop do
    puts "\n--- Book Inventory ---"
    puts "1. Add Book"
    puts "2. List Books"
    puts "3. Remove Book by ISBN"
    puts "4. Exit"
    print "Choose: "
  
    choice = gets.chomp
  
    case choice
    when "1"
      print "Enter Title: "
      title = gets.chomp
      print "Enter Author: "
      author = gets.chomp
      print "Enter ISBN: "
      isbn = gets.chomp
  
      if title.empty? || author.empty? || isbn.empty?
        puts "Please enter all fields"
      else
        book = Book.new(title, author, isbn)
        inventory.add_book(book)
      end
    when "2"
      inventory.list_books
    when "3"
      print "Enter ISBN to remove: "
      isbn = gets.chomp
      inventory.remove_book(isbn)
    when "4"
      puts "Bye"
      break
    else
      puts "Invalid choice"
    end
  end
  