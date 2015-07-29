#import "UIDevice+PowerPack.h"

@implementation UIDevice (PowerPack)

- (bool)isIPad {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

- (bool)isIPhone {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

- (bool)isIPhone4OrLess {
    return self.isIPhone && UIScreen.maxLength < 568.0;
}

- (bool)isIPhone5 {
    return self.isIPhone && UIScreen.maxLength == 568.0;
}

- (bool)isIPhone6 {
    return self.isIPhone && UIScreen.maxLength == 667.0;
}

- (bool)isIPhone6Plus {
    return self.isIPhone && UIScreen.maxLength == 736.0;
}

- (bool)isIOS7 {
    NSString *version = self.systemVersion;
    return [version hasPrefix:@"7."];
}

- (bool)isIOS7OrAbove {
    NSString *version = self.systemVersion;
    CGFloat versionF = version.floatValue;
    return versionF >= 7.0;
}

- (bool)isIOS8 {
    NSString *version = self.systemVersion;
    return [version hasPrefix:@"8."];
}

- (bool)isIOS8OrAbove {
    NSString *version = self.systemVersion;
    CGFloat versionF = version.floatValue;
    return versionF >= 8.0;
}

- (UIInterfaceOrientation)interfaceOrientation {
    NSDictionary *orientations = @{
        @(UIDeviceOrientationUnknown): @(UIInterfaceOrientationPortrait),
        @(UIDeviceOrientationPortrait): @(UIInterfaceOrientationPortrait),
        @(UIDeviceOrientationPortraitUpsideDown): @(UIInterfaceOrientationPortraitUpsideDown),
        @(UIDeviceOrientationLandscapeLeft): @(UIInterfaceOrientationLandscapeLeft),
        @(UIDeviceOrientationLandscapeRight): @(UIInterfaceOrientationLandscapeRight),
        @(UIDeviceOrientationFaceUp): @(UIInterfaceOrientationPortrait),
        @(UIDeviceOrientationFaceDown): @(UIInterfaceOrientationPortraitUpsideDown)
    };
    NSNumber *interfaceOrientationN = orientations[@(self.orientation)];
    UIInterfaceOrientation interfaceOrientation = interfaceOrientationN.integerValue;
    return interfaceOrientation;
}

- (NSString *)connectedWifiSSID {
    NSString *ssid = nil;
    NSArray *interfaceNames = CFBridgingRelease(CNCopySupportedInterfaces());
    for(NSString *interfaceName in interfaceNames) {
        NSDictionary *info = CFBridgingRelease(CNCopyCurrentNetworkInfo((__bridge CFStringRef)interfaceName));
        if(info.count == 0) { continue; }
        ssid = info[@"SSID"];
        break;
    }
    return ssid;
}

- (BOOL)isInternetAvailable {
    Reachability *internetReach = Reachability.reachabilityForInternetConnection;
    NetworkStatus internetStatus = internetReach.currentReachabilityStatus;
    return internetStatus != NotReachable;
}

- (BOOL)isWifiInternetAvailable {
    Reachability *internetReach = Reachability.reachabilityForInternetConnection;
    NetworkStatus internetStatus = internetReach.currentReachabilityStatus;
    return internetStatus == ReachableViaWiFi;
}

@end
