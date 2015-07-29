#import "NSData+PowerPack.h"

@implementation NSData(PowerPack)

- (NSString *)hexString {
    // in case the string is empty then returns
    const unsigned char *buffer = (const unsigned char *)self.bytes;
    if(!buffer) { return @""; }
    
    // creates the hexadecimal representation of the data and returns
    NSMutableString *hexStringM = [NSMutableString stringWithCapacity:self.length * 2];
    for(NSInteger index = 0; index < self.length; ++index) {
        NSString *hexC = [NSString stringWithFormat:@"%02lx", (unsigned long)buffer[index]];
        [hexStringM appendString:hexC];
    }
    NSString *hexString = [NSString stringWithString:hexStringM];
    return hexString;
}

@end
