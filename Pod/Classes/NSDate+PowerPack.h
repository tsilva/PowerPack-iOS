#import "NSCalendar+PowerPack.h"
#import "UIApplication+PowerPack.h"
#import "NSDateFormatter+PowerPack.h"

@interface NSDate(PowerPack)

+ (NSInteger)hoursInDay;
+ (NSInteger)minutesInDay;
+ (NSInteger)secondsInDay;
- (NSString *)fullDateTimeString;
- (NSString *)longDateTimeString;
- (NSString *)mediumDateTimeString;
- (NSString *)shortDateTimeString;
- (NSString *)fullDateString;
- (NSString *)longDateString;
- (NSString *)mediumDateString;
- (NSString *)shortDateString;
- (NSString *)fullTimeString;
- (NSString *)longTimeString;
- (NSString *)mediumTimeString;
- (NSString *)shortTimeString;
- (NSString *)fullBirthDateString;
- (NSString *)longBirthDateString;
- (NSString *)mediumBirthDateString;
- (NSString *)shortBirthDateString;
- (NSDate *)birthDate;
- (BOOL)isToday;
- (NSDate *)startOfDay;
- (NSDate *)startOfPreviousDay;
- (NSDate *)endOfDay;
- (NSDate *)dateWithoutTime;
- (BOOL)isBeforeDate:(NSDate *)date;
- (BOOL)isAfterDate:(NSDate *)date;
- (BOOL)isSameDayAsDate:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone;
- (BOOL)isPast;
- (BOOL)isFuture;
- (NSDate *)dateByAddingDay;

@end
