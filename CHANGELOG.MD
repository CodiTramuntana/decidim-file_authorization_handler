# CHANGELOG

## v0.30.1
- Upgrade to Decidim 0.30.1
- Set Ruby version to 3.3.4

## v0.29.2
 - Upgrade to Decidim 0.29.2
 - Set Ruby version to 3.2.6

## v0.28.2.0
 - Upgrade to Decidim 0.28

## v0.27.1.7
 - FIX: Fix previous version. Accept :document_number as decidim-initiatives sends it, but don't declare it as a argument as it duplicates the verification input for the document.

## v0.27.1.6
 - FIX: Add a hack in `file_authorization_handler` order to sign initiatives because in decidim-initiatives/app/forms/decidim/initiatives/vote_form.rb send to handler_for a param named document_number.

## v0.27.1.5
 - FIX: When organization is nil, unique_id causes an exception.

## v0.27.1.4
 - FIX: add compatibilty cross older Ruby versions by adding the hash value in the parameter.

## v0.27.1.3
 - FIX: ignore CensusDatum#extras if not set.

## v0.27.1.2
 - Add missing translations about first login.

## v0.27.1.1
 - Add organization id to generate unique_id because there are conflicts when there is a multitenant.
 ❗ Be careful, this change will make all verifications in production no longer valid because the `unique_id` will be generated differently ❗

## v0.27.1.0
 - Upgrade to use Ruby 3.1.3, but be compatible with > 3.0
 - Upgrade to Decidim v0.27.1

## v0.26.2.5
 - FEATURE: Allow extra random columns in CSV and persist them in an `extras` column of type `jsonb` but as an array.
 - Upgrade to use Ruby 2.7.7, but be still compatible with 2.7.5

## v0.26.2.4
 - Fix frozen string literal error with handler name.

## v0.26.2.3
 - Upgrade to Decidim 0.26.2

## v0.25.2.2
- Make test succeed
- Update Gemfile.lock with current module version
- Add .byebug_history to .gitignore
- Add and apply Rubocop
- Introduce CI

## 0.25.2
- Upgrade to Decidim 0.25.2
- Set Ruby version to 2.7.5
- Add CHANGELOG
