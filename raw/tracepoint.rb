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

# Artistic license :-)

stack = []

trace = TracePoint.new(:call, :return) do |tp|
  case tp.event
    when :call
      puts "#{stack.last} -> #{tp.self.object_id}"
      stack.push tp.self.object_id
    when :return
      stack.pop
  end
end

trace.enable

B.new.do_b
