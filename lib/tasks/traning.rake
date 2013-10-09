desc 'run training tests'
task :training do
  Rake::Task["spec:vulnerabilities"].invoke
end