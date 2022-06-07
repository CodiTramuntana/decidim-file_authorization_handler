# frozen_string_literal: true

require "spec_helper"

RSpec.describe Decidim::FileAuthorizationHandler::RemoveDuplicatesJob do
  let(:org1) { FactoryBot.create :organization }
  let(:org2) { FactoryBot.create :organization }

  it "remove duplicates in the database" do
    %w(AAA BBB AAA AAA).each do |doc|
      FactoryBot.create(:census_datum, id_document: doc, organization: org1)
      FactoryBot.create(:census_datum, id_document: doc, organization: org2)
    end
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 8
    described_class.new.perform org1
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 6
    described_class.new.perform org2
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 4
  end
end
