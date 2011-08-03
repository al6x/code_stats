String.class_eval do
  # Ruby just crashes on some files, don't know why and don't want to 
  # spend time on this shit, just found this hack somewhere in the internet.
  def force_utf8_encoding
    force_encoding('binary').gsub(156.chr,"Oe")
  end
end

Numeric.class_eval do
  def to_s_with_delimiter delimiter = ' '
    to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
  end
end