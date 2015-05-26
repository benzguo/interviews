#import "BPTestUtilities.h"

@implementation BPTestUtilities

+ (id)jsonObjectWithName:(NSString *)name
{
    NSData *jsonData = [self dataFromJsonFileWithName:name];
    id json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    return json;
}

+ (NSData *)dataFromJsonFileWithName:(NSString*)name
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [bundle pathForResource:name ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    return jsonData;
}

@end
