# frozen_string_literal: true

# class to make files and show them
class First
  def self.make_files(*str)
    if str.empty?
      make_f
    else
      make_f(str)
    end
    make_g
  end

  def self.make_f(*str)
    str = str.join unless str.empty?
    file_f = File.new('F.txt', 'w')
    str = (0...rand(10..30)).map { rand(-20..100) }.join(' ') if str.empty?
    file_f.write(str)
    file_f.close
  end

  def self.make_g
    file_g = File.new('G.txt', 'w')

    File.open('F.txt', 'r').readline.split(' ').map(&:to_i).each do |number|
      file_g << "#{number} " if (number % 3).zero? && (number % 7 != 0)
    end

    file_g.close
  end

  def self.show_files
    puts "\nFile F:"
    file_f = File.open('F.txt', 'r')
    puts file_f.readline
    file_f.close

    puts "\nFile G:"
    file_g = File.open('G.txt')
    puts file_g.readline
    file_g.close
  end
end
