require 'ruby-prof'

def profile_stuff(&block)
  result = RubyProf.profile do
    yield block
  end

  # Print a graph profile to text
  printer = RubyProf::GraphPrinter.new(result)
  printer.print(STDOUT, {})
end
