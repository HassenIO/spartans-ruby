guard 'rspec', cmd: 'bundle exec rspec --color' do

  # watch /lib/ files
  watch(%r{^lib/(.+).rb$}) { |m| "spec/#{m[1]}_spec.rb" }

  # watch /spec/ files
  watch(%r{^spec/(.+).rb$}) { |m| "spec/#{m[1]}.rb" }

end
