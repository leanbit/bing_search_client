$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bing_search_client'
require 'webmock/rspec'


RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.before(:each) do
    BingSearchClient.reset_config
  end
end
