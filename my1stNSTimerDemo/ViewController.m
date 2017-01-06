//
//  ViewController.m
//  my1stNSTimerDemo
//
//  Created by ernie.cheng on 1/3/17.
//  Copyright © 2017 ernie.cheng. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "thanksPageViewController.h"

@interface ViewController ()
{
    NSTimer *_timer;
    BOOL isFirstTimeExecuted;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    //NSLog(@"第一个页面页面viewdidload被调用2");
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self createPageTransitionButton];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
     NSLog(@"第一个页面页面vieWillAppear被调用");
     [self createButton];
     [self initiateTimerSetting];
   

}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//     NSLog(@"第一个页面页面vieDidAppear被调用");
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    NSLog(@"第一个页面页面viewWillDisappear被调用");
//}
//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear: animated];
//    NSLog(@"第一个页面页面viewDidDisappear被调用");
//    
//}
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createPageTransitionButton{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-50,[UIScreen mainScreen].bounds.size.height - 130 , 200, 50)];
    
//    NSLayoutConstraint *buttonLayoutHorizontal = [[NSLayoutConstraint alloc] init];
    
    [button setTitle:@"sign In" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(GoNextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setTitle:@"Init Screen"];
}

-(void)GoNextPage:(id)sender{
    //[self presentViewController:[[MainViewController alloc] init] animated:true completion:nil]; //不用navigation controller的时候
    [self.navigationController pushViewController:[[MainViewController alloc] init] animated:true];
    
   // [self.navigationController showViewController:[[thanksPageViewController alloc] init] sender:nil];
    
    //[self.navigationController pushViewController:[[thanksPageViewController alloc] init] animated:true];
}

-(void)createButton{
    
    NSArray *array = @[@"start shuffle color",@"pause"];
    for (NSInteger i = 0; i <array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, 100+i*60, 200, 50);
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i+1;
        [self.view addSubview:button];
    }
}

-(void)buttonClicked:(UIButton *)button{
    switch (button.tag) {
        case 1:
        {   [_timer setFireDate:[NSDate distantPast]];//start the timer
        }
            break;
        case 2:
        {
            [_timer setFireDate:[NSDate distantFuture]];
            isFirstTimeExecuted = YES;
        }
            break;
        default:
            break;
    }
}


-(void)initiateTimerSetting{
    
   // _timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timerTriggered) userInfo:nil repeats:YES];
    isFirstTimeExecuted = YES;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        if (isFirstTimeExecuted) {
//            NSLog(@"do nothing");
//            isFirstTimeExecuted = NO;
//        }else{
//            NSLog(@"do sth");
//        self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
//        }
        
        self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    }];
    // [_timer setFireDate:[NSDate distantPast]];
    [_timer setFireDate:[NSDate distantFuture]];//stop the timer
}

-(void)timerTriggered{
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}


@end
