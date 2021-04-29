.PHONY: all
all: bundle_install_force xcodegen pods_force resources;

.PHONY: clean
clean: pods_cache_clear;

.PHONY: xcodegen
xcodegen:
	mint run yonaskolb/xcodegen@2.10.0

.PHONY:

.PHONY: gem_install_bundler_if_needed
gem_install_bundler_if_needed:
	which bundler || rbenv exec gem install bundler

.PHONY: bundle_install
bundle_install: gem_install_bundler_if_needed
	rbenv exec bundle install --path vendor/bundle

.PHONY: bundle_install_if_needed
bundle_install_if_needed: gem_install_bundler_if_needed
	rbenv exec bundle check || rbenv exec bundle install --path vendor/bundle

.PHONY: bundle_cache_clear
bundle_cache_clear:
	rm -rf ./vendor/bundle/ruby

.PHONY: bundle_install_force
bundle_install_force: bundle_cache_clear bundle_install

.PHONY: pods
pods: bundle_install_if_needed
	rbenv exec bundle exec pod install

.PHONY: pods_with_repo_update
pods_with_repo_update: bundle_install_if_needed
	rbenv exec bundle exec pod install --repo-update

.PHONY: pods_force
pods_force: pods_cache_clear bundle_install pods_with_repo_update;

.PHONY: pods_cache_clear
pods_cache_clear:
	rm -rf ./Pods

.PHONY: resources
resources:
	./Pods/SwiftGen/bin/swiftgen

