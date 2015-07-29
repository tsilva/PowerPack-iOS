#import "UIApplication+PowerPack.h"

@implementation UIApplication(PowerPack)

- (NSLocale *)currentLocale {
    NSBundle *bundle = NSBundle.mainBundle;
    NSString *localization = bundle.preferredLocalizations.firstObject;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:localization];
    return locale;
}

- (UIViewController *)currentViewController {
    UIViewController *rootViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
    return [self topViewControllerForController:rootViewController];
}

- (UIViewController *)topViewControllerForController:(UIViewController *)rootViewController {
    if(rootViewController.presentedViewController == nil) {
        return rootViewController;
    }

    if([rootViewController.presentedViewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = navigationController.viewControllers.lastObject;
        return [self topViewControllerForController:lastViewController];
    }

    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewControllerForController:presentedViewController];
}

@end
