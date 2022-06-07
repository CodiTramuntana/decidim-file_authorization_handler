# frozen_string_literal: true

require "spec_helper"
RSpec.describe Decidim::FileAuthorizationHandler::Admin::CensusesController, type: :controller do
  include Warden::Test::Helpers

  routes { Decidim::FileAuthorizationHandler::AdminEngine.routes }

  let(:organization) do
    FactoryBot.create :organization,
                      available_authorizations: ["file_authorization_handler"]
  end

  let(:user) do
    FactoryBot.create :user, :admin, :confirmed, organization: organization, admin: true
  end

  before do
    controller.request.env["decidim.current_organization"] = organization
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in user, scope: :user
      get :show

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "imports the csv data" do
      sign_in user

      # Don't know why don't prepend with `spec/fixtures` automatically
      file = fixture_file_upload("spec/fixtures/files/data1.csv")
      post :create, params: { file: file }
      expect(response).to have_http_status(:redirect)

      expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 3
      expect(Decidim::FileAuthorizationHandler::CensusDatum.first.id_document).to eq encode_id_document("1111A")
      expect(Decidim::FileAuthorizationHandler::CensusDatum.last.id_document).to eq encode_id_document("3333C")
    end
  end

  describe "POST #delete_all" do
    it "clear all census data" do
      sign_in user

      FactoryBot.create_list :census_datum, 5, organization: organization
      delete :destroy
      expect(response).to have_http_status(:redirect)

      expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 0
    end
  end
end
