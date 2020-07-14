.PHONY: all
all: bundle_install_force xcodegen pods_force carthage_if_needed carthage_arrange_framework;

.PHONY: clean
clean: pods_cache_clear carthage_cache_clear carthage_derived_data_clear;

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

.PHONY: carthage
carthage:
	carthage bootstrap --platform iOS --cache-builds --no-use-binaries

# Install libraries via carthage if you have not installed yet
.PHONY: carthage_if_needed
carthage_if_needed:
	test `find ./Carthage/Build/ 2>/dev/null | wc -l` -ne 0 || carthage bootstrap --platform iOS --cache-builds --no-use-binaries

# Consider Static library (RxSwift, etc.)
.PHONY: carthage_arrange_framework
carthage_arrange_framework:
	mv ./Carthage/Build/iOS/Static/* ./Carthage/Build/iOS
	rm -rf ./Carthage/Build/iOS/Static

.PHONY: carthage_cache_clear
carthage_cache_clear:
	rm -rf ./Carthage

.PHONY: carthage_derived_data_clear
carthage_derived_data_clear:
	rm -rf ${HOME}/Library/Caches/org.carthage.CarthageKit/DerivedData/*

.PHONY: carthage_version_clear
carthage_version_clear:
	rm Cartfile.resolved