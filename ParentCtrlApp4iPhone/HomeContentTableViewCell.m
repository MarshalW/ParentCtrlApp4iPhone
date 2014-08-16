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
    
    startScrollViewFrame=scrollView.frame;
    endScrollViewFrame=CGRectMake(scrollView.frame.origin.x, scrollView.frame.origin.y, scrollView.frame.size.width+kEndPointX, scrollView.frame.size.height);
    
    //CGFloat top, left, bottom, right;
    scrollView.contentInset=UIEdgeInsetsMake(0,0,kScrollViewContentBottom,kScrollViewRight);
    scrollView.delaysContentTouches=YES;
    
    [scrollView.panGestureRecognizer setMaximumNumberOfTouches:1];
    [scrollView.panGestureRecognizer addTarget:self action:@selector(panGestureAction:)];
    
    [self.deleteButton addTarget:self action:@selector(deleteIt:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.useButton addTarget:self action:@selector(useIt:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)deleteIt:(id)sender{
    NSLog(@"delete it. cell super view %@",[self.superview superview]);
    
    UITableView *tableView=(UITableView *)[self.superview superview];
    
    NSIndexPath *indexPath = [tableView indexPathForCell:self];
    
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    
    NSLog(@"indexpath %@",indexPath);
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
    
    //TODO 临时写过，cell里的view都没有删除呢

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
            
            [UIView animateWithDuration:kAnimDuration
                                  delay:0
                                options: UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 if (opened) {
                                     frontView.frame=startFrame;
//                                     currentScrollViewFrame=startScrollViewFrame;
                                 }else{
                                     frontView.frame=endFrame;
//                                     currentScrollViewFrame=endScrollViewFrame;
                                 }
                             }
                             completion:^(BOOL finished){
                                 opened=!opened;
                                 
                                
//                                 scrollView.frame=currentScrollViewFrame;
                             }];
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
- (IBAction)action:(id)sender {
    
    NSLog(@"action!");
}


@end
