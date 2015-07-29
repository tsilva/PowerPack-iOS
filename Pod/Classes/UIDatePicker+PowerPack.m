#import "UIDatePicker+PowerPack.h"

@implementation UIDatePicker(PowerPack)

+ (UIDatePicker *)defaultDatePicker {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.locale = UIApplication.sharedApplication.currentLocale;
    datePicker.timeZone = NSTimeZone.localTimeZone;
    return datePicker;
}

@end
