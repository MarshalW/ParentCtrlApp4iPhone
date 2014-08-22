//
//  HomeContentTableView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-13.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeContentTableView.h"
#import "HomeContentTableViewCell.h"
#import "DeviceInfo.h"
#import "ApplicationContext.h"

@implementation HomeContentTableView

- (id)initWithFrame:(CGRect)frame deviceInfoArray:(NSMutableArray *) array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        deviceInfoArray=array;
        
        timer=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
    return self;
}

-(void) stop
{
    [timer invalidate];
    
     for (UITableViewCell *cell in self.visibleCells)
     {
         HomeContentTableViewCell *contentCell=(HomeContentTableViewCell *)cell;
         [contentCell removeDeviceObserver];
         
         [self removeObserver:cell forKeyPath:@"scrollEnabled"];
         [self removeObserver:cell forKeyPath:@"timestamp"];
     }
}

//-(void) start
//{
//    timer=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
//    
//    for (UITableViewCell *cell in self.visibleCells)
//    {
//        HomeContentTableViewCell *contentCell=(HomeContentTableViewCell *)cell;
//        [self addObserver:self forKeyPath:@"scrollEnabled" options: context:<#(void *)#>]
////        [contentCell removeDeviceObserver];
//        
////        [self removeObserver:cell forKeyPath:@"scrollEnabled"];
////        [self removeObserver:cell forKeyPath:@"timestamp"];
//    }
//}


- (void)timerAction:(NSTimer*)timer
{
    [[ApplicationContext sharedContext] getDevicesInfoWithTheRouter:nil success:^(NSMutableArray * array) {
        for (int i=0; i<deviceInfoArray.count; i++) {
            DeviceInfo *device=[deviceInfoArray objectAtIndex:i];
            for (int j=0; j<array.count; j++) {
                DeviceInfo *d=[array objectAtIndex:j];
                if (d.rid==device.rid) {
                    [device setValue:d.networkSpeed forKey:@"networkSpeed"];
                    break;
                }
            }
        }
    } error:^(NSError * error) {
        NSLog(@"err: %@",error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [deviceInfoArray count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self addObserver:cell forKeyPath:@"scrollEnabled" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:cell forKeyPath:@"timestamp" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self removeObserver:cell forKeyPath:@"scrollEnabled"];
    [self removeObserver:cell forKeyPath:@"timestamp"];
    
    HomeContentTableViewCell *contentCell=(HomeContentTableViewCell *)cell;
    [contentCell removeDeviceObserver];
}

-(void) removeDevice:(int)index
{
    [deviceInfoArray removeObjectAtIndex:index];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"deviceInfocell";
    
    HomeContentTableViewCell *cell = (HomeContentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell=[[[NSBundle mainBundle] loadNibNamed:@"HomeContentTableViewCell" owner:self options:nil] objectAtIndex:0];
        cell.tableView=self;
    }
    
    [cell initWithData:[deviceInfoArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if (!self.scrollEnabled) {
        [self setValue:[NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] * 1000] forKey:@"timestamp"];
    }
}

-(void)dealloc
{
    NSLog(@"dealloc content table view");
}

@end
