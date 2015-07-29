#import "UIApplication+PowerPack.h"

@interface NSDateFormatter(PowerPack)

+ (NSDateFormatter *)defaultDateFormatter;
+ (NSDateFormatter *)fullDateFormatter;
+ (NSDateFormatter *)longDateFormatter;
+ (NSDateFormatter *)mediumDateFormatter;
+ (NSDateFormatter *)shortDateFormatter;
+ (NSDateFormatter *)fullTimeFormatter;
+ (NSDateFormatter *)longTimeFormatter;
+ (NSDateFormatter *)mediumTimeFormatter;
+ (NSDateFormatter *)shortTimeFormatter;

@end
