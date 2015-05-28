#import "BPLogger.h"
#import "BPAPIClient.h"

NSUInteger const BPQueueThreshold = 100;

@interface BPLogger ()

@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, strong) BPAPIClient *apiClient;
@property (nonatomic, strong) NSArray *eventQueue;
@property (nonatomic, strong) dispatch_queue_t processingQueue;

@end

@implementation BPLogger

- (instancetype)initWithClientId:(NSString *)clientId
{
    self = [super init];
    if (self) {
        _clientId = clientId;
        _apiClient = [[BPAPIClient alloc] initWithClientId:clientId];
        _eventQueue = [NSMutableArray arrayWithCapacity:BPQueueThreshold];
        _processingQueue = dispatch_queue_create("processing queue", NULL);

        [[RACObserve(self, eventQueue) filter:^BOOL(NSArray *queue) {
            return @([queue count] > BPQueueThreshold);
        }] subscribeNext:^(id x) {
            [self.apiClient postEvents:self.eventQueue callback:^(BOOL success) {
                if (success) {
                    dispatch_async(self.processingQueue, ^{
                        self.eventQueue = @[];
                    });
                }
            }];
        }];
    }
    return self;
}

- (void)logEvent:(BPLoggerEvent *)event
{
    dispatch_async(self.processingQueue, ^{
        self.eventQueue = [self.eventQueue arrayByAddingObject:event];
    });
//    [self.apiClient postEvent:event callback:^(BOOL success) {
//        NSLog(@"%@", @(success));
//    }];
}


@end
