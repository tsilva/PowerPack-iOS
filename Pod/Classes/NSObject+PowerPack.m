#import "NSObject+PowerPack.h"

@implementation NSObject(PowerPack)

- (NSString *)className {
    return NSStringFromClass(self.class);
}

@end
