
desc "run RSpec tests"
task :run_tests do
  system("rspec ")
end

desc "run WarO"
task :run_waro => [:run_tests] do
  system("ruby -I lib bin/waro.rb config.txt")
end
