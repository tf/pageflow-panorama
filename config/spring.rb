ENV['PAGEFLOW_RAILS_VERSION'] ||= '4.0.4'
Spring.application_root = File.join(__FILE__, "../../spec/dummy/rails-#{ENV['PAGEFLOW_RAILS_VERSION']}")
