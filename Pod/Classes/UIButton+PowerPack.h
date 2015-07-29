#import <Parse/Parse.h>

#import "UIImage+PowerPack.h"

@interface UIButton(PowerPack)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

- (void)setBackgroundImageFromParseFile:(PFFile *)parseFile forState:(UIControlState)state;
@end
