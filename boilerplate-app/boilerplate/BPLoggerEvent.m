#import "BPLoggerEvent.h"

NSString *const BPDateKey = @"date";
NSString *const BPEventDataKey = @"data";

@implementation BPLoggerEvent

- (instancetype)initWithDate:(NSDate *)date data:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        _date = date;
        _data = data;
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
             BPDateKey: @([self.date timeIntervalSince1970]),
             BPEventDataKey: self.data
             };
}

@end
