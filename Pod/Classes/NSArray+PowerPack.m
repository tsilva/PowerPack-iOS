#import "NSArray+PowerPack.h"

@implementation NSArray(PowerPack)

- (NSArray *)reverse {
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:self.count];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for(id element in enumerator) { [arrayM addObject:element]; }
    NSArray *array = [NSArray arrayWithArray:arrayM];
    return array;
}

- (NSArray *)orderedArrayUsingArray:(NSArray *)order {
    // adds the items from the list that represents the
    // order that exist in this list, to the ordered array
    NSMutableArray *orderedArrayM = [[NSMutableArray alloc] init];
    for(NSObject *object in order) {
        NSInteger index = [self indexOfObject:object];
        if(index == NSNotFound) { continue; }
        [orderedArrayM addObject:object];
    }
    
    // adds the items from this list that don't exist
    // in the ordered list to the ordered array (these
    // will therefore appear at the end of the ordered list)
    for(NSObject *object in self) {
        NSInteger index = [order indexOfObject:object];
        if(index != NSNotFound) { continue; }
        [orderedArrayM addObject:object];
    }
    NSArray *orderedArray = [NSArray arrayWithArray:orderedArrayM];
    return orderedArray;
}

@end
