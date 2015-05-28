#import <Foundation/Foundation.h>

@interface BPLoggerEvent : NSObject

@property (nonatomic, readonly) NSDate *date;
@property (nonatomic, readonly) NSDictionary *data;

- (instancetype)initWithDate:(NSDate *)date data:(NSDictionary *)data;

- (NSDictionary *)dictionaryRepresentation;

@end
