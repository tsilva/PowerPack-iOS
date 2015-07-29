#import "NSArray+PowerPack.h"

@interface NSString(PowerPack)

- (bool)isEmail;
- (NSArray *)groupsWithLength:(NSInteger)length;
- (unsigned int )unsignedIntFromHex;
- (NSString *)reverseHexByteOrder;
- (NSArray *)arrayFromHex;
- (NSString *)byteAtIndex:(NSUInteger)index;

@end
