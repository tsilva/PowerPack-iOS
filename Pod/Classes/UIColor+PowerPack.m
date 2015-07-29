#import "UIColor+PowerPack.h"

@implementation UIColor(PowerPack)

+ (UIColor *)colorWithHex:(NSInteger)hex {
    NSInteger red = (hex & 0xFF0000) >> 16;
    NSInteger green = (hex & 0xFF00) >> 8;
    NSInteger blue = (hex & 0xFF);
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    return color;
}

- (NSString *)hexString {
    CGFloat red, green, blue, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    NSInteger redI = (NSUInteger)(255.0 * red);
    NSInteger greenI = (NSUInteger)(255.0 * green);
    NSInteger blueI = (NSUInteger)(255.0 * blue);
    NSString *hexString = [NSString stringWithFormat:@"%02lx%02lx%02lx", (long)redI, (long)greenI, (long)blueI];
    return hexString;
}

@end
