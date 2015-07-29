#import "SLComposeViewController+PowerPack.h"

@implementation SLComposeViewController(PowerPack)

+ (void)postFacebookMessage:(NSString *)message {
    [SLComposeViewController postFacebookMessage:message url:nil image:nil];
}

+ (void)postFacebookMessage:(NSString *)message url:(NSString *)url image:(UIImage *)image {
    // in case facebook sharing is not available
    // then informs the user and returns
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook] == NO) {
        NSString *title = NSLocalizedString(@"No Facebook Account", nil);
        NSString *message = NSLocalizedString(@"You don't have a Facebook account configured. Please configure your account in the phone settings.", nil);
        [UIAlertView showMessage:message withTitle:title];
        return;
    }
    
    // posts the message on facebook
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    controller.initialText = message;
    if(url) { [controller addURL:[NSURL URLWithString:url]]; }
    if(image) { [controller addImage:image]; }
    [controller setCompletionHandler:^(SLComposeViewControllerResult result) {
        // in case the posting wasn't
        // successful then returns
        if(result != SLComposeViewControllerResultDone) return;
        
        // informs the user that the
        // message was posted successfully
        NSString *title = NSLocalizedString(@"Shared successfully", nil);
        NSString *message = NSLocalizedString(@"Your message was posted on Facebook successfully.", nil);
        [UIAlertView showMessage:message withTitle:title];
    }];
    UIViewController *presentingController = UIApplication.sharedApplication.currentViewController;
    [presentingController presentViewController:controller animated:YES completion:nil];
}

+ (void)postTwitterMessage:(NSString *)message {
    [SLComposeViewController postTwitterMessage:message url:nil image:nil];
}

+ (void)postTwitterMessage:(NSString *)message url:(NSString *)url image:(UIImage *)image {
    // in case facebook sharing is not available
    // then informs the user and returns
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter] == NO) {
        NSString *title = NSLocalizedString(@"No Twitter Account", nil);
        NSString *message = NSLocalizedString(@"You don't have a Twitter account configured. Please configure your account in the phone settings.", nil);
        [UIAlertView showMessage:message withTitle:title];
        return;
    }
    
    // posts the message on facebook
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    controller.initialText = message;
    if(url) { [controller addURL:[NSURL URLWithString:url]]; }
    if(image) { [controller addImage:image]; }
    [controller setCompletionHandler:^(SLComposeViewControllerResult result) {
        // in case the posting wasn't
        // successful then returns
        if(result != SLComposeViewControllerResultDone) return;
        
        // informs the user that the
        // message was posted successfully
        NSString *title = NSLocalizedString(@"Shared successfully", nil);
        NSString *message = NSLocalizedString(@"Your message was posted on Twitter successfully.", nil);
        [UIAlertView showMessage:message withTitle:title];
    }];
    UIViewController *presentingController = UIApplication.sharedApplication.currentViewController;
    [presentingController presentViewController:controller animated:YES completion:nil];
}

@end
