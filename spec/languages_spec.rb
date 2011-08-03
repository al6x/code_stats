require 'spec_helper'

shared_examples_for 'language' do
  it "should strip comments" do
    lang = CodeStats.parse @script, @extension
    lang.code.should == <<-CODE
code_a
code_b
CODE
    # lang.code.should_not include 'comment_a'
    # lang.code.should_not include 'comment_a2'
    # lang.code.should_not include 'comment_b'
    # lang.code.should_not include 'comment_b2'
  end
end

describe "Java" do
  it_should_behave_like "language"
  
  before do
    @extension = :java
    @script = <<-JAVA
code_a
/*
comment_a
*/
/*
 * comment_a2
 */
// comment_b
// comment_b2
code_b
JAVA
  end
end

describe "JavaScript" do
  it_should_behave_like "language"
  
  before do
    @extension = :js
    @script = <<-JAVA_SCRIPT
code_a
/*
comment_a
*/
/*
 * comment_a2
 */
// comment_b
// comment_b2
code_b
JAVA_SCRIPT
  end
  
  it "removing comments should correctly change lines count" do
    script = <<-JAVA_SCRIPT
// a variable
a = 1;

/*
 * b variable
 */
b = 2;

// sum
alert(a + b);
JAVA_SCRIPT

    code = <<-JAVA_SCRIPT
a = 1;

b = 2;

alert(a + b);
JAVA_SCRIPT
    
    lang = CodeStats.parse script, :js
    lang.code.should == code
  end
end

describe "Ruby" do
  it_should_behave_like "language"
  
  before do
    @extension = :rb
    @script = <<-RUBY
code_a
# comment_a
# comment_a2
code_b
RUBY
  end
end

describe "Cpp" do
  it_should_behave_like "language"
  
  before do
    @extension = :cpp
    @script = <<-CPP
code_a
/*
comment_a
*/
/*
 * comment_a2
 */
// comment_b
// comment_b2
code_b
CPP
  end
end

describe "CoffeeScript" do
  it_should_behave_like "language"
  
  before do
    @extension = :coffee
    @script = <<-COFFEE_SCRIPT
code_a
###
comment_a
###
###
comment_a2
###
# comment_b
# comment_b2
code_b
COFFEE_SCRIPT
  end
end

describe "Yaml" do
  it_should_behave_like "language"
  
  before do
    @extension = :yml
    @script = <<-YAML
code_a
# comment_a
# comment_a2
code_b
YAML
  end
end

describe "Haml" do
  it_should_behave_like "language"
  
  before do
    @extension = :haml
    @script = <<-HAML
code_a
/ comment_a
/ comment_a2
code_b
HAML
  end
end

describe "Erb" do
  it_should_behave_like "language"
  
  before do
    @extension = :erb
    @script = <<-ERB
code_a
code_b
ERB
  end
end

describe "Rjs" do
  it_should_behave_like "language"
  
  before do
    @extension = :rjs
    @script = <<-RJS
code_a
code_b
RJS
  end
end

describe "Php" do
  it_should_behave_like "language"
  
  before do
    @extension = :php
    @script = <<-PHP
code_a
/*
comment_a
*/
/*
 * comment_a2
 */
// comment_b
// comment_b2
code_b
PHP
  end
end

describe "Python" do
  it_should_behave_like "language"
  
  before do
    @extension = :py
    @script = <<-PYTHON
code_a
# comment_a
# comment_a2
code_b
PYTHON
  end
end