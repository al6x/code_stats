class CodeStats::FileSet
  def initialize
    @lines_count_by_language, @characters_count_by_language = Hash.new(0), Hash.new(0)
  end
  
  def lines_count options = {}
    total_count = 0
    lines_count_by_language(options).each{|lang, count| total_count += count}
    total_count
  end

  def characters_count options = {}
    total_count = 0
    characters_count_by_language(options).each{|lang, count| total_count += count}
    total_count
  end

  def lines_count_by_language options = {}
    filter_by_lang(@lines_count_by_language, options)
  end

  def characters_count_by_language options = {}
    filter_by_lang(@characters_count_by_language, options)
  end

  def add script
    @lines_count_by_language[script.class.alias.to_sym] += script.lines_count
    @characters_count_by_language[script.class.alias.to_sym] += script.characters_count
  end
  
  AVAILIABLE_OPTIONS = [:only, :except]

  protected
    def filter_by_lang languages, options
      options.validate_options! *AVAILIABLE_OPTIONS
      only = options[:only] && Array.wrap(options[:only]).collect{|v| v.to_sym}
      except = options[:except] && Array.wrap(options[:except]).collect{|v| v.to_sym}

      languages.reject do |lang, count|
        (only && !only.include?(lang)) or (except and except.include?(lang))
      end
    end
end