#import <objc/runtime.h>

#import "UIDevice+PowerPack.h"

@interface UIViewController(PowerPack)

- (void)showMaskInWindow;
- (void)showMaskInWindowAfterDelay:(NSTimeInterval)delay;
- (void)showMaskInView;
- (void)showMaskInViewAfterDelay:(NSTimeInterval)delay;
- (void)hideMask;
- (void)blockUserInteraction;
- (void)unblockUserInteraction;

@end
