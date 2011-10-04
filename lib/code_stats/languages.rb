module CodeStats::Languages
  class Abstract
    attr_reader :text

    def initialize text
      @text = text
    end

    def self.extensions *args
      if args.size > 0
        @extensions = args

        @extensions.each{|ext| CodeStats.extensions[ext] = self}
      else
        @extensions ||= []
      end
    end

    def lines_count
      calculate_basic_statistics
      @lines_count
    end

    def characters_count
      calculate_basic_statistics
      @characters_count
    end

    def analyze
      calculate_basic_statistics
    end

    protected
      def calculate_basic_statistics
        return if @basic_statistics_calculated
        @basic_statistics_calculated = true

        @lines_count = code.blank? ? 0 : 1
        @characters_count = 0
        code.chars do |c|
          @lines_count += 1 if c == "\n"
          @characters_count += 1 unless c =~ /\s/
        end
      end
  end

  module CComments
    def code
      @code ||= text.substitute(/\/\*.+?\*\/\n?/m, '').substitute(/^\/\/.+?[\n\z]/m, '').substitute(/\/\/.+?$/, '')
    end
  end

  module SharpComments
    def code
      @code ||= text.substitute(/^#.+?[\n\z]/m, '').substitute(/#.+?$/, '')
    end
  end

  class Java < Abstract
    include CComments

    extensions :java
  end

  class JavaScript < Abstract
    include CComments

    extensions :js
  end

  class Ruby < Abstract
    include SharpComments

    extensions :rb
  end

  class Cpp < Abstract
    include CComments

    extensions :c, :cpp, :h
  end

  class Yaml < Abstract
    include SharpComments

    extensions :yml
  end

  class CoffeeScript < Abstract
    include SharpComments

    extensions :coffee

    def code
      @code ||= text.substitute(/###.+?###\n?/m, '').substitute(/^#.+?[\n\z]/m, '').substitute(/#.+?$/, '')
    end
  end

  class Haml < Abstract
    extensions :haml

    def code
      @code ||= text.substitute(/^\/.+?[\n\z]/m, '').substitute(/^\s*\/.+?$/, '')
    end
  end

  class Erb < Abstract
    extensions :erb

    def code
      @code ||= text
    end
  end

  class Rjs < Abstract
    extensions :rjs

    def code
      @code ||= text
    end
  end

  class Php < Abstract
    include CComments

    extensions :php
  end

  class Python < Abstract
    include SharpComments

    extensions :py
  end

  class Clojure < Abstract
    extensions :clj

    def code
      @code ||= text.substitute(/^;.+?[\n\z]/m, '').substitute(/;.+?$/, '')
    end
  end
end