#import <Foundation/Foundation.h>
#import "BPLoggerEvent.h"

@class BPLoggerEvent;
@interface BPLogger : NSObject

///
- (instancetype)initWithClientId:(NSString *)clientId;

- (void)logEvent:(BPLoggerEvent *)event;

@end
