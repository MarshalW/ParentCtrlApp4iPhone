//
//  HomeContentTableView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-13.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeContentTableView.h"
#import "HomeContentTableViewCell.h"


int count=10;//临时代码，为了演示删除交互

@implementation HomeContentTableView

- (id)initWithFrame:(CGRect)frame deviceInfoArray:(NSArray *) array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        deviceInfoArray=array;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [deviceInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"deviceInfocell";
    
    HomeContentTableViewCell *cell = (HomeContentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell=[[[NSBundle mainBundle] loadNibNamed:@"HomeContentTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell initWithData:[deviceInfoArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"Row pressed!!");
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

@end
