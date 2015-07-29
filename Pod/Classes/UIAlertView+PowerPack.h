#import <Parse/Parse.h>

#import "UIDevice+PowerPack.h"

@interface UIAlertView(PowerPack)

+ (UIAlertView *)showError:(NSError *)error;
+ (UIAlertView *)showParseError:(NSError *)error;
+ (UIAlertView *)showErrorMessage:(NSString *)message;
+ (UIAlertView *)showMessage:(NSString *)message withTitle:(NSString *)title;
+ (UIAlertView *)showNotImplemented;
+ (UIAlertView *)showInternetUnavailable;

@end
