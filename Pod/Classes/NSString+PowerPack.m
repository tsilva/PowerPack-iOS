#import "NSString+PowerPack.h"

@implementation NSString(PowerPack)

- (bool)isEmail {
    NSString *regex = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    bool matches = [predicate evaluateWithObject:self];
    return matches;
}

- (NSArray *)groupsWithLength:(NSInteger)length {
    NSMutableArray *chunks = [[NSMutableArray alloc] init];
    for(NSInteger index = 0; index <= self.length - length; index += length) {
        NSString *chunk = [self substringWithRange:NSMakeRange(index, length)];
        [chunks addObject:chunk];
    }
    return chunks;
}

- (unsigned int)unsignedIntFromHex {
    unsigned int result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexInt:&result];
    return result;
}

- (NSString *)reverseHexByteOrder {
    NSArray *groups = [self groupsWithLength:2];
    groups = [groups reverse];
    return [groups componentsJoinedByString:@""];
}

- (NSArray *)arrayFromHex {
    NSArray *groups = [self groupsWithLength:2];
    return groups;
}

- (NSString *)byteAtIndex:(NSUInteger)index {
    return self.arrayFromHex[index];
}

@end
