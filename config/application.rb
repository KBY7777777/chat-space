require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0


    #応用No79の実演にて、controllerを自動生成するも無用なファイルが生成されないよう、下記コードを追記しておく
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end

    #応用No90にて、フラッシュメッセージを日本語で表示させる下記コードを追記。
    config.i18n.default_locale = :ja

    #応用No108にて、投稿日時情報を日本の標準時に調整する下記コードを追記。
    config.time_zone = 'Tokyo'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
