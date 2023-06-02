# CHANGELOG

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
