#import <objc/runtime.h>

#import "UIScreen+PowerPack.h"
#import "UIView+PowerPack.h"

@interface UITextField(PowerPack)

- (void)addInputToolbar;
- (void)addInputToolbar:(SEL)doneSelector;
- (void)drawPlaceholderInRect:(CGRect)rect withColor:(UIColor *)color;

- (UIColor *)toolbarBackgroundColor;
- (void)setToolbarBackgroundColor:(UIColor *)toolbarBackgroundColor;
- (UIFont *)toolbarTextFont;
- (void)setToolbarTextFont:(UIFont *)toolbarTextFont;
- (UIColor *)toolbarTextColor;
- (void)setToolbarTextColor:(UIColor *)toolbarTextColor;

@end
