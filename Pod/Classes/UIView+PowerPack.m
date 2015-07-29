#import "UIView+PowerPack.h"

@implementation UIView(PowerPack)

- (CGFloat)top {
    return self.y;
}

- (CGFloat)bottom {
    return self.y + self.height;
}

- (CGFloat)left {
    return self.x;
}

- (CGFloat)right {
    return self.x + self.width;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)subviewsMinX {
    NSInteger minX = INT_MAX;
    for(UIView *subview in self.subviews) {
        if(subview.hidden || subview.alpha == 0.0) continue;
        if(subview.left < minX) minX = subview.left;
    }
    return minX;
}

- (CGFloat)subviewsMaxX {
    NSInteger maxX = INT_MIN;
    for(UIView *subview in self.subviews) {
        if(subview.hidden || subview.alpha == 0.0) continue;
        if(subview.right > maxX) maxX = subview.right;
    }
    return maxX;
}

- (CGFloat)subviewsMinY {
    NSInteger minY = INT_MAX;
    for(UIView *subview in self.subviews) {
        if(subview.hidden || subview.alpha == 0.0) continue;
        if(subview.top < minY) minY = subview.top;
    }
    return minY;
}

- (CGFloat)subviewsMaxY {
    NSInteger maxY = INT_MIN;
    for(UIView *subview in self.subviews) {
        if(subview.hidden || subview.alpha == 0.0) continue;
        if(subview.bottom > maxY) maxY = subview.bottom;
    }
    return maxY;
}

- (void)fitToContents {
    self.width = self.subviewsMaxX;
    self.height = self.subviewsMaxY;
}

- (void)triggerNextResponder {
    UIView *view = nil;
    NSInteger tag = self.tag + 1;
    while(view == nil && tag < self.superview.subviews.count) {
        view = [self.superview viewWithTag:tag];
        if(view == nil || view.hidden || view.alpha == 0) view = nil;
        tag += 1;
    } 
    if(view) { [view becomeFirstResponder]; }
    else { [self resignFirstResponder]; }
}

- (void)fadeIn {
    [self fadeInToAlpha:1.0];
}

- (void)fadeInToAlpha:(CGFloat)alpha {
    self.alpha = 0.0;
    self.hidden = NO;
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = alpha;
    }];
}

- (void)fadeOut {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

- (void)loadFrame {
    if(self.savedFrame == nil) { return; }
    self.frame = self.savedFrame.CGRectValue;
}

- (void)saveFrame {
    self.savedFrame = [NSValue valueWithCGRect:self.frame];
}

#pragma mark - properties

- (NSValue *)savedFrame {
    return objc_getAssociatedObject(self, @"_savedFrame");
}

- (void)setSavedFrame:(NSValue *)savedFrame {
    objc_setAssociatedObject(self, @"_savedFrame", savedFrame, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
