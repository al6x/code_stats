# Code Stats

[![rails-thumb]][rails-img] [![some-os-projects-thumb]][some-os-projects-img] [![mongoid-vs-mongomapper-thumb]][mongoid-vs-mongomapper-img]

Screenshots are showing us: Complexity of [Rails libraries][rails-img], comparison of [some Open Source projects][some-os-projects-img] and [MongoMapper vs Mongoid][mongoid-vs-mongomapper-img] (You can see actual .html report files in [docs][docs]).

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

Also You can easily customize it, sources of Code Stats is small and simple as an egg - You can easilly examine all of them in about 20-30 minutes and be able to easilly hack it.

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