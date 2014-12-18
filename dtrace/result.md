```
$ sudo dtrace -q -s calls.d -c'ruby hello_world.rb'
hello world
hello_world.rb: Object#doit
```
