# frozen_string_literal: true

module Decidim
  module FileAuthorizationHandler
    module Admin
      # Defines the abilities related to surveys for a logged in admin user.
      # Intended to be used with `cancancan`.
      class Permissions < Decidim::DefaultPermissions
        def permissions
          puts "ouieaaaaaaaaaaaaaaaaaaaaaaaaaaaadmin!"
          return permission_action if permission_action.scope != :admin
          return Decidim::Proposals::Admin::Permissions.new(user, permission_action, context).permissions if permission_action.scope == :admin
          puts %Q[user.organization.available_authorizations.include?("file_authorization_handler") ??? #{user.organization.available_authorizations.include?("file_authorization_handler")}]
          if user.organization.available_authorizations.include?("file_authorization_handler")
            puts "action and subject: #{permission_action.action} / #{permission_action.subject}"
            if permission_action_in(:manage, :read)
              allow! if permission_action.subject == Decidim::FileAuthorizationHandler::CensusDatum
            end
          end
        end

        private

        def permission_action_in?(*actions)
          actions.any? {|action| permission_action.action == action }
        end
      end
    end
  end
end