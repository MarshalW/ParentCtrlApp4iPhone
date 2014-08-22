//
//  HomeContentTableViewCell.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-13.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeContentTableViewCell.h"


//Cell内容视图移出后的X坐标
int kEndPointX=-150;
float kScrollViewContentBottom=95.;
float kScrollViewRight=450.;
float kAnimDuration=.3;

@implementation HomeContentTableViewCell

- (void)awakeFromNib
{
    startFrame=frontView.frame;
    endFrame=CGRectMake(kEndPointX, frontView.frame.origin.y, frontView.frame.size.width, frontView.frame.size.height);
    
    //CGFloat top, left, bottom, right;
    scrollView.contentInset=UIEdgeInsetsMake(0,0,kScrollViewContentBottom,kScrollViewRight);
    scrollView.delaysContentTouches=YES;
    
    [scrollView.panGestureRecognizer setMaximumNumberOfTouches:1];
    [scrollView.panGestureRecognizer addTarget:self action:@selector(panGestureAction:)];
    
    [self.deleteButton addTarget:self action:@selector(deleteIt:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.useButton addTarget:self action:@selector(useIt:) forControlEvents:UIControlEventTouchUpInside];
}

-(void) initWithData:(DeviceInfo *)info
{
    deviceInfo=info;
    
    [deviceInfo addObserver:self forKeyPath:@"networkSpeed" options:NSKeyValueObservingOptionNew context:nil];
    
    self.textLabel.text=[NSString stringWithFormat: @"%@", info.networkSpeed];
}

-(void) addDeviceObserver
{
    [deviceInfo addObserver:self forKeyPath:@"networkSpeed" options:NSKeyValueObservingOptionNew context:nil];
}

-(void) removeDeviceObserver
{
    [deviceInfo removeObserver:self forKeyPath:@"networkSpeed"];
}

- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context
{
    if ([keyPath isEqualToString:@"scrollEnabled"]) {
        if (opened) {
            [self enableOrDisableSubviews:NO];
        }else{
            [self setUserInteractionEnabled:self.tableView.scrollEnabled];
            [self enableOrDisableSubviews:YES];
        }
    }
    
    if ([keyPath isEqualToString:@"timestamp"]) {
        if (opened) {
            [self openOrCloseFrontView];
        }
    }
    
    if ([keyPath isEqualToString:@"networkSpeed"]) {
//        NSLog(@"network speed changed: %@, %@",change,change[@"new"]);
        self.textLabel.text=[NSString stringWithFormat: @"%@", change[@"new"]];
    }
}

-(void)enableOrDisableSubviews:(BOOL)enable
{
    for (int i=0; i<[frontView subviews].count; i++) {
        UIView *v=[[frontView subviews] objectAtIndex:i];
        if ([v isKindOfClass:[UIScrollView class]]) {
            v.userInteractionEnabled=YES;
        }else{
            v.userInteractionEnabled=enable;
        }
    }
}

//用于取消之前的KVO观察者
- (void)prepareForReuse
{
    opened=NO;
    frontView.frame=startFrame;
    [self enableOrDisableSubviews:YES];
}

- (UITableView *)superTableView
{
    return (UITableView *)[self findTableView:self];
}

- (UIView *)findTableView:(UIView *)view
{
    if (view.superview && [view.superview isKindOfClass:[UITableView class]]) {
        return view.superview;
    }
    return [self findTableView:view.superview];
}

- (void)dealloc
{
    NSLog(@"dealloc home content table cell");
    
}

-(void)deleteIt:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:self];
    [self.tableView removeDevice:(int)indexPath.row];
    
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    
    self.tableView.scrollEnabled=YES;
}

-(void)useIt:(id)sender{
    NSLog(@"use it.");
}


-(void)panGestureAction:(UIPanGestureRecognizer *)recognizer
{
    switch (recognizer.state)
    {
        case UIGestureRecognizerStateBegan:{
            panStartPoint = [recognizer translationInView:self.contentView];
            startViewX=frontView.frame.origin.x;
            stopped=NO;
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint currentPoint = [recognizer translationInView:self.contentView];
            CGFloat deltaX = currentPoint.x - panStartPoint.x;
            
            if ((deltaX<0 && opened) ||(deltaX>0 && !opened) ) {
                stopped=YES;
                break;
            }
            
            stopped=NO;
            frontView.frame=CGRectMake(startViewX+deltaX, frontView.frame.origin.y, frontView.frame.size.width, frontView.frame.size.height);
            break;
        }
        case UIGestureRecognizerStateEnded:{
            if (stopped) {
                break;
            }
            
            [self openOrCloseFrontView];
            
            break;
        }
        case UIGestureRecognizerStateCancelled:{
            NSLog(@"cancell ..");
            break;
        }
        default:
            NSLog(@"default ..");
            break;
    }
    
    //TODO 改为根据位移或者swipe速度判断是打开还是关闭，目前是简单的!opened
}

-(void)openOrCloseFrontView
{
    [UIView animateWithDuration:kAnimDuration
                          delay:0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         if (opened) {
                             frontView.frame=startFrame;
                         }else{
                             frontView.frame=endFrame;
                         }
                     }
                     completion:^(BOOL finished){
                         opened=!opened;
                         [self.tableView setValue:@(!opened) forKey:@"scrollEnabled"];
                     }];
}

- (IBAction)action:(id)sender {
    NSLog(@"action!");
}

@end
