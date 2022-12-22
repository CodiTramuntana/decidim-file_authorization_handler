# frozen_string_literal: true

require "spec_helper"

RSpec.describe Decidim::FileAuthorizationHandler::RemoveDuplicatesJob do
  let(:org_1) { create :organization }
  let(:org_2) { create :organization }

  it "remove duplicates in the database" do
    %w(AAA BBB AAA AAA).each do |doc|
      create(:census_datum, id_document: doc, organization: org_1)
      create(:census_datum, id_document: doc, organization: org_2)
    end
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 8
    described_class.new.perform org_1
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 6
    described_class.new.perform org_2
    expect(Decidim::FileAuthorizationHandler::CensusDatum.count).to be 4
  end
end
