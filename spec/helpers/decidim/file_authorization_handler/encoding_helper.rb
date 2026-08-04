# frozen_string_literal: true

module Decidim
  module FileAuthorizationHandler
    module EncodingHelper
      def encode_id_document(id_document)
        Digest::SHA256.hexdigest("#{id_document}-#{ENV.fetch("SECRET_KEY_BASE", nil)}")
      end
    end
  end
end
