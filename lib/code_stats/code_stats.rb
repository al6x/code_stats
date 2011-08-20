class CodeStats
  class << self
    def know? extension
      extensions.include? extension
    end

    def parse text, extension
      language = extensions[extension] || raise("no language for :#{extension} extension!")
      language.new text
    end

    def analyze *args
      options = args.extract_options!
      paths = args
      paths.collect!{|path| Dir[path]}.flatten!

      info <<-TEXT
please wait, analyzing:
  #{paths.join("\n  ")}
TEXT

      projects = paths.collect do |path|
        project = Project.new path, options
        project.analyze!
        project
      end
      projects.sort{|a, b| b.characters_count <=> a.characters_count}
    end

    def analyze_and_report *args
      # parsing options
      options = args.extract_options!
      paths = args

      options.validate_options! *(FileSet::AVAILIABLE_OPTIONS + Project::AVAILIABLE_OPTIONS)
      project_options = options.select{|k, v| Project::AVAILIABLE_OPTIONS.include? k}
      lang_options = options.select{|k, v| FileSet::AVAILIABLE_OPTIONS.include? k}

      # analyzing & reporting
      projects = analyze *(paths << project_options)
      report = Report.new(*(projects << lang_options)).render

      report_file = "./projects_statistics.html".to_file
      report_file.write! report

      info "done, statistics are in #{report_file}"

      Kernel.exec "open #{report_file}"
    end

    protected
      def info msg
        puts msg
      end
  end
end