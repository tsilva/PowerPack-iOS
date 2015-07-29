#import <Reachability/Reachability.h>
#import <SystemConfiguration/CaptiveNetwork.h>

#import "UIScreen+PowerPack.h"

@interface UIDevice(PowerPack)

- (bool)isIPad;
- (bool)isIPhone;
- (bool)isIPhone4OrLess;
- (bool)isIPhone5;
- (bool)isIPhone6;
- (bool)isIPhone6Plus;
- (bool)isIOS7;
- (bool)isIOS7OrAbove;
- (bool)isIOS8;
- (bool)isIOS8OrAbove;
- (NSString *)connectedWifiSSID;
- (UIInterfaceOrientation)interfaceOrientation;
- (BOOL)isInternetAvailable;
- (BOOL)isWifiInternetAvailable;

@end
