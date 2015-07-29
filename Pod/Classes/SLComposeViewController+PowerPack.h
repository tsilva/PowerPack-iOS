#import <Social/Social.h>

#import "UIAlertView+PowerPack.h"
#import "UIApplication+PowerPack.h"

@interface SLComposeViewController(PowerPack)

+ (void)postFacebookMessage:(NSString *)message;
+ (void)postFacebookMessage:(NSString *)message url:(NSString *)url image:(UIImage *)image;
+ (void)postTwitterMessage:(NSString *)message;
+ (void)postTwitterMessage:(NSString *)message url:(NSString *)url image:(UIImage *)image;

@end
