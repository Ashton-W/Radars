
[OpenRadar 🔗](https://openradar.appspot.com/radar?id=5604940256903168)

#### Product
Developer Tools

#### Classification
Serious Bug

#### Reproducibility
Always

#### Title
Xcode Automatic Provisioning resolves App Groups entitlement incorrectly

#### Description
Xcode Automatic Provisioning (or 'Automatically manage signing' as it it shown in the Xcode UI) will automatically configure App Group Assignment for the App ID in the Developer Portal. You can see the App IDs it manages in the Developer Portal (Certificates, Identifiers & Profiles; Identifiers; App IDs) prefixed with 'XC'. You can edit the App Groups to see the assignment on the Developer Portal.

When a Target uses different Bundle Identifiers for different Build Configurations, by changing the Build Setting PRODUCT_BUNDLE_IDENTIFIER, Xode will update the App IDs on the Developer Portal for each Build Configuration. Which Configurations are updated seems to depend on the active Scheme.

When a Target uses the App Groups entitlement Xcode will update the App ID's App Group Assignment on the Developer Portal.

If a Target uses different Bundle Identifiers and different App Groups for different Build Configurations, Xcode does not update the App Group Assignment correctly. One App Group will be set for all active Build Configurations. Building with a Scheme that uses different Build Configurations will change all App ID App Group Assignments again, but to the value appropriate for that Configuration.

This means, when using Automatic Provisioning for Targets with different Bundle Identifiers and App Group entitlements, Xcode will update/repair the App IDs, and thus the Provisioning Profiles, to all have one set of App Group Assignments.
Sometimes Xcode will not attempt to repair the App ID, and simply fail the build due to missing the correct entitlements.

#### Steps to reproduce

DEVELOPMENT_TEAM, PRODUCT_BUNDLE_IDENTIFIER, and the App Groups may need to be adjusted to your Development Team.

1. You can skip configuration steps if you open the project in the attached zip file.
2. Create an Xcode project with an iOS App target
3. Append the PRODUCT_BUNDLE_IDENTIFIER Build Setting with "-$(CONFIGURATION)", this will give different values for Debug and Release configurations. (AutomaticApp in the sample project)
4. Enable Automatic Provisioning and set your Development Team for the target.
5. Notice Xcode resolving the Provisioning Profiles correctly
6. Add the App Groups capability to the app target, this will create an entitlements file.
7. Edit the entitlements file to expand the CONFIGURATION build setting to have a different App Group per Configuration. For example use the string "group.net.Ashton-W.AppGroupTest-$(CONFIGURATION).AppGroup" in the entitlements file. (AutomaticAppWithExpandedAppGroup in the sample project)
8. Build the app for Debug, eg: Run in Simulator.
9. Then build the app for Release: eg: Archive for Generic iOS Device.
10. Notice the App Groups assigned to the App IDs in the Developer Portal (Go to 'Certificates, Identifiers & Profiles'. Then go to 'App IDs' under the 'Identifiers' group in the navigation menu. Select the App IDs matching the bundle IDs we are using in this project, then press the edit button. Press the Edit button next to the App Groups entitlement.)
11. Repeat Step 8 and 10, then Step 9 and 10.
12. Revert the changes in step #7
13. Make a copy of the entitlements file and change the CODE_SIGN_ENTITLEMENTS build setting to use the new file for the Release configuration.
14. Edit the entitlements files so the App Groups used are different, for example: "group.net.Ashton-W.AppGroupTest-Debug.AppGroup" in the original file and "group.net.Ashton-W.AppGroupTest-Release.AppGroup" in the new file. (AutomaticAppWithGroup in the sample project)
15. Build the app for Debug, eg: Run in Simulator.
16. Then build the app for Release: eg: Archive for Generic iOS Device.
17. Notice the App Groups assigned to the App IDs in the Developer Portal (...)
18. Repeat Step 15 and 17, then Step 16 and 17.

#### Expected Results
Xcode Automatic Provisioning uses the correct entitlements for the Debug build and the Release build.
The App IDs on the Developer Portal have the same App Group entitlements as configured as when Xcode builds.

#### Actual Results
Xcode Automatic Provisioning updates the Release build App ID with the App Groups entitlements from the Debug build.
The App IDs on the Developer Portal do not always have the same App Group entitlements as when Xcode builds.

#### Configuration
If you do not have Internet Access or Xcode does not try to update or repair the Provisioning Profiles, the build will fail with missing entitlements if it had previously set the App Groups incorrectly.

Manually assigning the App Groups on the Developer Portal and installing the Provisioning Profiles will work until Xcode updates or repairs the Provisioning Profiles, at which point the assignment will be incorrect for one or more App IDs.

#### Xcode Version/Build & OSX Version/Build
Xcode 8.2.1 (8C1002)

#### Additional Notes

The attached sample project contains three targets:

**AutomaticApp**   
App using Automatic Provisioning (aka 'Automatically manage provisioning' in Xcode)
This app uses different `PRODUCT_BUNDLE_IDENTIFIER` per Build Configuration.
This works well.

**AutomaticAppWithGroup**   
An App using Automatic Provisioning (aka 'Automatically manage provisioning' in Xcode)
and the App Groups entitlement.
Different `PRODUCT_BUNDLE_IDENTIFIER` per Build Configuration.
Different `CODE_SIGN_ENTITLEMENTS` per Build Configuration to change which `.entitlements` file used to build.
Xcode will use the entitlements to configure the App Groups for the iOS App ID (in the Developer Portal). However, it will incorrectly configure the App Groups for the current Configuration to the iOS App IDs of all other Configurations too.

This is not desired or expected.

**AutomaticAppWithExpandedAppGroup**   
An App using Automatic Provisioning (aka 'Automatically manage provisioning' in Xcode)
and the App Groups entitlement.
Different `PRODUCT_BUNDLE_IDENTIFIER` per Build Configuration.
Alternatively, using Build Setting expansion inside the `.entitlements` file will show that `$(CONFIGURATION)` does get expanded, but the entitlements from the wrong Configuration are used.


