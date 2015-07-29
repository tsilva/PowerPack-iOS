#import "UIView+PowerPack.h"

@interface UIScrollView(PowerPack)

- (void)fitToContents;
- (NSInteger)currentPage;
- (NSInteger)numberOfPages;
- (void)addPages:(NSArray *)pageViews;
- (void)layoutPages;

@end
