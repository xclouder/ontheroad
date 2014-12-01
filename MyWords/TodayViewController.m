//
//  TodayViewController.m
//  MyWords
//
//  Created by xClouder on 14/12/1.
//  Copyright (c) 2014年 xClouder. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "TalkCell.h"

@interface TodayViewController () <NCWidgetProviding, UITableViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) NSArray *arr;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.arr = @[@"如果不清楚目标，再怎么节省时间也是多余", @"同一个玩笑不必说第二次"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

//- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets;
//{
//    return UIEdgeInsetsZero;
//}

#pragma mark - Table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TalkCell *talkCell = (TalkCell *)[tableView dequeueReusableCellWithIdentifier:@"talk"];
    talkCell.talkLabel.text = [self.arr objectAtIndex:indexPath.row];
    
    return talkCell;
}

@end
