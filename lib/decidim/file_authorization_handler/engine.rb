# frozen_string_literal: true

module Decidim
  module FileAuthorizationHandler
    # Census have no public app (see AdminEngine)
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::FileAuthorizationHandler

      initializer "decidim_census.add_authorization_handlers" do |_app|
        Decidim::Verifications.register_workflow(:file_authorization_handler) do |workflow|
          workflow.form = "FileAuthorizationHandler"
        end
      end
    end
  end
end
