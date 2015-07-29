#import "UIActionSheet+PowerPack.h"

@implementation UIActionSheet(PowerPack)

+ (void)showPickImagePromptInView:(UIView *)view delegate:(id)delegate {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:delegate
                                              cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:
                            NSLocalizedString(@"Take a Photo", nil),
                            NSLocalizedString(@"Choose a Photo", nil),
                            nil];
    [sheet showInView:view];
}

@end
