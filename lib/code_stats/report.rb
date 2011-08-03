class CodeStats::Report
  attr_reader :filters, :projects
  def initialize *args
    @filters = args.extract_options!
    @projects = args    
  end
  
  def render
    # preparing data
    data = projects.clone
    data.sort!{|a, b| b.characters_count(filters) <=> a.characters_count(filters)}
    data.collect! do |p|
      o = OpenObject.new
      o.name = p.name
      
      o.characters_count = p.characters_count(filters)
      o.characters_count_by_language = p.characters_count_by_language(filters)                
      o.ignored_characters_count_by_language = p.characters_count_by_language.reject do |lang, count|
        o.characters_count_by_language.include?(lang)
      end
      
      o.specs = OpenObject.new        
      o.specs.characters_count = p.specs.characters_count(filters)
      o.specs.characters_count_by_language = p.specs.characters_count_by_language(filters)                
      o.specs.ignored_characters_count_by_language = p.specs.characters_count_by_language.reject do |lang, count|
        o.specs.characters_count_by_language.include?(lang)
      end
      
      o.unknown_extensions = p.unknown_extensions
      
      o
    end
            
    # rendering
    dir = __FILE__.dirname.to_dir
    css = [dir['report/style.css'].read].join("\n")
    js = %w(jquery.js highchart.js report.js).collect{|n| dir["report/#{n}"].read}.join("\n")
    
    report = dir / 'report.html.haml'
    report.render(projects: data, filters: filters, css: css, js: js)
  end
end