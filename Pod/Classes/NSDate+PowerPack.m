#import "NSDate+PowerPack.h"

@implementation NSDate(PowerPack)

+ (NSInteger)hoursInDay {
    return 24;
}

+ (NSInteger)minutesInDay {
    return NSDate.hoursInDay * 60;
}

+ (NSInteger)secondsInDay {
    return NSDate.minutesInDay * 60;
}

- (NSString *)fullDateTimeString {
    return [self dateStringWithStyle:NSDateFormatterFullStyle];
}

- (NSString *)longDateTimeString {
    return [self dateTimeStringWithStyle:NSDateFormatterLongStyle];
}

- (NSString *)mediumDateTimeString {
    return [self dateTimeStringWithStyle:NSDateFormatterMediumStyle];
}

- (NSString *)shortDateTimeString {
    return [self dateTimeStringWithStyle:NSDateFormatterShortStyle];
}

- (NSString *)dateTimeStringWithStyle:(NSDateFormatterStyle)style {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = style;
    formatter.timeStyle = style;
    NSString *dateS = [formatter stringFromDate:self];
    return dateS;
}

- (NSString *)fullDateString {
    return [self dateStringWithStyle:NSDateFormatterFullStyle];
}

- (NSString *)longDateString {
    return [self dateStringWithStyle:NSDateFormatterLongStyle];
}

- (NSString *)mediumDateString {
    return [self dateStringWithStyle:NSDateFormatterMediumStyle];
}

- (NSString *)shortDateString {
    return [self dateStringWithStyle:NSDateFormatterShortStyle];
}

- (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = style;
    formatter.timeStyle = NSDateFormatterNoStyle;
    NSString *dateS = [formatter stringFromDate:self];
    return dateS;
}

- (NSString *)fullTimeString {
    return [self timeStringWithStyle:NSDateFormatterFullStyle];
}

- (NSString *)longTimeString {
    return [self timeStringWithStyle:NSDateFormatterLongStyle];
}

- (NSString *)mediumTimeString {
    return [self timeStringWithStyle:NSDateFormatterMediumStyle];
}

- (NSString *)shortTimeString {
    return [self timeStringWithStyle:NSDateFormatterShortStyle];
}

- (NSString *)timeStringWithStyle:(NSDateFormatterStyle)style {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = style;
    NSString *dateS = [formatter stringFromDate:self];
    return dateS;
}

- (NSString *)fullBirthDateString {
    return [self birthDateStringWithStyle:NSDateFormatterFullStyle];
}

- (NSString *)longBirthDateString {
    return [self birthDateStringWithStyle:NSDateFormatterLongStyle];
}

- (NSString *)mediumBirthDateString {
    return [self birthDateStringWithStyle:NSDateFormatterMediumStyle];
}

- (NSString *)shortBirthDateString {
    return [self birthDateStringWithStyle:NSDateFormatterShortStyle];
}

- (NSString *)birthDateStringWithStyle:(NSDateFormatterStyle)style {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    formatter.dateStyle = style;
    formatter.timeStyle = NSDateFormatterNoStyle;
    NSDate *birthDate = self.dateWithoutTime;
    NSString *dateS = [formatter stringFromDate:birthDate];
    return dateS;
}

- (NSDate *)birthDate {
    return self.dateWithoutTime;
}

- (BOOL)isToday {
    return [self isTodayInTimeZone:NSTimeZone.localTimeZone];
}

- (BOOL)isTodayInTimeZone:(NSTimeZone *)timeZone {
    return [self isSameDayAsDate:NSDate.date inTimeZone:timeZone];
}

- (NSDate *)startOfDay {
    return [self startOfDayInTimeZone:NSTimeZone.localTimeZone];
}

- (NSDate *)startOfDayInTimeZone:(NSTimeZone *)timeZone {
    NSArray *range = [self rangeForDayInTimeZone:timeZone];
    NSDate *start = range[0];
    return start;
}

- (NSDate *)startOfPreviousDay {
    return [self startOfPreviousDayInTimeZone:NSTimeZone.localTimeZone];
}

