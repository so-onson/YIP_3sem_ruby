a_,b_ = gets.split.map(&:to_f)

def calc(a,b) 
    (Math.sin(a)-b)/(b.abs+Math.cos(b**2))
end

puts calc(a_,b_)
