
module Decidim
  module FileAuthorizationHandler
    module Admin
      class CensusesController < Decidim::Admin::ApplicationController

        FILE_AUTHORIZATION_HANDLER_NAME = 'file_authorization_handler'.freeze

        before_action :show_instructions,
                      unless: :census_authorization_active_in_organization?

        def show
          authorize! :show, CensusDatum
          @status = Status.new(current_organization)
        end

        def create
          authorize! :create, CensusDatum
          if params[:file]
            data = CsvData.new(params[:file].path)
            CensusDatum.insert_all(current_organization, data.values)
            RemoveDuplicatesJob.perform_later(current_organization)
            flash[:notice] = t('.success', count: data.values.count,
                                           errors: data.errors.count)
          end
          redirect_to censuses_path
        end

        def destroy
          authorize! :destroy, CensusDatum
          CensusDatum.clear(current_organization)
          redirect_to censuses_path, notice: t('.success')
        end

        private

        def show_instructions
          render :instructions
        end

        def census_authorization_active_in_organization?
          current_organization.available_authorizations
                              .include?(FILE_AUTHORIZATION_HANDLER_NAME)
        end

      end
    end
  end
end
