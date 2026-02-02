# frozen_string_literal: true

module Decidim
  module FileAuthorizationHandler
    module EncodingHelper
      def encode_id_document(id_document)
        Digest::SHA256.hexdigest("#{id_document}-#{Rails.application.secret_key_base}")
      end
    end
  end
end
