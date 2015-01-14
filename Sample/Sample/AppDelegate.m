//
//  AppDelegate.m
//  Sample
//
//  Created by Jolin He on 14/12/29.
//  Copyright (c) 2014年 Jolin He. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "KTouchPointerWindow.h"
#import "QScreenRecorder.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[QRecorder sharedRecorder] setAlbumName:@"Capture Record"];
    [[QRecorder sharedRecorder] setOptions:QRecorderOptionTouchRecording|QRecorderOptionUserAudioRecording];
    
    // To disable:
    //[CRUIWindow setDisabled:YES];
    self.window.backgroundColor=[UIColor whiteColor];
    
    KTouchPointerWindowInstall();
    return YES;
}

- (UIWindow *)window
{
    if (!_window) _window = [[QUIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    return _window;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    __block UIBackgroundTaskIdentifier background_task;
    //注册一个后台任务，告诉系统我们需要向系统借一些事件
    background_task = [application beginBackgroundTaskWithExpirationHandler:^ {
        //不管有没有完成，结束background_task任务
        [application endBackgroundTask: background_task];
        background_task = UIBackgroundTaskInvalid;
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
