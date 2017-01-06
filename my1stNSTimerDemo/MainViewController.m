//
//  MainViewController.m
//  my1stNSTimerDemo
//
//  Created by ernie.cheng on 1/5/17.
//  Copyright © 2017 ernie.cheng. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,UIScrollViewDelegate>{
    UIPageControl *pageControl;
    UIScrollView *scrollView;
    CGFloat mainScreenWidth;
    CGFloat mainScreenHeight;}
//@property(strong,nonatomic)UIWindow *window;
@property(nonatomic,strong)NSDictionary *dic;

@property(nonatomic,strong)UITableView *firstTableView;
@property(nonatomic,assign)int *firstTableViewSelectedIndex;

@property(nonatomic,strong)UITableView *secondTableView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //pagecontrol and scrollView
    [self setPageControlAndScrollView];
    
    //basic UI elements setting
    self.firstTableViewSelectedIndex = 0;
    self.firstTableView = [[UITableView alloc] init];//WithFrame:CGRectMake(100, 100, 200, 300) style:UITableViewStylePlain];
    //self.firstTableView.frame = CGRectMake(100, 100, 200, 300);
    self.firstTableView.delegate = self;
    self.firstTableView.dataSource = self;
    self.firstTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // self.firstTableView.tableFooterView =[[UIView alloc]initWithFrame:CGRectZero];
    self.secondTableView = [[UITableView alloc] init];//WithFrame:CGRectMake(100, 100, 200, 300) style:UITableViewStylePlain];
  //  self.secondTableView.frame = CGRectMake(500, 100, 200, 300);
    self.secondTableView.delegate = self;
    self.secondTableView.dataSource = self;
    self.secondTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // self.secondTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //data source preparation
    self.dic = @{ @"🚗car age":@[@"A.under 10 years",@"B  more than 10 years"],
                  @"📖insurance price": @[@"A.$100",@"B.$500",@"C.$800"],
                  @"💰reimbursement": @[@"A.all",@"B.half",@"C.none🏃"]
                  };
    self.firstTableView.backgroundColor = [UIColor greenColor];
    self.secondTableView.backgroundColor = [UIColor blueColor];
    
    [scrollView addSubview:self.firstTableView];
    [scrollView addSubview:self.secondTableView];
    
    self.firstTableView.frame = CGRectMake(100, 100, 200, 300);
    self.secondTableView.frame = CGRectMake(500, 100, 200, 300);
//    //layout related
//    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[_firstTableView]-10-[_secondTableView(_firstTableView)]-5-|"
//                                                                      options:0
//                                                                      metrics:nil
//                                                                        views:NSDictionaryOfVariableBindings(_firstTableView, _secondTableView)]];
//    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-180-[_firstTableView]-250-|"
//                                                                      options:0
//                                                                      metrics:nil
//                                                                        views:NSDictionaryOfVariableBindings(_firstTableView)]];
//    [scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-180-[_secondTableView]-300-|"
//                                                                      options:0
//                                                                      metrics:nil
//                                                                        views:NSDictionaryOfVariableBindings(_secondTableView)]];
  
    
    
    
    
//杂七杂八问题代码
//      self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//      UINavigationController *navigationController = [[UINavigationController alloc] init];
//      [navigationController addChildViewController:self]; //这个方法什么时候会用到？？？第一个页面不是用了pushviewcontroller了？已经？？
//    self.window.backgroundColor = [UIColor grayColor];
//      [self.window makeKeyAndVisible];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.navigationItem setTitle:@"Main Screen"];
    //NSLog(@"第二2⃣️个页面页面viewdidload被调用");
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-50,[UIScreen mainScreen].bounds.size.height - 130 , 200, 50)];
//    [button setTitle:@"go First Page" forState:UIControlStateNormal];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(GoFirstPage:) forControlEvents:UIControlEventTouchUpInside];
}

//-(void)viewWillAppear:(BOOL)animated{
//    
//    [super viewWillAppear:animated];
//    NSLog(@"第2⃣️个页面页面vieWillAppear被调用");
//}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    NSLog(@"第2⃣️个页面页面vieDidAppear被调用");
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    NSLog(@"第2⃣️个页面页面viewWillDisappear被调用");
//}
//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear: animated];
//    NSLog(@"第2⃣️个页面页面viewDidDisappear被调用");
//    
//}


