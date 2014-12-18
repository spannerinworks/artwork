module MethodLogger
  def self.included(base)
    methods = base.public_instance_methods(false)
    base.class_eval do
      methods.each do |method_name|
        original_method = instance_method(method_name)
        define_method(method_name) do |*args, &block|
          puts " -> #{base}(#{object_id}).#{method_name}"
          puts caller_locations(1,1)[0].class
          original_method.bind(self).call(*args, &block)
        end
      end
    end
  end
end

class A
  def test
    puts 'test'
  end
end

class B
  def test
    A.new.test
  end
end

[A, B].each do |clazz|
  clazz.include MethodLogger
end

o1 = B.new
o1.test


