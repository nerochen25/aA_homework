# def reverser(&block)
#   block.call.reverse
# end

# def reverser
#   yield.reverse
# end

def reverser(&prc) #undefined proc, {}
  sentence = prc.call #{sentence}
  words = sentence.split(" ")
  words.map { |word| word.reverse }.join(" ")
end
#How to call this method
# p reverse {'Hello World!'} #=> 'olleH !dlroW'

# def reverser
#   out = []
#   yield.split.each{|word| out << word.reverse}
#   out.join(" ")
# end

def adder (value=1, &prc) #defaut arg value is 1 if no arg is being passed
#or yield + value (without &proc arg)
  prc.call + value     #
end
#How to call this method:
#adder(2) {3} #=> 5

def repeater(times = 1, &prc) #default arg times value is 1, and an undefined proc
  times.times do
    prc.call
  end
end
# how to call repearter
# repeater(3) {n = 0; n += 1}
