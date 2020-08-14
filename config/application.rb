require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SimpleNotesApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g| # to generate rspec file when using rails generators
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
      g.scaffold_controller = :scaffold_controller
    end
  end
end
