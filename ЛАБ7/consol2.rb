require_relative 'lab7_part2.rb'

troika = Troika.new('2 * 3')
puts 'String: ' + troika.str
puts 'Result: ' + troika.calc.to_s
troika_with = TroikaSkobka.new('(-2.55 + -3.5)')
puts 'String: ' + troika_with.str
puts 'Result: ' + troika_with.calc.to_s
