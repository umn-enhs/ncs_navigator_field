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
    CGRect r = subview.frame;
    CGFloat newX = MAX(self.contentSize.width, r.origin.x + r.size.width);
    CGFloat newY = MAX(self.contentSize.height, r.origin.y + r.size.height);
//    NSLog(@"newX [%@ : %@]", newX, newY);
    self.contentSize = CGSizeMake(newX, newY);
}
                       
@end
