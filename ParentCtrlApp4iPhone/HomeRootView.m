//
//  HomeRootView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeRootView.h"

@implementation HomeRootView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self initMenuView];
        [self initMaskView];
    }
    return self;
}

-(void)initMenuView
{
    NSLog(@"root view, h: %f",self.frame.size.height);
    
    UIView *headView = [[[NSBundle mainBundle] loadNibNamed:@"HomeMenuView" owner:self options:nil] objectAtIndex:0];
    headView.frame=CGRectMake(-headView.frame.size.width, 0, headView.frame.size.width, headView.frame.size.height);
    [self addSubview:headView];
}

-(void) initMaskView
{
    maskView=[[UIView alloc]initWithFrame:self.frame];
    maskView.backgroundColor=[UIColor blackColor];
    maskView.layer.opacity=0;
    [self addSubview:maskView];
    
    UITapGestureRecognizer *recognizer= [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(handleMaskViewTap:)];
    [maskView addGestureRecognizer:recognizer];
}

- (void)handleMaskViewTap:(UITapGestureRecognizer *)recognizer
{
    [self _showMenu];
}

- (IBAction)showMenu:(id)sender
{
    [self _showMenu];
}

-(void) _showMenu
{
    //临时解决mask view高度的问题
    if (!isMaskHeightChecked) {
        isMaskHeightChecked=YES;
        maskView.frame=self.frame;
        [self bringSubviewToFront:maskView];
    }
    
    float moveY=0;
    if (!menuShow) {
        moveY=250;
        menuShow=YES;
    }else{
        menuShow=NO;
    }
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.frame = CGRectMake(moveY, 0, self.frame.size.width, self.frame.size.height);
                         
                         if (menuShow) {
                             maskView.layer.opacity=0.3;
                         }else{
                             maskView.layer.opacity=0;
                         }
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
}

@end