#import <objc/runtime.h>

@interface UIView(PowerPack)

- (CGFloat)top;
- (CGFloat)bottom;
- (CGFloat)left;
- (CGFloat)right;
- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (CGFloat)subviewsMinX;
- (CGFloat)subviewsMaxX;
- (CGFloat)subviewsMinY;
- (CGFloat)subviewsMaxY;
- (void)fitToContents;
- (void)triggerNextResponder;
- (void)fadeIn;
- (void)fadeInToAlpha:(CGFloat)alpha;
- (void)fadeOut;

@end
