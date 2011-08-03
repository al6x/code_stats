raise 'ruby 1.9.2 or higher required!' if RUBY_VERSION < '1.9.2'

require 'code_stats/gems'

require 'ruby_ext'
require 'vfs'
require 'haml'
require 'tilt'

class CodeStats
  class << self
    def extensions; @extensions ||= {} end
    
    attr_accessor :file_size_limit
    attr_required :file_size_limit    
  end
  
  self.file_size_limit = 500 * 1024
end

%w(
  support
  languages
  file_set
  project
  report
  code_stats
).each{|f| require "code_stats/#{f}"}