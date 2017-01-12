# AutomaticAppWithExpandedAppGroup

An App using Automatic Provisioning (aka 'Automatically manage provisioning' in Xcode)
and the App Groups entitlement.
Different `PRODUCT_BUNDLE_IDENTIFIER` per Build Configuration.
Alternatively, using Build Setting expansion inside the `.entitlements` file will show that `$(CONFIGURATION)` does get expanded, but the entitlements from the wrong Configuration are used.
