# CodeStats

Source code statistics and metrics.

[![rails-thumb]][rails-img] [![some-os-projects-thumb]][some-os-projects-img] [![mongoid-vs-mongomapper-thumb]][mongoid-vs-mongomapper-img]

Screenshots showing us: Complexity of [Rails libraries][rails-img], comparison of [some Open Source projects][some-os-projects-img] and [MongoMapper vs Mongoid][mongoid-vs-mongomapper-img] (You can see actual .html report files in [docs][docs]).

# Installation & Usage

The tool is language-agnostic, but to use it You need Ruby installed, to install type:

``` bash
gem install code_stats2
```

Now run it on some of Your projects, You can also specify some options (type 'code_stats' without arguments to see full help):

``` bash
code_stats /projects/wordpress
code_stats /projects/* --except JavaScript
```

Also You can easily customize it, sources are small and simple as an egg.

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