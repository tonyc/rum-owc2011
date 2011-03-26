require 'refinery'

module Refinery
  module Payments
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "payments"
          plugin.activity = {
            :class => Payment,
            :title => 'transaction_id'
          }
        end
      end
    end
  end
end
