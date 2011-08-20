class CodeStats::Project
  attr_reader :path, :name, :specs_filter, :skip_filter, :unknown_extensions
  attr_reader :sources, :specs

  AVAILIABLE_OPTIONS = [:specs_filter, :skip_filter]
  DEFAUL_SPEC_FILTER = /\/tests?\/|\/specs?\//
  DEFAUL_SKIP_FILTER = /\/docs?\/|\/(s|ex)amples?\/|\/guides?\/|\/.git\/|\/tmp\/|database\.php/

  def initialize path, options = {}
    @path, @name = path, path.to_entry.name
    options.validate_options! *AVAILIABLE_OPTIONS
    @specs_filter = options.include?(:specs_filter) ? options[:specs_filter] : DEFAUL_SPEC_FILTER
    @skip_filter = options.include?(:skip_filter) ? options[:skip_filter] : DEFAUL_SKIP_FILTER
    clear
  end

  def files &b
    files = []
    path.to_dir.files '**/*.*' do |file|
      next if skip?(file)
      b ? b.call(file) : files.push(file)
    end
    b ? nil : files
  end

  delegate :lines_count, :characters_count, :lines_count_by_language, :characters_count_by_language, to: :sources

  def analyze!
    clear
    files do |file|
      ext = file.extension.to_sym
      if CodeStats.know?(ext)
        warn("file #{file} is too big, skipping") and next if file.size > CodeStats.file_size_limit
        script = CodeStats.parse file.read.force_utf8_encoding, ext
        source?(file) ? sources.add(script) : specs.add(script)
      else
        unknown_extensions << ext unless unknown_extensions.include? ext
      end
    end
  end

  protected
    def clear
      @unknown_extensions = []
      @sources, @specs = CodeStats::FileSet.new, CodeStats::FileSet.new
    end

    def source? file
      !(specs_filter && (file.path.sub(path, '') =~ specs_filter))
    end

    def skip? file
      skip_filter && (file.path.sub(path, '') =~ skip_filter)
    end
end