#import <Kiwi/Kiwi.h>
#import "BPAPIClient.h"

SPEC_BEGIN(BPAPIClientSpec)

describe(@"BPAPIClient", ^{

    describe(@"some method", ^{
        it(@"should _ when the request succeeds", ^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                NSString *path = request.URL.path;
                return [path isEqualToString:@""];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                NSBundle *bundle = [NSBundle bundleForClass:self.class];
                NSString *path = OHPathForFileInBundle(@"track.json", bundle);
                OHHTTPStubsResponse *response = [OHHTTPStubsResponse responseWithFileAtPath:path
                                                                                 statusCode:200
                                                                                    headers:@{@"Content-Type": @"application/json"}];
                return response;
            }];

            
        });

        it(@"should _ when the request fails", ^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                NSString *path = request.URL.path;
                return [path isEqualToString:@""];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithData:[NSData data]
                                                  statusCode:400
                                                     headers:nil];
            }];

        });


    });

});

SPEC_END
