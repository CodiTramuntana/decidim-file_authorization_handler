# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "decidim/file_authorization_handler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "decidim-file_authorization_handler"
  s.version = Decidim::FileAuthorizationHandler::VERSION
  s.authors = ["Daniel Gómez", "Xavier Redó", "Oliver Valls"]
  s.email = ["hola@marsbased.com"]
  s.summary = "CSV document + birth date verifier"
  s.description = "Census uploads via csv files"
  s.homepage = "https://github.com/marsbased/"
  s.license = "AGPLv3"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  # rubocop: disable Gemspec/RequiredRubyVersion
  s.required_ruby_version = "> 3.0"
  # rubocop: enable Gemspec/RequiredRubyVersion

  # rubocop: disable Lint/ConstantDefinitionInBlock
  DECIDIM_VERSION = "~> #{Decidim::FileAuthorizationHandler::DECIDIM_VERSION}".freeze
  # rubocop: enable Lint/ConstantDefinitionInBlock

  s.add_dependency "decidim", DECIDIM_VERSION
  s.add_dependency "decidim-admin", DECIDIM_VERSION
  s.add_dependency "rails", ">= 5.2"

  s.add_development_dependency "decidim-dev", DECIDIM_VERSION
  s.metadata["rubygems_mfa_required"] = "true"
end
