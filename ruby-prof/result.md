```
ruby hello_world.rb
hello world
Thread ID: 70238624701420
Fiber ID: 70238628597260
Total Time: 7.099999999998774e-05
Sort by: total_time

  %total   %self      total       self       wait      child            calls    Name
--------------------------------------------------------------------------------
 100.00%  45.07%      0.000      0.000      0.000      0.000                1      Object#profile_stuff
                      0.000      0.000      0.000      0.000              1/1      Kernel#puts
--------------------------------------------------------------------------------
                      0.000      0.000      0.000      0.000              1/1      Object#profile_stuff
  54.93%   9.86%      0.000      0.000      0.000      0.000                1      Kernel#puts
                      0.000      0.000      0.000      0.000              1/1      IO#puts
--------------------------------------------------------------------------------
                      0.000      0.000      0.000      0.000              1/1      Kernel#puts
  45.07%   7.04%      0.000      0.000      0.000      0.000                1      IO#puts
                      0.000      0.000      0.000      0.000              2/2      IO#write
--------------------------------------------------------------------------------
                      0.000      0.000      0.000      0.000              2/2      IO#puts
  38.03%  38.03%      0.000      0.000      0.000      0.000                2      IO#write

* indicates recursively called methods
```
- No object references
- Aggregate data only
- Might have to come back and dig further
