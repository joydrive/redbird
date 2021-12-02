# Changelog

The noteworthy changes for each Redbird version are included here. For a
complete changelog, see the git history for each version via the version links.

**To see the dates a version was published see the [hex package page].**

[hex package page]: https://hex.pm/packages/redbird

## [Unreleased]

[Unreleased]: https://github.com/joydrive/redbird/compare/v0.7.2...HEAD

## [0.7.2]

### Changed

- Update documentation to clarify that Redbird does not need to be included in the application list ([#54])
- Update redix from 1.0.0 to 1.1.5 ([#79], [#3])
- Update ex_doc from 0.23.0 to 0.26.0 and fix documentation errors ([#2])
- Update plug_crypto from 1.2.0 to 1.2.2 ([#7])
- Update plug from 1.1.3 to 1.12.1 ([#6])
- Update mock from 0.3.6 to 0.3.7 ([#5])

### Removed

- Remove `/doc`, add `/doc` to .gitignore ([0deb887])

[#2]: https://github.com/joydrive/redbird/pull/2
[#3]: https://github.com/joydrive/redbird/pull/3
[#5]: https://github.com/joydrive/redbird/pull/5
[#6]: https://github.com/joydrive/redbird/pull/6
[#7]: https://github.com/joydrive/redbird/pull/7
[#79]: https://github.com/thoughtbot/redbird/pull/79
[#54]: https://github.com/thoughtbot/redbird/pull/54
[0deb887]: https://github.com/joydrive/redbird/commit/0deb887
[0.7.2]: https://github.com/joydrive/redbird/compare/v0.7.1...v0.7.2

## [0.7.1]

### Fixes

- Avoid resetting the session key with each call to put/4 ([#72]).
  - For a description of issue and fix, see commit [5dc6bc48].
- Fix the broken session expiration test ([#73]).

[#72]: https://github.com/thoughtbot/redbird/pull/72
[#73]: https://github.com/thoughtbot/redbird/pull/73
[5dc6bc48]: https://github.com/thoughtbot/redbird/commit/5dc6bc486096ffbf896c6ced6b9941bfc4c43ea0
[0.7.1]: https://github.com/thoughtbot/redbird/compare/v0.7.0...v0.7.1

## [0.7.0]

### Breaking

- Adds secure keys ([#67]). See commit [299906f].

[#67]: https://github.com/thoughtbot/redbird/pull/67
[299906f]: https://github.com/thoughtbot/redbird/commit/299906f531fca956bca2e6eb507029f6a699c9e7
[0.7.0]: https://github.com/thoughtbot/redbird/compare/v0.6.0...v0.7.0
