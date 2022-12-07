# frozen_string_literal: true

class AddExtrasToCensusDatum < ActiveRecord::Migration[6.0]
  def change
    add_column :decidim_file_authorization_handler_census_data, :extras, :jsonb
  end
end
