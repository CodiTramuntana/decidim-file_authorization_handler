# frozen_string_literal: true

require "csv"

module Decidim
  module FileAuthorizationHandler
    class CsvData
      @col_sep = ","
      class << self; attr_accessor :col_sep end

      attr_reader :errors, :values, :headers

      def initialize(file)
        @file = file
        @errors = []
        @values = []

        Rails.logger.info "CsvData.col_sep: #{CsvData.col_sep}"
        CSV.foreach(@file, headers: true, col_sep: CsvData.col_sep) do |row|
          @headers = row.headers
          process_row(row)
        end
      end

      private

      def process_row(row)
        id_document = CensusDatum.normalize_and_encode_id_document(row[0])
        date = CensusDatum.parse_date(row[1])

        if id_document.present? && !date.nil?
          data = [id_document, date] + row[2..]
          values << data
        else
          errors << row
        end
      end
    end
  end
end
