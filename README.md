# Kiip iOS SDK

Supported platforms: iOS 4.x+ (Tested 4.3)

## Public interfaces

* KiipSDK.h
* Kiip.h
* KPPoptart.h
* KPNotification.h
* KPModal.h
* KPNotificationView.h

## Resources

* KiipSDKResources.bundle
    * kp_activity_indicator.png
    * kp_activity_indicator@2x.png
    * kp_notification_bg.png
    * kp_notification_bg@2x.png

## Required Libraries

* CoreTelephony.framework
* QuartzCore.framework
* SystemConfiguration.framework

## Optional Libraries

* CoreLocation.framework

## Instructions

* Drag KiipSDK.framework into your project.
* Drag KiipResources.bundle from KiipSDK.framework/Resources/ into your project.
* Add the required libraries to your project (CoreTelephony, QuartzCore, SystemConfiguration)
* Use `#import <KiipSDK/KiipSDK.h>`

### Location (Optional)

Kiip has the ability to automatically retrieve the user's location, but the application must first
request permission for location updates as well as include CoreLocation.framework.

To request permission, you must add the following code:

    CLLocationManager *lm = [[CLLocationManager alloc] init];
    [lm startUpdatingLocation];
    [lm stopUpdatingLocation];
