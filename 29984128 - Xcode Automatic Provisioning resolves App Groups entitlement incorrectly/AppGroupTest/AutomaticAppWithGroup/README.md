# AutomaticAppWithGroup

An App using Automatic Provisioning (aka 'Automatically manage provisioning' in Xcode)
and the App Groups entitlement.
Different `PRODUCT_BUNDLE_IDENTIFIER` per Build Configuration.
Different `CODE_SIGN_ENTITLEMENTS` per Build Configuration to change which `.entitlements` file used to build.
Xcode will use the entitlements to configure the App Groups for the iOS App ID (in the Developer Portal). However, it will incorrectly configure the App Groups for the current Configuration to the iOS App IDs of all other Configurations too.

This is not desired or expected.
