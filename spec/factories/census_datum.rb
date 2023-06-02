# frozen_string_literal: true

FactoryBot.define do
  factory :census_datum, class: "Decidim::FileAuthorizationHandler::CensusDatum" do
    id_document { "123456789A" }
    birthdate { 20.years.ago }
    organization
    extras { nil }

    trait :with_extras do
      extras { { district: "123456789", postal_code: "ABCDEFGHIJK", segment_1: Random.hex } }
    end
  end
end
