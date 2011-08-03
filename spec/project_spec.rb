require 'spec_helper'

describe "Project" do 
  it "general" do
    prj = CodeStats::Project.new sample_project_path
    prj.name.should == 'sample_project'
    prj.files.size.should == 4
    
    prj.analyze!
    
    prj.unknown_extensions.should == [:unknown]
    
    # sources
    prj.lines_count.should == 10
    prj.characters_count.should == 32

    prj.lines_count_by_language.should == {JavaScript: 5, Ruby: 5}
    prj.characters_count_by_language.should == {JavaScript: 19, Ruby: 13}
    
    # specs
    prj.specs.lines_count.should == 2
    prj.specs.characters_count.should == 16

    prj.specs.lines_count_by_language.should == {Ruby: 2}
    prj.specs.characters_count_by_language.should == {Ruby: 16}    
  end
  
  it "language filters" do
    prj = CodeStats::Project.new sample_project_path
    prj.analyze!

    prj.lines_count(except: :JavaScript).should == 5
    prj.characters_count(except: :JavaScript).should == 13
  end
end