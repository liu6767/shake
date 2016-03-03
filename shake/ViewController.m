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
//@property (nonatomic, assign) SystemSoundID soundID;
{
    SystemSoundID _soundID;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    NSLog(@"fafadsf");
    NSLog(@"branch1");
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}


- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"begin");
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    //1.获得音效文件的全路径
    
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"shakemusic.mp3" withExtension:nil];
    
    //2.加载音效文件，创建音效ID（SoundID,一个ID对应一个音效文件）
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &_soundID);
    
    //把需要销毁的音效文件的ID传递给它既可销毁
    //    AudioServicesDisposeSystemSoundID(soundID);
    
    //3.播放音效文件
    //下面的两个函数都可以用来播放音效文件，第一个函数伴随有震动效果
    AudioServicesPlayAlertSound(_soundID);
    //AudioServicesPlaySystemSound(<#SystemSoundID inSystemSoundID#>)

}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"cancle");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
    AudioServicesDisposeSystemSoundID(_soundID);
    NSLog(@"end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
