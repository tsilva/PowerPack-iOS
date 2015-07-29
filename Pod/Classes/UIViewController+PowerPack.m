#import "UIViewController+PowerPack.h"

@implementation UIViewController(PowerPack)

- (void)showMaskInWindow {
    [self showMaskInWindowAfterDelay:0.25];
}

- (void)showMaskInWindowAfterDelay:(NSTimeInterval)delay {
    UIApplication *application = UIApplication.sharedApplication;
    UIView *window = application.windows.lastObject;
    [self showMaskInView:window afterDelay:delay];
}

- (void)showMaskInView {
    [self showMaskInView:self.view afterDelay:0.25];
}

- (void)showMaskInViewAfterDelay:(NSTimeInterval)delay {
    [self showMaskInView:self.view afterDelay:delay];
}

- (void)showMaskInView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    // in case a mask is already visible then returns
    if(self.maskView) { return; }
    
    // blocks the user interaction regardless of
    // whether the mask already appeared or not
    // (the delay is only there to pretend that the
    // interface was never blocked, but in fact it always is)
    [self blockUserInteractionForView:view];
    
    // creates the activity mask
    self.maskView = [[UIView alloc] init];
    self.maskView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    self.maskView.alpha = 0.0;
    self.maskView.backgroundColor = UIColor.whiteColor;
    self.maskView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.maskView.autoresizingMask |= UIViewAutoresizingFlexibleHeight;
    
    // creates the activity indicator
    self.maskIndicatorView = [[UIActivityIndicatorView alloc] init];
    self.maskIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.maskIndicatorView.alpha = 0.0;
    self.maskIndicatorView.center = view.center;
    self.maskIndicatorView.hidesWhenStopped = NO;
    self.maskIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.maskIndicatorView.autoresizingMask |= UIViewAutoresizingFlexibleBottomMargin;
    self.maskIndicatorView.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin;
    self.maskIndicatorView.autoresizingMask |= UIViewAutoresizingFlexibleRightMargin;
   
    // starts the animation of the activity indicator
    [self.maskIndicatorView startAnimating];
    
    // adds the mask and the activity indicator to the view
    [view addSubview:self.maskView];
    [view addSubview:self.maskIndicatorView];

    // shows the mask in 250 miliseconds in
    // case it wasn't stopped meanwhile
    if(delay > 0) { [self performSelector:@selector(_showMaskInView:) withObject:view afterDelay:delay]; }
    else { [self _showMaskInView:view]; }
}

- (void)_showMaskInView:(UIView *)view {
    // brings the mask to the front
    [view bringSubviewToFront:self.maskView];
    [view bringSubviewToFront:self.maskIndicatorView];
    
    // fades in the mask
    [UIView animateWithDuration:0.25 animations:^{
        self.maskView.alpha = 0.8;
        self.maskIndicatorView.alpha = 1.0;
    }];
}

- (void)hideMask {
    // in case the mask is being hidden
    // before it was ever shown (waiting
    // delay) then cancels the task
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(_showMaskInView:)
                                               object:self.maskView.superview];
    
    // fades out the mask
    [UIView animateWithDuration:0.25 animations:^{
        self.maskView.alpha = 0.0;
        self.maskIndicatorView.alpha = 0.0;
    } completion:^(BOOL finished) {
        // discards the mask
        [self.maskView removeFromSuperview];
        [self.maskIndicatorView removeFromSuperview];
        self.maskView = nil;
        self.maskIndicatorView = nil;
        
        // unblocks the user interaction
        [self unblockUserInteraction];
    }];
}

- (void)blockUserInteraction {
    UIApplication *application = UIApplication.sharedApplication;
    UIView *view = application.windows.lastObject;
    [self blockUserInteractionForView:view];
}

- (void)blockUserInteractionForView:(UIView *)view {
    // in case a block view already exists then returns
    if(self.blockView) { return; }

    // creates the view used to block user
    // interaction and adds it to the screen
    self.blockView = [[UIView alloc] init];
    self.blockView.userInteractionEnabled = YES;
    self.blockView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    self.blockView.backgroundColor = UIColor.clearColor;
    self.blockView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.blockView.autoresizingMask |= UIViewAutoresizingFlexibleHeight;
    [view addSubview:self.blockView];
}

- (void)unblockUserInteraction {
    [self.blockView removeFromSuperview];
}

#pragma mark - properties

- (NSNumber *)maskWaiting {
    return objc_getAssociatedObject(self, @"_maskWaiting");
}

- (void)setMaskWaiting:(NSNumber *)maskWaiting {
    objc_setAssociatedObject(self, @"_maskWaiting", maskWaiting, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)maskView {
    return objc_getAssociatedObject(self, @"_maskView");
}

- (void)setMaskView:(UIView *)maskView {
    objc_setAssociatedObject(self, @"_maskView", maskView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIActivityIndicatorView *)maskIndicatorView {
    return objc_getAssociatedObject(self, @"_maskIndicatorView");
}

- (void)setMaskIndicatorView:(UIView *)maskIndicatorView {
    objc_setAssociatedObject(self, @"_maskIndicatorView", maskIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)blockView {
    return objc_getAssociatedObject(self, @"_blockView");
}

- (void)setBlockView:(UIView *)maskView {
    objc_setAssociatedObject(self, @"_blockView", maskView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
