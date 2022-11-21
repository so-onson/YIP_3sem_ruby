# frozen_string_literal: true

# Class to make files and show them
class Troika
  attr_reader :str
  VALIDATOR = %r{-?\d+\.?\d*\s*(\+|-|\*|\/)\s*-?\d+\.?\d*}.freeze

  def initialize(str, validate: true)
    raise 'Invalid input' unless !validate || str.match(/^#{VALIDATOR}$/)

    @str = str
  end

  def calc
    scn = @str.scan(/-?\d+\.?\d*/)
    first = scn[0].to_f
    second = scn[-1].to_f

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
  VALIDATOR = /\(#{Troika::VALIDATOR}\)/.freeze

  def initialize(str)
    raise 'Invalid input' unless str.match(/^#{VALIDATOR}$/)

    super(str, validate: false)
  end
end
