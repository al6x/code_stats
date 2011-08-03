# Code Stats

MongoMapper vs Mongoid, Complexity of Rails libraries, Comparing some Open Source projects

I deliberately choose the Red color for the sources (and the Blue for specs / tests) because the less code - the better (in general, with other things been equal).

It's simple as an egg - and it means that You can easilly understood all it's code in about 20-30 minutes and be able to easilly hack and customize it with Your needs.

# What's the point of these graphs and numbers?

# Installation & Usage

This tool is language-agnostic, but it itself is made with Ruby, so You need Ruby installed to use it. Next, just install it as a gem:

``` bash
gem install code_stats
```

Now run it on some of Your projects, You can also specify some options (type code_stats without arguments to see full help):

``` bash
code_stat /projects/wordpress
code_stat /projects/* except: JavaScript
```

Copyright (c) Alexey Petrushin http://petrush.in, released under the MIT license.

[]