#import "UIImage+PowerPack.h"

@implementation UIImage(PowerPack)

+ (UIImage *)deviceImageNamed:(NSString *)imageName {
    UIImage *image = nil;
    if(UIDevice.currentDevice.isIPhone6) { image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-iphone6", imageName]]; }
    else if(UIDevice.currentDevice.isIPhone5) { image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-iphone5", imageName]]; }
    else if(UIDevice.currentDevice.isIPhone4OrLess) { image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-iphone4", imageName]]; }
    if(image == nil) { image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-iphone6", imageName]]; }
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)scaleToFillWithSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)aspectFitWithWidth:(CGFloat)width {
    CGFloat oldWidth = self.size.width;
    CGFloat scaleFactor = width / oldWidth;
    CGFloat newHeight = self.size.height * scaleFactor;
    CGFloat newWidth = oldWidth * scaleFactor;
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [self drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)blurredImage {
    GPUImagePicture *sourceImage = [[GPUImagePicture alloc] initWithImage:self];
    GPUImageGaussianBlurFilter *filter = [[GPUImageGaussianBlurFilter alloc] init];
    filter.blurRadiusInPixels = 8.0;
    [sourceImage addTarget:filter];
    [filter useNextFrameForImageCapture];
    [sourceImage processImage];
    UIImage *blurredImage = [filter imageFromCurrentFramebuffer];
    return blurredImage;
}

@end
