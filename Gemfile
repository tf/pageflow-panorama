source 'https://rubygems.org'

# Specify your gem's dependencies in panorama.gemspec
gemspec

gem 'rails', ENV.fetch('PAGEFLOW_RAILS_VERSION', '4.0.4')
gem 'pageflow', path: '../pageflow'
gem 'pageflow-support', path: '../pageflow/spec/support'

gem 'state_machine', git: 'https://github.com/tf/state_machine.git', branch: 'master'
gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin.git', branch: 'master'

gem 'spring-commands-rspec', group: :development
