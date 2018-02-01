# frozen_string_literal: true

module Decidim
  module FileAuthorizationHandler
    module Abilities
      # Defines the abilities related to surveys for a logged in admin user.
      # Intended to be used with `cancancan`.
      class AdminAbility < Decidim::Abilities::AdminAbility

        def define_abilities
          super
          can :manage, Decidim::FileAuthorizationHandler::CensusDatum
        end

      end
    end
  end
end