//-(void)GoFirstPage:(id)sender{
//    //[self.navigationController pushToViewController:[[ViewController alloc] init] animated:true];
//
//    [self.navigationController pushViewController:[[ViewController alloc] init] animated:true];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma tableView related
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _firstTableView) {
        //NSLog(@"---%lu",(unsigned long)_dic.allKeys.count);
        return _dic.allKeys.count;
    }else if (tableView == _secondTableView){
        NSString *key = [_dic.allKeys objectAtIndex:(int)_firstTableViewSelectedIndex];      //⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️注意这里的处理细节
        NSArray *array = [_dic objectForKey:key];
        return array.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    if (tableView == _firstTableView) {
        cell.textLabel.text = [_dic.allKeys objectAtIndex:indexPath.row];
        
        if (indexPath.row == (int)_firstTableViewSelectedIndex) {
            cell.backgroundColor = [UIColor grayColor];
        }
        else{
            cell.backgroundColor = [UIColor whiteColor];
        }
    }else if (tableView == _secondTableView){
        //cell.backgroundColor = [];
        NSString *key = [_dic.allKeys objectAtIndex:(int)_firstTableViewSelectedIndex];
        NSArray *array = [_dic objectForKey:key];
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _firstTableView) {
        _firstTableViewSelectedIndex = (int *)indexPath.row;
        [_firstTableView reloadData];
        [_secondTableView reloadData];
    }else if (tableView == _secondTableView)
    {
        NSLog(@"second table chosen---%d %ld",(int)_firstTableViewSelectedIndex,indexPath.row);
    }
}
//?????????????????????????
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//
//#ifdef __IPHONE_8_0
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
//        [cell setPreservesSuperviewLayoutMargins:NO];
//    }
//    
//#endif
//}



#pragma basic UIbottom settings
-(void)setPageControlAndScrollView{
    //set up pagecontrol + uiscrollview
    mainScreenWidth = [[UIScreen mainScreen] bounds].size.width;
    mainScreenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    NSLog(@"screen width ==== %f,screen height =====%f ",mainScreenWidth,mainScreenHeight);
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(mainScreenWidth * 3, mainScreenHeight-self.navigationItem.accessibilityFrame.size.height);
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, mainScreenHeight - 100 , mainScreenWidth, 50)];
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor blackColor];//[UIColor colorWithRed:238 green:232 blue:170 alpha:0.5];  // UniversalColor(255,192,203);
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];//[UIColor colorWithRed:255 green:192 blue:203 alpha:0.5];//UniversalColor(238,232,170);
    pageControl.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pageControl];
    UISwipeGestureRecognizer *swipeLefttoRightForTablelist = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PageTransitionToLeftAction:)];
    swipeLefttoRightForTablelist.numberOfTouchesRequired = 1;
    swipeLefttoRightForTablelist.direction = UISwipeGestureRecognizerDirectionRight;
    swipeLefttoRightForTablelist.delegate = self;
    [self.view addGestureRecognizer:swipeLefttoRightForTablelist];
    UISwipeGestureRecognizer *swipeRighttoLeftForTablelist = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PageTransitionToRightAction:)];
    swipeRighttoLeftForTablelist.numberOfTouchesRequired = 1;
    swipeRighttoLeftForTablelist.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRighttoLeftForTablelist.delegate = self;
    [self.view addGestureRecognizer:swipeRighttoLeftForTablelist];

}

-(void)PageTransitionToRightAction:( UISwipeGestureRecognizer  *)sender{
    pageControl.currentPage += 1;
    [pageControl updateCurrentPageDisplay];
    [scrollView setContentOffset:CGPointMake(pageControl.currentPage* mainScreenWidth, 0)animated:YES];}
-(void)PageTransitionToLeftAction:( UISwipeGestureRecognizer  *)sender{
    pageControl.currentPage -= 1;
    [pageControl updateCurrentPageDisplay];
    [scrollView setContentOffset:CGPointMake(pageControl.currentPage* mainScreenWidth, 0)animated:YES];}

#pragma UIScrollViewDelegate related
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView1{
    pageControl.currentPage = scrollView1.contentOffset.x /  mainScreenWidth;}
@end
