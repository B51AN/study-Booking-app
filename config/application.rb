require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookingStudy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_dispatch.default_headers.merge!({
      "Content-Security-Policy" => "default-src 'self'; script-src 'self'; img-src 'self'"
    })

    config.action_dispatch.default_headers.merge!({
  "X-Content-Type-Options" => "nosniff"
})


config.action_dispatch.default_headers.merge!({
  "X-Frame-Options" => "DENY"
})

config.action_dispatch.default_headers.merge!({
  "Referrer-Policy" => "strict-origin-when-cross-origin"
})
  end
end
