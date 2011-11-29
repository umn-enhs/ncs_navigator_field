//
//  AutoSizingScrollView.m
//  NCSMobile
//
//  Created by John Dzak on 11/28/11.
//
// This 
//
#import "NUScrollView.h"

@implementation NUScrollView

- (void)didAddSubview:(UIView *)subview {
    UIView* sub = [[self subviews] objectAtIndex:0];
    self.contentSize = sub.frame.size;
}

@end
