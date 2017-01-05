//
//  ViewController.m
//  my1stNSTimerDemo
//
//  Created by ernie.cheng on 1/3/17.
//  Copyright © 2017 ernie.cheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *_timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createButton];
    [self initiateTimerSetting];
    self.view.backgroundColor = [UIColor grayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createButton{
    
    NSArray *array = @[@"start",@"pause"];
    for (NSInteger i = 0; i <array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, 100+i*60, 100, 50);
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i+1;
        [self.view addSubview:button];
    }
}

-(void)buttonClicked:(UIButton *)button{
    switch (button.tag) {
        case 1:
        {   [_timer setFireDate:[NSDate distantPast]];
        }
            break;
        case 2:
        {
            [_timer setFireDate:[NSDate distantFuture]];
        }
            break;
        default:
            break;
    }
}


-(void)initiateTimerSetting{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTriggered) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantFuture]];
}

-(void)timerTriggered{
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}


@end
