#import <GPUImage/GPUImage.h>

#import "UIDevice+PowerPack.h"

@interface UIImage(PowerPack)

+ (UIImage *)deviceImageNamed:(NSString *)imageName;
+ (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)scaleToFillWithSize:(CGSize)size;
- (UIImage *)aspectFitWithWidth:(CGFloat)width;
- (UIImage *)blurredImage;

@end
