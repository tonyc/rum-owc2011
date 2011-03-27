require 'refinery'

module Refinery
  module Contacts
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contacts"
          plugin.activity = {
            :class => Contact,
            :title => 'last_name'
          }
        end
      end
    end
  end
end
