@import Foundation;

@class BPLoggerEvent;
@interface BPAPIClient : NSObject

- (void)postEvent:(BPLoggerEvent *)event callback:(void (^)(BOOL success))callback;
- (void)postEvents:(NSArray *)events callback:(void (^)(BOOL success))callback;

- (instancetype)initWithClientId:(NSString *)clientId;

@end
