#import "UITextField+PowerPack.h"

@implementation UITextField (PowerPack)

- (void)addInputToolbar:(SEL)doneSelector {
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", nil) style:UIBarButtonItemStyleDone target:self action:doneSelector];
    doneButton.tintColor = self.toolbarTextColor;
    [doneButton setTitleTextAttributes:@{ NSFontAttributeName: self.toolbarTextFont } forState:UIControlStateNormal];
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 0.0, UIScreen.width, 50.0)];
    toolbar.barTintColor = self.toolbarBackgroundColor;
    toolbar.items = @[flexButton, doneButton];
    [toolbar sizeToFit];
    self.inputAccessoryView = toolbar;
}

- (void)addInputToolbar {
    [self addInputToolbar:@selector(resignFirstResponder)];
}

- (void)drawPlaceholderInRect:(CGRect)rect withColor:(UIColor *)color {
    // in case there is no placeholder
    // then returns (nothing to draw)
    if(self.placeholder == nil) { return; }

    // draws the text vertically aligned
    CGSize size = [self.placeholder sizeWithAttributes:@{ NSFontAttributeName: self.font }];
    rect.origin.y = (rect.size.height - size.height) / 2.0;
    NSDictionary *attributes = @{
        NSFontAttributeName: self.font,
        NSForegroundColorAttributeName: color
    };
    [self.placeholder drawInRect:rect withAttributes:attributes];
}

#pragma mark - properties

- (UIColor *)toolbarBackgroundColor {
    return objc_getAssociatedObject(self, @"_toolbarBackgroundColor");
}

- (void)setToolbarBackgroundColor:(UIColor *)toolbarBackgroundColor {
    objc_setAssociatedObject(self, @"_toolbarBackgroundColor", toolbarBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)toolbarTextFont {
    return objc_getAssociatedObject(self, @"_toolbarTextFont");
}

- (void)setToolbarTextFont:(UIFont *)toolbarTextFont {
    objc_setAssociatedObject(self, @"_toolbarTextFont", toolbarTextFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)toolbarTextColor {
    return objc_getAssociatedObject(self, @"_toolbarTextColor");
}

- (void)setToolbarTextColor:(UIColor *)toolbarTextColor {
    objc_setAssociatedObject(self, @"_toolbarTextColor", toolbarTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
