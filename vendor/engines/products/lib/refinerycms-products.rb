require 'refinery'

module Refinery
  module Products
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "products"
          plugin.activity = {
            :class => Product,
            :title => 'name'
          }
        end
      end
    end
  end
end
