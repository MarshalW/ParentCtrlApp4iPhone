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
        
//        deviceInfoArray=[NSMutableArray new];
//        for (int i=0; i<10; i++) {
//            [deviceInfoArray addObject:[DeviceInfo new]];
//        }
        deviceInfoArray=array;
        
         [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)timerAction:(NSTimer*)timer
{
    NSLog(@"networkSpeed ...");

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

@end
