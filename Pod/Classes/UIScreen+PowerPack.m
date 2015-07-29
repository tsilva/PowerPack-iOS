#import "UIScreen+PowerPack.h"

@implementation UIScreen(PowerPack)

+ (CGFloat)width {
    return UIScreen.mainScreen.bounds.size.width;
}

+ (CGFloat)height {
    return UIScreen.mainScreen.bounds.size.height;
}

+ (CGFloat)maxLength {
    return MAX(UIScreen.width, UIScreen.height);
}

+ (CGFloat)minLength {
    return MIN(UIScreen.width, UIScreen.height);
}

@end
