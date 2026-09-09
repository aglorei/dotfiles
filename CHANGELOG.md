# Changelog

## [1.2.0](https://github.com/aglorei/aglorei-dotfiles/compare/v1.1.0...v1.2.0) (2026-09-09)


### Features

* Add terraform-docs and pre-commit ([#98](https://github.com/aglorei/aglorei-dotfiles/issues/98)) ([b26e028](https://github.com/aglorei/aglorei-dotfiles/commit/b26e0287616e28c88684ae79a90d21a37bdf0b6f))

## [1.1.0](https://github.com/aglorei/dotfiles/compare/v1.0.1...v1.1.0) (2026-06-09)


### Features

* Add ~/.local/bin to session PATH ([#61](https://github.com/aglorei/dotfiles/issues/61)) ([a4fa78e](https://github.com/aglorei/dotfiles/commit/a4fa78e652577e2d4e59854c495201bb44ba5946))
* Add GitHub Copilot CLI ([#94](https://github.com/aglorei/dotfiles/issues/94)) ([5f29c3f](https://github.com/aglorei/dotfiles/commit/5f29c3f5ba3281bbad49b22a209caac7f90b8588))


### Bug Fixes

* **ci:** Fix Renovate nix managerFilePatterns regex and remove debug logging ([#90](https://github.com/aglorei/dotfiles/issues/90)) ([630e6b9](https://github.com/aglorei/dotfiles/commit/630e6b9e7da21b3a637a18ae1b68b8032986bc90))
* **ci:** Switch managerFilePatterns to /flake\.nix$/ regex ([#91](https://github.com/aglorei/dotfiles/issues/91)) ([be2deea](https://github.com/aglorei/dotfiles/commit/be2deeafaeff5f8bd7a05537433548db3f21db17))
* Configure Renovate to detect and update flake.lock ([#84](https://github.com/aglorei/dotfiles/issues/84)) ([e61bd9f](https://github.com/aglorei/dotfiles/commit/e61bd9f5d80a2aee962afaaa8d6e305e37911b80))
* Correct Renovate full image tag from latest-full to full ([#85](https://github.com/aglorei/dotfiles/issues/85)) ([9998e78](https://github.com/aglorei/dotfiles/commit/9998e7847c2036acf7ce7a9fa3e8f3fda3c95384))
* Correct renovatebot/github-action version to v46 ([c2e49d2](https://github.com/aglorei/dotfiles/commit/c2e49d2055f8aaf98fda8a0b48efadfaba551fef))
* Enable lockFileMaintenance to update flake.lock via nix flake update ([#86](https://github.com/aglorei/dotfiles/issues/86)) ([845d161](https://github.com/aglorei/dotfiles/commit/845d161278fc640443f113251c10bd76e396a824))
* Grant pull-requests write permission to claude-code-review workflow ([#39](https://github.com/aglorei/dotfiles/issues/39)) ([7b59653](https://github.com/aglorei/dotfiles/commit/7b596530ec985b3b4a640a9e6dc2b5b13136a6c7))
* Migrate deprecated home-manager options and resolve starship double-management ([#65](https://github.com/aglorei/dotfiles/issues/65)) ([a810eb4](https://github.com/aglorei/dotfiles/commit/a810eb4ab7aefdf1ece99e766c4049b49b9cd2ae))
* Migrate fileMatch to managerFilePatterns and remove schedule restriction ([#88](https://github.com/aglorei/dotfiles/issues/88)) ([3f66db9](https://github.com/aglorei/dotfiles/commit/3f66db95f19700237df4ad8a94c47ca3810e90be))
* Move home.homeDirectory to host config for tienlong.pham ([79706e2](https://github.com/aglorei/dotfiles/commit/79706e2492bf81f8fdfa98845686bb9ca56782a5))
* Replace short GPG key ID and remove global SSH host checking bypass ([#62](https://github.com/aglorei/dotfiles/issues/62)) ([f93b16c](https://github.com/aglorei/dotfiles/commit/f93b16cf18714411c0ceb7be220ee988a0191dd0))
* Skip Claude Code Review for dependabot PRs ([#82](https://github.com/aglorei/dotfiles/issues/82)) ([af31cdb](https://github.com/aglorei/dotfiles/commit/af31cdbbff35476281923cb91e24dfd086101579))
* Use full semver tag for renovatebot/github-action ([a19c29d](https://github.com/aglorei/dotfiles/commit/a19c29dda5754e5e3a070f18ed0d9a26b7e3f78c))

## [1.0.1](https://github.com/aglorei/dotfiles/compare/v1.0.0...v1.0.1) (2026-06-02)


### Bug Fixes

* Remove unused binding ([#25](https://github.com/aglorei/dotfiles/issues/25)) ([0a82dad](https://github.com/aglorei/dotfiles/commit/0a82dad48f76a4a7b2c072b636efe7e7a89d5d5c))

## 1.0.0 (2025-07-28)


### Features

* Update Nix package channel to 25.05 ([#23](https://github.com/aglorei/dotfiles/issues/23)) ([fff254f](https://github.com/aglorei/dotfiles/commit/fff254f2cae7506aa9e12a2a04c4179155a0d7cc))


### Bug Fixes

* **25.05:** Rename services.gpg-agent.pinentryPackage to services.gpg-agent.pinentry.package ([fff254f](https://github.com/aglorei/dotfiles/commit/fff254f2cae7506aa9e12a2a04c4179155a0d7cc))
* **25.05:** Separate nerd font packages under the namespace nerd-fonts ([fff254f](https://github.com/aglorei/dotfiles/commit/fff254f2cae7506aa9e12a2a04c4179155a0d7cc))
