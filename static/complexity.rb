class Complexity

  def initialize
    @stack = []
    @object_map = {}
    @calls = Hash.new(0)
  end

  def trace
    trace = setup_trace
    trace.enable

    yield

    trace.disable
    print_data
  end

  private

  def setup_trace
    TracePoint.new(:call, :return) do |tp|
      case tp.event
        when :call
          if @object_map.has_key? tp.self.object_id
            target = @object_map[tp.self.object_id]
          else
            target = @object_map.size
            @object_map[tp.self.object_id] = target
          end

          source = @stack.last
          @calls["\"source\":#{source}, \"target\":#{target}"] += 1 if source
          @stack.push target
        when :return
          @stack.pop
      end
    end
  end

  def print_data
    puts '// COMPLEXITY START'
    puts '{'

    puts '"nodes": ['
    @object_map.each do |k, v|
      puts "{\"name\": \"#{k}\", \"group\": 1},"
    end
    puts ']'

    puts ', "links":['
    @calls.each do |k, v|
      puts "{#{k}, \"value\": #{v}},"
    end
    puts ']'

    puts '}'
    puts '// COMPLEXITY END'
  end

end