- (NSDate *)startOfPreviousDayInTimeZone:(NSTimeZone *)timeZone {
    NSArray *range = [self rangeForPreviousDayInTimeZone:timeZone];
    NSDate *start = range[0];
    return start;
}

- (NSArray *)rangeForPreviousDayInTimeZone:(NSTimeZone *)timeZone {
    // resets the time for the current
    // date to get the start date
    NSCalendar *calendar = NSCalendar.currentCalendar;
    calendar.timeZone = timeZone;

    NSDateComponents *components = [calendar components:NSCalendar.allCalendarUnits fromDate:self];
    components.timeZone = timeZone;
    components.hour = components.minute = components.second = 0;
    NSDate *today = [calendar dateFromComponents:components];
   
    NSDateComponents *yesterdayComponents = [calendar components:NSCalendar.allCalendarUnits fromDate:today];
    yesterdayComponents.timeZone = timeZone;
    yesterdayComponents.minute = yesterdayComponents.second = 0;
    yesterdayComponents.hour = -24;
    NSDate *startDate = [calendar dateFromComponents:yesterdayComponents];
    
    // sets the maximum time for the current date and
    // adds a second to get the end date (exclusive)
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    NSDate *endDate = [calendar dateFromComponents:components];
    endDate = [endDate dateByAddingTimeInterval:1];
    
    // returns the date range
    NSArray *range = @[startDate, endDate];
    return range;
}

- (NSDate *)endOfDay {
    return [self endOfDayInTimeZone:NSTimeZone.localTimeZone];
}

- (NSDate *)endOfDayInTimeZone:(NSTimeZone *)timeZone {
    NSArray *range = [self rangeForDayInTimeZone:timeZone];
    NSDate *end = range[1];
    return end;
}

- (NSArray *)rangeForDayInTimeZone:(NSTimeZone *)timeZone {
    // resets the time for the current
    // date to get the start date
    NSCalendar *calendar = NSCalendar.currentCalendar;
    calendar.timeZone = timeZone;
    NSDateComponents *components = [calendar components:NSCalendar.allCalendarUnits fromDate:self];
    components.timeZone = timeZone;
    components.hour = components.minute = components.second = 0;
    NSDate *startDate = [calendar dateFromComponents:components];

    // sets the maximum time for the current date and
    // adds a second to get the end date (exclusive)
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    NSDate *endDate = [calendar dateFromComponents:components];
    endDate = [endDate dateByAddingTimeInterval:1];

    // returns the date range
    NSArray *range = @[startDate, endDate];
    return range;
}

- (BOOL)isSameDayAsDate:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone {
    NSCalendar *calendar = NSCalendar.currentCalendar;
    calendar.timeZone = timeZone;
    NSCalendarUnit calendarUnits = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:calendarUnits fromDate:self];
    components.timeZone = timeZone;
    NSDateComponents *dateComponents = [calendar components:calendarUnits fromDate:date];
    dateComponents.timeZone = timeZone;
    if(components.year != dateComponents.year) { return NO; }
    if(components.month != dateComponents.month) { return NO; }
    if(components.day != dateComponents.day) { return NO; }
    return YES;
}

- (NSDate *)dateWithoutTime {
    NSCalendar *calendar = NSCalendar.currentCalendar;
    calendar.timeZone = NSTimeZone.localTimeZone;
    NSCalendarUnit calendarUnits = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:calendarUnits fromDate:self];
    components.timeZone = NSTimeZone.localTimeZone;
    NSDate *date = [calendar dateFromComponents:components];
    return date;
}

- (BOOL)isPast {
    return [self isBeforeDate:NSDate.date];
}

- (BOOL)isFuture {
    return [self isAfterDate:NSDate.date];
}

- (BOOL)isBeforeDate:(NSDate *)date {
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)isAfterDate:(NSDate *)date {
    return [self compare:date] == NSOrderedDescending;
}

- (NSDate *)dateByAddingDay {
    return [self dateByAddingTimeInterval:NSDate.secondsInDay];
}

@end
