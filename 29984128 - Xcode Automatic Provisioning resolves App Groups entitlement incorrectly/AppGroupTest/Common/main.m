#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    #pragma mark Add AppGroups here
    NSArray *appGroups = @[
                           @"net.Ashton-W.AppGroupTest-Debug.AppGroup",
                           @"net.Ashton-W.AppGroupTest-Release.AppGroup",
                           @"net.Ashton-W.AppGroupTest.ManualApp-Debug",
                           @"net.Ashton-W.AppGroupTest.ManualApp-Release",
                           @"group.net.Ashton-W.AppGroupTest-Debug.AppGroup",
                           @"group.net.Ashton-W.AppGroupTest-Release.AppGroup",
                           @"group.net.Ashton-W.AppGroupTest.ManualApp-Debug",
                           @"group.net.Ashton-W.AppGroupTest.ManualApp-Release"
                           ];
    
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = [[UIViewController alloc] init];
    
    // show entitlements on screen to aid debugging
    UILabel *label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
    label.backgroundColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    
    NSMutableString *text = [[NSMutableString alloc] initWithString:@"App Groups:\n"];
    for (NSString *appGroup in appGroups) {
        if ([self canAccessApplicationGroup:appGroup]) {
            [text appendFormat:@"%@\n", appGroup];
        }
    }
    
    label.text = text;
    
    [self.window.rootViewController.view addSubview:label];
    
    [self.window makeKeyAndVisible];
}

- (BOOL)canAccessApplicationGroup:(NSString *)appGroupIdentifier
{
    return [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:appGroupIdentifier] != nil;
}

@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
