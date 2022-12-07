# frozen_string_literal: true

require "spec_helper"

RSpec.describe Decidim::FileAuthorizationHandler::CsvData do
  let(:file) { file_fixture("data1.csv") }
  let(:data) { described_class.new(file) }

  it "loads from files" do
    expect(data.values.length).to be 3
    expect(data.values[0]).to eq [encode_id_document("1111A"), Date.strptime("1981/01/01", "%Y/%m/%d")]
    expect(data.values[1]).to eq [encode_id_document("2222B"), Date.strptime("1982/02/02", "%Y/%m/%d")]
    expect(data.values[2]).to eq [encode_id_document("3333C"), Date.strptime("2017/01/01", "%Y/%m/%d")]
  end

  it "returns the zero errored rows when all are good" do
    expect(data.errors.count).to be 0
  end

  context "when file has errors" do
    let(:file) { file_fixture("with-errors.csv") }

    it "returns the number of errored rows" do
      expect(data.errors.count).to be 3
    end
  end

  context "with extra columns" do
    let(:file) { file_fixture("data-with_extras.csv") }

    it "parses all columns from file" do
      expect(data.values.length).to be 4
      expect(data.headers).to eq ["DNI", "Data de naixement", "district"]
      expect(data.errors.count).to be 0
      expect(data.values[0]).to eq [encode_id_document("1111A"), Date.strptime("1981/01/01", "%Y/%m/%d"), "17600"]
      expect(data.values[1]).to eq [encode_id_document("2222B"), Date.strptime("1982/02/02", "%Y/%m/%d"), "17481"]
      expect(data.values[2]).to eq [encode_id_document("3333C"), Date.strptime("2000/01/01", "%Y/%m/%d"), "17820"]
      expect(data.values[3]).to eq [encode_id_document("4444D"), Date.strptime("2017/01/01", "%Y/%m/%d"), "17003"]
    end
  end
end
