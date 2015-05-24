#import "BPAPIClient.h"

NSString *const BPBaseURLString = @"";

@interface BPAPIClient ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation BPAPIClient

+ (NSMutableDictionary *)baseParameters
{
    return [NSMutableDictionary dictionaryWithDictionary:@{}];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BPBaseURLString]];
    }
    return self;
}

- (void)fetchThing:(NSString *)thingId callback:(void (^)(NSDictionary *object))callback
{
    if (!callback) {
        return;
    }
    NSString *path = [[[NSURL URLWithString:@""] URLByAppendingPathComponent:@""] absoluteString];
    NSString *urlString = [[NSURL URLWithString:path relativeToURL:self.sessionManager.baseURL] absoluteString];
    NSDictionary *parameters = [BPAPIClient baseParameters];
    NSMutableURLRequest *request = [self.sessionManager.requestSerializer requestWithMethod:@"GET"
                                                                                  URLString:urlString
                                                                                 parameters:parameters
                                                                                      error:nil];
    NSURLSessionDataTask *task =
    [self.sessionManager dataTaskWithRequest:request
                           completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                               if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                   callback(responseObject);
                                   return;
                               }
                               callback(nil);
                           }];
    [task resume];
}

@end
