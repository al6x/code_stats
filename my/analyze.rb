lib_dir = %(#{File.expand_path "#{__FILE__}/../.."}/lib)
$LOAD_PATH << lib_dir unless $LOAD_PATH.include? lib_dir

require 'code_stats'


# Modules of the Rad Framework
# paths = "/Users/alex/projects/core/lib/rad".to_dir.dirs.collect{|dir| dir.path}
# CodeStats.analyze_and_report(*(paths << {except: :JavaScript}))


# My Projects
# paths = "/Users/alex/projects".to_dir.dirs.collect{|dir| dir.path}
# CodeStats.analyze_and_report(*(paths << {except: :JavaScript}))

# Rubinius
# paths = "/Users/alex/other_projects/rubinius".to_dir.dirs.collect{|dir| dir.path}
# CodeStats.analyze_and_report(*(paths << {except: :JavaScript}))


# Rails
paths = "/Users/alex/other_projects/z-libs/rails".to_dir.dirs.collect{|dir| dir.path}.select{|dir| dir =~ /\/acti|\/railti/}
paths << "/Users/alex/projects/core"
CodeStats.analyze_and_report(*(paths << {except: :JavaScript}))


# Some interesting Open Source projects
# CodeStats.analyze_and_report(
#   # '/Users/alex/other_projects/wordpress',
#   '/Users/alex/other_projects/drupal-7.2',
#   '/Users/alex/other_projects/calipso',
#   '/Users/alex/other_projects/fat_free_crm',
#   '/Users/alex/other_projects/shapado',
#   '/Users/alex/other_projects/spree',
#   '/Users/alex/other_projects/mongoid',
#   '/Users/alex/other_projects/mongomapper',
#   '/Users/alex/other_projects/active_admin',
#   '/Users/alex/other_projects/rucksack',
#   '/Users/alex/other_projects/railscollab',
#   # '/Users/alex/other_projects/redmine',
#   # '/Users/alex/other_projects/refinerycms'
#   '/Users/alex/other_projects/teambox',
#   '/Users/alex/other_projects/diaspora',
#   '/Users/alex/projects/core',
#   '/Users/alex/.rvm/gems/ruby-1.9.2-p136/gems/activemodel-3.0.8',
#   except: [:JavaScript, :Yaml]
# )


# Some interesting Open Source games
# CodeStats.analyze_and_report(
#   '/Users/alex/other_projects/catchemrpg',
#   '/Users/alex/other_projects/andors-trail-read-only',
#   '/Users/alex/other_projects/flare',
#   '/Users/alex/other_projects/wrath',
#   # '/Users/alex/other_projects/stratagus',
#   '/Users/alex/other_projects/trunk',
#   # '/Users/alex/other_projects/btanks',
#   '/Users/alex/other_projects/glest',
#   '/Users/alex/other_projects/orona',
#   # '/Users/alex/other_projects/spring',
#   '/Users/alex/projects',
#   '/Users/alex/other_projects/WARPG',
#   '/Users/alex/other_projects/robhawkes',
#   '/Users/alex/other_projects/fontanero',
# )