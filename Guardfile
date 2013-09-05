# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'brakeman', :run_on_start => true do
  watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
  watch(%r{^config/.+\.rb$})
  watch(%r{^lib/.+\.rb$})
  watch('Gemfile')
end

guard :shell do
	watch(%r{^Gemfile|Gemfile.lock$}) { system("bundle-audit")}
end

guard 'livereload', host: "railsgoat.dev", port: '35727' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html))).*}) { |m| "/assets/#{m[3]}" }
end

guard :shell do
  watch(%r{test/unit/.+\.rb}) { system("rake")} 
  watch(%r{test/functional/.+\.rb}) { system("rake")} 

end