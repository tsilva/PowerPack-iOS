#import "UITableViewCell+PowerPack.h"

@implementation UITableViewCell(PowerPack)

- (void)removeSeparatorInset {
    // removes separator inset
    if([self respondsToSelector:@selector(setSeparatorInset:)]) self.separatorInset = UIEdgeInsetsZero;
  
    // prevents the cell from inheriting the table view's margin settings
    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) self.preservesSuperviewLayoutMargins = NO;
    
    // explictly sets the cell's layout margins
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) self.layoutMargins = UIEdgeInsetsZero;
}

@end
