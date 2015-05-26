#import <Foundation/Foundation.h>

@interface BPTestUtilities : NSObject

+ (id)jsonObjectWithName:(NSString *)name;

+ (NSData*)dataFromJsonFileWithName:(NSString*)name;

@end
