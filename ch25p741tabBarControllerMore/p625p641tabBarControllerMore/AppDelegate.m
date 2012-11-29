

#import "AppDelegate.h"
#import "MyDataSource.h"

@interface AppDelegate()
@property (nonatomic, strong) UITabBarController* tabBarController;
@property (nonatomic, strong) MyDataSource* myDataSource;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    self.tabBarController = [UITabBarController new];
                        
    self.tabBarController.viewControllers = @[[UIViewController new],
                                             [UIViewController new],
                                             [UIViewController new],
                                             [UIViewController new],
                                             [UIViewController new],
                                             [UIViewController new]];
    NSArray* arr = @[@"First", @"Second", @"Third", @"Fourth", @"Fifth", @"Sixth"];
    for (int i = 0; i < 6; i++)
        [[(self.tabBarController.viewControllers)[i] tabBarItem] setTitle: arr[i]];
    self.window.rootViewController = self.tabBarController;
    
    
    // comment out what follows to see what difference this customization makes
//    /*
    UINavigationController* more = self.tabBarController.moreNavigationController;
    UIViewController* list = (more.viewControllers)[0];
    list.title = @"";
    UIBarButtonItem* b = [[UIBarButtonItem alloc] init];
    b.title = @"Back";
    list.navigationItem.backBarButtonItem = b; // so user can navigate back
    more.navigationBar.barStyle = UIBarStyleBlack;
    UITableView* tv = (UITableView*)list.view;
    MyDataSource* mds = [[MyDataSource alloc] init];
    self.myDataSource = mds; // retain policy
    self.myDataSource.originalDataSource = tv.dataSource;
    tv.dataSource = self.myDataSource;
//    */
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
