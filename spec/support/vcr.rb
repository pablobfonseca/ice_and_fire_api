require 'vcr'

VCR.configure do |config|
  config.hook_into :webmock
  config.ignore_localhost = true
  config.default_cassette_options = { record: :new_episodes }
  config.configure_rspec_metadata!
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.around(:each, vcr: true) do |example|
    name = example.metadata[:full_description].gsub(/\W+/, '_').split('_', 2).join('/').underscore
    VCR.use_cassette(name, record: :new_episodes) do
      example.call
    end
  end
end
