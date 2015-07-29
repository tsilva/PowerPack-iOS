#import "NSDateFormatter+PowerPack.h"

@implementation NSDateFormatter(PowerPack)

+ (NSDateFormatter *)defaultDateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = UIApplication.sharedApplication.currentLocale;
    formatter.timeZone = NSTimeZone.localTimeZone;
    return formatter;
}

+ (NSDateFormatter *)fullDateFormatter {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterFullStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    return formatter;
}

+ (NSDateFormatter *)longDateFormatter {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterLongStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    return formatter;
}

+ (NSDateFormatter *)mediumDateFormatter {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterMediumStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    return formatter;
}

+ (NSDateFormatter *)shortDateFormatter {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    return formatter;
}

+ (NSDateFormatter *)fullTimeFormatter {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = NSDateFormatterFullStyle;
    return formatter;
}

+ (NSDateFormatter *)longTimeFormatter {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = NSDateFormatterLongStyle;
    return formatter;
}

+ (NSDateFormatter *)mediumTimeFormatter {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = NSDateFormatterMediumStyle;
    return formatter;
}

+ (NSDateFormatter *)shortTimeFormatter {
    NSDateFormatter *formatter = NSDateFormatter.defaultDateFormatter;
    formatter.dateStyle = NSDateFormatterNoStyle;
    formatter.timeStyle = NSDateFormatterShortStyle;
    return formatter;
}

@end
