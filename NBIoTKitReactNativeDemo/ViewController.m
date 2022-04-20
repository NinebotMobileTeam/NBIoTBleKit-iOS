//
//  ViewController.m
//  NBIoTKitReactNativeDemo
//
//  Created by yun.ao on 2022/4/20.
//

#import "ViewController.h"
#import <React/RCTRootView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"High Score Button Pressed");
        NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];

        RCTRootView *rootView =
          [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                      moduleName: @"RNHighScores"
                               initialProperties:
                                 @{
                                   @"scores" : @[
                                     @{
                                       @"name" : @"Alex",
                                       @"value": @"42"
                                      },
                                     @{
                                       @"name" : @"Joel",
                                       @"value": @"10"
                                     }
                                   ]
                                 }
                                   launchOptions: nil];
    
    self.view = rootView;
}


@end
