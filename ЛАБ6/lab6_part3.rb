# frozen_string_literal: true

# Class to calculate integral by rectangle method
class Third
  def self.intprg(start, finish, &func)
    hod = 0.1
    (start...finish).step(hod).map { |x| x + hod / 2 }.map(&func).inject(:+) * hod
  end
end
