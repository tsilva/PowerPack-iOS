#import "UIScrollView+PowerPack.h"

@implementation UIScrollView(PowerPack)

- (void)fitToContents {
    self.contentSize = CGSizeMake(self.subviewsMaxX, self.subviewsMaxY);
}

- (NSInteger)currentPage {
    return round(fabs(self.contentOffset.x) / self.width);
}

- (NSInteger)numberOfPages {
    return round(self.contentSize.width / self.width);
}

- (void)addPages:(NSArray *)pageViews {
    for(UIView *pageView in pageViews) { [self addSubview:pageView]; }
    [self layoutPages];
}

- (void)layoutPages {
    for(NSUInteger index = 0; index < self.subviews.count; index++) {
        UIView *pageView = self.subviews[index];
        pageView.frame = self.bounds;
        pageView.x = index * self.width;
    }
    
    // grows the scroll view to fit the added pages
    [self fitToContents];
}

@end
