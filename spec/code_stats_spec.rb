require 'spec_helper'

describe "Project" do
  it "analyze" do
    projects = CodeStats.analyze sample_project_path
    report = CodeStats::Report.new(*projects).render
    report.should =~ /sample_project.+32/m
  end

  it "should also accept options (from error)" do
    projects = CodeStats.analyze sample_project_path
    report = CodeStats::Report.new(*(projects << {except: :JavaScript})).render
    report.should =~ /sample_project.+13/m
  end
end