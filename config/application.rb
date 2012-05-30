require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module PluploadExample
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/app/middlewares)
    
    config.autoload_paths << "#{config.root}/lib"
    
    Paperclip::Railtie.insert
    
    config.encoding = "utf-8"

    config.filter_parameters += [:password]
    
    config.active_record.whitelist_attributes = true
    config.assets.enabled = false
    config.assets.version = '1.0'
  end
end
