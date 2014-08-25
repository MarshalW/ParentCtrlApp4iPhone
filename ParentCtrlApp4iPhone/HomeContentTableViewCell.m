//
//  HomeContentTableViewCell.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-13.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeContentTableViewCell.h"
#import "HomeContentCellSubView.h"



//Cell内容视图移出后的X坐标
int kEndPointX=-150;
float kScrollViewContentBottom=95.;
float kScrollViewRight=450.;
float kAnimDuration=.3;

@implementation HomeContentTableViewCell

- (void)awakeFromNib
{
    //记录起始frame
    startFrame=frontView.frame;
    //计算出cell前面视图打开后的位置
    endFrame=CGRectMake(kEndPointX, frontView.frame.origin.y, frontView.frame.size.width, frontView.frame.size.height);
    
    //CGFloat top, left, bottom, right;
    scrollView.contentInset=UIEdgeInsetsMake(0,0,kScrollViewContentBottom,kScrollViewRight);
    scrollView.delaysContentTouches=YES;
    
    [scrollView.panGestureRecognizer setMaximumNumberOfTouches:1];
    [scrollView.panGestureRecognizer addTarget:self action:@selector(panGestureAction:)];
    
    backContentView.frame=backView.bounds;
    [backView addSubview:backContentView];
    backContentView.cell=self;
    
    frontContentView.frame=frontView.bounds;
    frontContentView.userInteractionEnabled=NO;
    [frontView addSubview:frontContentView];
    frontContentView.cell=self;
}

-(void) initWithData:(DeviceInfo *)info
{
//    deviceInfo=info;
    
//    [deviceInfo addObserver:self forKeyPath:@"networkSpeed" options:NSKeyValueObservingOptionNew context:nil];
    
//    self.textLabel.text=[NSString stringWithFormat: @"%@", info.networkSpeed];
}

- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context
{
    if ([keyPath isEqualToString:@"scrollEnabled"]) {
        if (!opened) {
            [self setUserInteractionEnabled:self.tableView.scrollEnabled];
        }
    }
}

//用于取消之前的KVO观察者
- (void)prepareForReuse
{
    opened=NO;
    frontView.frame=startFrame;
}

- (void)dealloc
{
    NSLog(@"dealloc home content table cell");
    
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
            break;
        }
        default:
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

-(void) closeBottomView{
    if (opened) {
        [self openOrCloseFrontView];
    }
}

-(void) addObservers{
    [self.tableView addObserver:self forKeyPath:@"scrollEnabled" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void) removeObservers{
    [self.tableView removeObserver:self forKeyPath:@"scrollEnabled"];
}

@end
