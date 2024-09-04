# frozen_string_literal: true

require "spec_helper"

RSpec.describe Decidim::FileAuthorizationHandler::RemoveDuplicatesJob do
  let(:organization_one) { create(:organization) }
  let(:organization_two) { create(:organization) }

  it "remove duplicates in the database" do
    %w(AAA BBB AAA AAA).each do |doc|
      create(:census_datum, id_document: doc, organization: organization_one)
      create(:census_datum, id_document: doc, organization: organization_two)
    end
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 8
    described_class.new.perform organization_one
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 6
    described_class.new.perform organization_two
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 4
  end
end
