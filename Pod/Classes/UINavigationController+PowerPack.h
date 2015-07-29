@interface UINavigationController(PowerPack)

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                completion:(void (^)(void))completion;

- (void)popViewControllerAnimated:(BOOL)animated
                       completion:(void (^)(void))completion;

@end
