//
//  CustomerScrollView.m
//  ParentCtrlApp4iPhone
//
//  Created by Marshal Wu on 14-8-14.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "CustomerScrollView.h"

@implementation CustomerScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.panGestureRecognizer.delegate=self;
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer   shouldReceiveTouch:(UITouch *)touch
{
    NSLog(@"gestureRecognizer==>>%@",[touch view]);
//    tagView=[self.subviews objectAtIndex:0];
//    NSLog(@"receive touch: %@, \n==>tagView: %@",gestureRecognizer.view,tagView);
////    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
//    CGPoint location=[gestureRecognizer locationInView:tagView];
//    
//    return CGRectContainsPoint(tagView.frame,location);
    
    return YES;
}

@end
