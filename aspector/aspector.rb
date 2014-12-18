require 'aspector'

class A
  def test
    puts "test"
  end
end

class LoggingAspect < Aspector::Base

  ALL_METHODS = /.*/

  around ALL_METHODS, :except => [:class], :method_arg => true do |method, proxy, *args, &block|
    class_method = "#{self.class}.#{method}"
    puts ">>> #{proxy.object_id} #{class_method}"
    proxy.call *args, &block
  end

end

LoggingAspect.apply A

t1 = A.new
t2 = A.new
t1.test
t2.test
t1.test
