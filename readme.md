# Code Stats

[![rails-thumb]][rails-img] [![some-os-projects-thumb]][some-os-projects-img] [![mongoid-vs-mongomapper-thumb]][mongoid-vs-mongomapper-img]

Screenshots are showing us: Complexity of [Rails libraries][rails-img], Comparing [some Open Source projects][some-os-projects-img], [MongoMapper vs Mongoid][mongoid-vs-mongomapper-img] (You can see the actual .html files in [docs][docs]).

# What's the point of these graphs and numbers?

I deliberately choose the Red color for the sources (and the Blue for specs / tests) because the less code - the better (in general, with other things been equal).

Code Stats sources is small and simple as an egg - You can easilly examine all sources in about 20-30 minutes and be able to easilly hack and customize it.

# Installation & Usage

This tool is language-agnostic, but it itself is made with Ruby, so You need Ruby installed to use it. Next, just install it as a gem:

``` bash
gem install code_stats2
```

Now run it on some of Your projects, You can also specify some options (type code_stats without arguments to see full help):

``` bash
code_stats /projects/wordpress
code_stats /projects/* except: JavaScript
```

# Power law, efficiency and decision making

[TODO about the [Power law][power_law] (also known as the Pareto principle and the 80-20 rule) and it's fundamental nature]

[TODO about my causes to write such strange tool: why it's so simple and why language-agnostic is important: find simple game project, compare my own projects with other, find big places in my sources, see spec/code ratio to evaluate helth of project]

[TODO about decition makin: right now there's tons and tons and tons of tools, projects and all stuff, it's hard to navigate, examine and score them]

[TODO efficiency: what code parts is most important]

Copyright (c) Alexey Petrushin http://petrush.in, released under the MIT license.

[docs]: https://github.com/alexeypetrushin/code_stats/tree/master/docs

[rails-thumb]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/rails.thumb.png
[some-os-projects-thumb]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/some-os-projects.thumb.png
[mongoid-vs-mongomapper-thumb]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/mongoid-vs-mongomapper.thumb.png

[rails-img]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/rails.png
[some-os-projects-img]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/some-os-projects.png
[mongoid-vs-mongomapper-img]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/mongoid-vs-mongomapper.png

[rails]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/rails.html
[some-os-projects]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/some-os-projects.html
[mongoid-vs-mongomapper]: https://github.com/alexeypetrushin/code_stats/raw/master/docs/mongoid-vs-mongomapper.html

[power_law]: http://en.wikipedia.org/wiki/Power_law