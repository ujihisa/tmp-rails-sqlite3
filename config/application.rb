## download ./db/production.sqlite3
require 'google/cloud/storage'

credentials =
  if ENV['CREDENTIALS_JSON']
    JSON.pasre(ENV['CREDENTIALS_JSON'])
  else
    'devs-sandbox-5941dd8999bb.json'
  end
storage = Google::Cloud::Storage.new(
  project_id: 'devs-sandbox',
  credentials: credentials,
)

bucket = storage.bucket('tmp-rails-sqlite3')
file = bucket.file('production.sqlite3')
file.download('db/production.sqlite3')

## ok



require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TmpRailsSqlite3
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
