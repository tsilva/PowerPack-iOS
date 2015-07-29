#import "UIView+PowerPack.h"

@interface UITableView(PowerPack)

- (UITableViewCell *)cellWithClass:(Class)_class;
- (CGFloat)contentHeight;
- (void)fitToContents;
- (UITableViewCell *)separatorCell;
- (bool)isSeparatorAtIndexPath:(NSIndexPath *)indexPath;

@end
