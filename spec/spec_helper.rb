require 'rspec_ext'
require 'code_stats'

rspec do
  def sample_project_path
    "#{__FILE__.dirname}/sample_project"
  end
end