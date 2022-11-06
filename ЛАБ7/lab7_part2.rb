# frozen_string_literal: true

# Class to make files and show them
class Troika

  attr_reader :str

  def initialize(str)
    @str = str
  end

  def calc
    first = @str.scan(/-?\d+\.?\d*/)[0].to_f
    second = @str.scan(/-?\d+\.?\d*/)[1].to_f

    case @str.split[1]
    when '+'
      first + second
    when '-'
      first - second
    when '/'
      first / second
    when '*'
      first * second
    else
      'error'
    end
  end
end

# Class with ()
class TroikaSkobka < Troika
  def initialize(str)
    @str = str
  end
end
