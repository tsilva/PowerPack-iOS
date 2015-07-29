#import "NSMutableArray+PowerPack.h"

@implementation NSMutableArray(PowerPack)

- (void)replaceWithObjectsFromArray:(NSArray *)array {
    [self removeAllObjects];
    [self addObjectsFromArray:array];
}

@end
