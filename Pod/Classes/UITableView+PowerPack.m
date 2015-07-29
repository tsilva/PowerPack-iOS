#import "UITableView+PowerPack.h"

@implementation UITableView(PowerPack)

- (UITableViewCell *)cellWithClass:(Class)_class {
    // attempts to retrieve a previously
    // created instance of this cell
    NSString *cellId = NSStringFromClass(_class);
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:cellId];

    // in case no previous instance of the
    // cell was found then creates a new one
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:cellId bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:cellId];
        cell = [self dequeueReusableCellWithIdentifier:cellId];
    }
    return cell;
}

- (CGFloat)contentHeight {
    CGFloat contentHeight = 0.0;
    for(NSInteger section = 0; section < self.numberOfSections; section++) {
        NSInteger numberRows = [self numberOfRowsInSection:section];
        for(NSInteger row = 0; row < numberRows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            CGFloat height = [self.delegate tableView:self heightForRowAtIndexPath:indexPath];
            contentHeight += height;
        }
    }
    return contentHeight;
}

- (void)fitToContents {
    self.contentSize = CGSizeMake(self.width, self.contentHeight);
    self.height = self.contentSize.height;
}

- (UITableViewCell *)separatorCell {
    UITableViewCell *cell = nil;
    NSString *cellId = @"_SeparatorCell";
    cell = [self dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil) { cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId]; }
    cell.backgroundColor = UIColor.clearColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (bool)isSeparatorAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row % 2 != 0;
}

@end
