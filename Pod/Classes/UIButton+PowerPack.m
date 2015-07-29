#import "UIButton+PowerPack.h"

@implementation UIButton(PowerPack)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    UIImage *image = [UIImage imageWithColor:backgroundColor];
    [self setBackgroundImage:image forState:state];
}

- (void)setBackgroundImageFromParseFile:(PFFile *)parseFile forState:(UIControlState)state {
    [parseFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (error){
            // should we feedback the user?
            NSLog(@"Error loading imagefile :%@", error);
            return ;
        }
        UIImage * image = [UIImage imageWithData:data];
        // get the main thread or else it may not show
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setBackgroundImage:image forState:state];
        });
    }];
}

@end
