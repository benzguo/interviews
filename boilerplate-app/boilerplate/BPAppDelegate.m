#import "BPAppDelegate.h"
#import "BPRootViewController.h"
#import "BPRootViewModel.h"

@interface BPAppDelegate ()

@end

@implementation BPAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BPRootViewModel *rootVM = [[BPRootViewModel alloc] init];
    BPRootViewController *rootVC = [[BPRootViewController alloc] initWithViewModel:rootVM];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = navigationController;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
