#import "BPAPIClient.h"
#import <AFNetworking/AFNetworking.h>
#import "BPLoggerEvent.h"

NSString *const BPBaseURLString = @"http://requestb.in/nv310qnv";
NSString *const BPClientIDKey = @"client_id";

@interface BPAPIClient ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) NSString *clientId;


@end

@implementation BPAPIClient

- (NSMutableDictionary *)baseParameters
{
    return [NSMutableDictionary dictionaryWithDictionary:@{
                                                           BPClientIDKey: self.clientId
                                                           }];
}

- (instancetype)initWithClientId:(NSString *)clientId
{
    self = [super init];
    if (self) {
        _clientId = clientId;
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BPBaseURLString]];
    }
    return self;
}

- (void)postEvent:(BPLoggerEvent *)event callback:(void (^)(BOOL success))callback
{
    if (!callback) {
        return;
    }
    NSMutableDictionary *parameters = [self baseParameters];
    [parameters addEntriesFromDictionary:[event dictionaryRepresentation]];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURL *url = [NSURL URLWithString:BPBaseURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    request.HTTPBody = data;
    request.allHTTPHeaderFields = @{@"Content-Type": @"application/json",
                                    @"Accept": @"application/json"};
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                    if (!error && httpResponse.statusCode == 200) {
                        callback(YES);
                        return;
                    }
                    callback(NO);
    }] resume];


}


- (void)postEvents:(NSArray *)events callback:(void (^)(BOOL success))callback
{
    if (!callback) {
        return;
    }
    NSMutableDictionary *parameters = [self baseParameters];
//    [parameters addEntriesFromDictionary:[event dictionaryRepresentation]];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURL *url = [NSURL URLWithString:BPBaseURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    request.HTTPBody = data;
    request.allHTTPHeaderFields = @{@"Content-Type": @"application/json",
                                    @"Accept": @"application/json"};
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                    if (!error && httpResponse.statusCode == 200) {
                        callback(YES);
                        return;
                    }
                    callback(NO);
                }] resume];
    
    
}

@end
