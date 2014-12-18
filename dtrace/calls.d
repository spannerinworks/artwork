/*
  http://tenderlovemaking.com/2011/12/05/profiling-rails-startup-with-dtrace.html
  sudo dtrace -q -s calls.d -c'ruby hello_world.rb'

  http://magazine.rubyist.net/?Ruby200SpecialEn-dtrace
  sudo dtrace -q -n'ruby$target:::method-entry { printf("hello world\n"); }' -c"ruby -e'puts :hi'"

  https://github.com/ruby/ruby/blob/trunk/probes.d
*/

ruby*:::method-entry
{
  printf("%s#%s\n", copyinstr(arg0), copyinstr(arg1));
}
