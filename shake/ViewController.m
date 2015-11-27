//
//  ViewController.m
//  shake
//
//  Created by lj on 15/11/27.
//  Copyright © 2015年 lj. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    
}


- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"begin");
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"cancle");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
