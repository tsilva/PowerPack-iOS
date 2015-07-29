#import "UIPickerView+PowerPack.h"

@implementation UIPickerView(PowerPack)

- (NSString *)selectedTitle {
    NSInteger row = [self selectedRowInComponent:0];
    NSString *title = [self.delegate pickerView:self titleForRow:row forComponent:0];
    return title;
}

@end
