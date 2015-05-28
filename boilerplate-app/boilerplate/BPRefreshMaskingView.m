

#import "BPRefreshMaskingView.h"

@interface BPRefreshMaskingView ()


@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation BPRefreshMaskingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor] set];
//    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0];
//    [rectPath fill];
    [self.path fill];
}

- (void)setRelativeMask:(CGFloat)relativeMask
{
    _relativeMask = relativeMask;
    self.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds),
                                                                  CGRectGetMidY(self.bounds))
                                               radius:CGRectGetWidth(self.bounds)/2.0
                                           startAngle:0
                                             endAngle:relativeMask*2*M_PI
                                            clockwise:YES];
    self.path.lineWidth = 2;
    [self setNeedsDisplay];
}

@end
