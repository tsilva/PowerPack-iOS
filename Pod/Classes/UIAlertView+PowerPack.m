#import "UIAlertView+PowerPack.h"

@implementation UIAlertView(PowerPack)

+ (UIAlertView *)showError:(NSError *)error {
    NSString *message = error.userInfo[@"error"];
    message = message ? message : error.localizedDescription;
    UIAlertView *alertView = [self showErrorMessage:message];
    return alertView;
}

+ (UIAlertView *)showParseError:(NSError *)error {
    NSString *message = error.userInfo[@"error"];
    message = message ? message : error.localizedDescription;
    if([message isEqualToString:@"invalid login parameters"]) message = NSLocalizedString(@"Invalid email and password combination.", nil);
    else if(error.code == kPFErrorUserWithEmailNotFound) message = NSLocalizedString(@"Email not found.", nil);
    else if(error.code == kPFErrorUsernameTaken) message = NSLocalizedString(@"Username is already taken.", nil);
    else if(error.code == kPFErrorUserEmailTaken) message = NSLocalizedString(@"Email is already taken.", nil);
    UIAlertView *alertView = [self showErrorMessage:message];
    return alertView;
}

+ (UIAlertView *)showErrorMessage:(NSString *)message {
    if(UIDevice.currentDevice.isInternetAvailable == NO) { return [self showInternetUnavailable]; }
    UIAlertView *alertView = [self showMessage:message withTitle:NSLocalizedString(@"Error", nil)];
    return alertView;
}

+ (UIAlertView *)showMessage:(NSString *)message withTitle:(NSString *)title {
    title = NSLocalizedString(title, nil);
    message = NSLocalizedString(message, nil);
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:title
        message:message
        delegate:nil
        cancelButtonTitle:NSLocalizedString(@"OK", nil)
        otherButtonTitles:nil
    ];
    [alertView show];
    return alertView;
}

+ (UIAlertView *)showNotImplemented {
    NSString *title = NSLocalizedString(@"Not Implemented", nil);
    NSString *message = NSLocalizedString(@"This action is not implemented yet.", nil);
    UIAlertView *alertView = [UIAlertView showMessage:message withTitle:title];
    return alertView;
}

+ (UIAlertView *)showInternetUnavailable {
    NSString *title = NSLocalizedString(@"Connection lost", nil);
    NSString *message = NSLocalizedString(@"The request failed because your Internet connection is down. Please confirm you have an active data connection that is able to reach the Internet.", nil);
    UIAlertView *alertView = [self showMessage:message withTitle:title];
    return alertView;
}

@end
