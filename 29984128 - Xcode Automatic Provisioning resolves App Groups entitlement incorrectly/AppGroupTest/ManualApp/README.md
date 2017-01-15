# ManualApp

An App using Manual Provisioning and the App Groups entitlement.
Different `PRODUCT_BUNDLE_IDENTIFIER` per Build Configuration.
Alternatively, using Build Setting expansion inside the `.entitlements` file will show that `$(CONFIGURATION)` does get expanded, but the entitlements from the wrong Configuration are used.
`PROVISIONING_PROFILE_SPECIFIER` is used to select a provisioning profile by name per Configuration.
