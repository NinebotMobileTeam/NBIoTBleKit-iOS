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
//        NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
#error change your ip address
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://10.10.20.78:8081/index.bundle?platform=ios"];
//    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://10.10.21.127:8081/debugger-proxy?role=client"];

    RCTRootView *rootView =
          [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                      moduleName: @"App"
                               initialProperties: nil
                                   launchOptions: nil];
    
    self.view = rootView;
}


@end
