class A
  def do_a
    puts "#{self.object_id} hello A"
  end
end

class B
  def do_b
    puts "#{self.object_id} hello B"
    A.new.do_a
  end
end

require './complexity'

Complexity.new.trace do
  B.new.do_b
end
