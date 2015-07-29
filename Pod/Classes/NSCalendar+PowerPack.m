#import "NSCalendar+PowerPack.h"

@implementation NSCalendar(Utils)

+ (NSCalendarUnit)allCalendarUnits {
    NSCalendarUnit calendarUnit = NSYearCalendarUnit;
    calendarUnit |= NSMonthCalendarUnit;
    calendarUnit |= NSDayCalendarUnit;
    calendarUnit |= NSHourCalendarUnit;
    calendarUnit |= NSMinuteCalendarUnit;
    calendarUnit |= NSSecondCalendarUnit;
    calendarUnit |= NSWeekdayCalendarUnit;
    calendarUnit |= NSWeekCalendarUnit;
    calendarUnit |= NSWeekOfMonthCalendarUnit;
    calendarUnit |= NSWeekOfYearCalendarUnit;
    return calendarUnit;
}

@end
