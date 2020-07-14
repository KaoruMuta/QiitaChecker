.PHONY: all
all: xcodegen carthage_if_needed;

.PHONY: clean
clean: carthage_cache_clear carthage_derived_data_clear;

.PHONY: xcodegen
xcodegen:
	mint run yonaskolb/xcodegen@2.10.0

.PHONY: carthage
carthage:
	carthage bootstrap --platform iOS --cache-builds --no-use-binaries

# Install libraries via carthage if you have not installed yet
.PHONY: carthage_if_needed
carthage_if_needed:
	test `find ./Carthage/Build/ 2>/dev/null | wc -l` -ne 0 || carthage bootstrap --platform iOS --cache-builds --no-use-binaries

.PHONY: carthage_cache_clear
carthage_cache_clear:
	rm -rf ./Carthage

.PHONY: carthage_derived_data_clear
carthage_derived_data_clear:
	rm -rf ${HOME}/Library/Caches/org.carthage.CarthageKit/DerivedData/*

.PHONY: carthage_version_clear
carthage_version_clear:
	rm Cartfile.resolved