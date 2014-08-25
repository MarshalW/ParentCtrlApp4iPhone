//
//  HomeRootView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-9.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//


//TODO 这个类写的比较乱，已经做了重构，只乱在类内部，对外面没有影响。有空再说。
#import "HomeRootView.h"

@implementation HomeRootView

-(void) loadSubviews
{
    [self initMenuView];
    [self initMaskView];
}

-(void)initMenuView
{
    menuView.frame=CGRectMake(-menuView.frame.size.width, 0, menuView.frame.size.width, self.frame.size.height);
    menuView.hidden=YES;
    [self addSubview:menuView];
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

- (void) dealloc
{
    NSLog(@"dealloc home root view");
}

-(void) openMenu
{
    [self _showMenu];
}

-(void) closeMenu{
    [self _showMenu];    
}

-(void) _showMenu
{
    menuView.hidden=NO;
    
    float moveY=-250;
    if (!menuShow) {
        moveY=250;
        menuShow=YES;
    }else{
        menuShow=NO;
    }
    
    [UIView animateWithDuration:.3
                          delay:0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.subviews enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
                             if(v!=self){
                                 v.frame=CGRectMake(v.frame.origin.x+moveY, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
                             }
                         }];
                         
                         if (menuShow) {
                             maskView.layer.opacity=0.3;
                         }else{
                             maskView.layer.opacity=0;
                         }
                     }
                     completion:^(BOOL finished){
//                         NSLog(@"Done!");
                     }];
}

@end
