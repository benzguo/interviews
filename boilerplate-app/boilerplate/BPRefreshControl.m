//
//  BPRefreshControl.m
//  boilerplate
//
//  Created by Ben Guo on 5/27/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

#import "BPRefreshControl.h"
#import "BPRefreshMaskingView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface BPRefreshControl ()

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) NSString *labelText;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) BPRefreshMaskingView *maskView;

@end

@implementation BPRefreshControl

- (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = scrollView;
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.textAlignment = NSTextAlignmentCenter;
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refreshcontrol"]];
        _imageView.frame = CGRectMake(0, 0, 20, 20);
        _maskView = [[BPRefreshMaskingView alloc] initWithFrame:_imageView.frame];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.maskView];
        [self addSubview:self.contentView];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;

        RACSignal *yOffsetSignal = [RACObserve(self.scrollView, contentOffset) map:^id(NSValue *value) {
            CGPoint contentOffset = [value CGPointValue];
            CGFloat topMargin = self.scrollView.contentInset.top;
            return @(-(contentOffset.y + topMargin));
        }];

        RACSignal *relativeOffsetSignal = [yOffsetSignal map:^id(id value) {
            return @([value floatValue]/CGRectGetHeight(self.bounds));
        }];

        @weakify(self)
        RAC(self.maskView, relativeMask) = [relativeOffsetSignal map:^id(NSNumber *value) {
            return @([value floatValue]);
        }];

        RAC(self.contentView, frame) = [yOffsetSignal map:^id(NSNumber *value) {
            @strongify(self)
            CGRect frame = CGRectOffset(self.bounds, 0, -[value floatValue]);
            return [NSValue valueWithCGRect:frame];
        }];

        RAC(self.contentView, hidden) = [relativeOffsetSignal map:^id(NSNumber *value) {
            return @([value floatValue] <= 0);
        }];

        RAC(self.label, hidden) = [relativeOffsetSignal map:^id(NSNumber *value) {
            return @([value floatValue] >= 1);
        }];

        RAC(self.activityIndicator, hidden) = [relativeOffsetSignal map:^id(id value) {
            return @(!([value floatValue] >= 1));
        }];

        RACSignal *shouldStartSignal =
        [relativeOffsetSignal combinePreviousWithStart:@0
                                                reduce:^id(id previous, id current) {
                                                    CGFloat prev = [previous floatValue];
                                                    CGFloat cur = [current floatValue];
                                                    return @(prev < 1 && cur >= 1);
                                                }];
        RACSignal *shouldStopSignal =
        [relativeOffsetSignal combinePreviousWithStart:@0
                                                reduce:^id(id previous, id current) {
                                                    CGFloat prev = [previous floatValue];
                                                    CGFloat cur = [current floatValue];
                                                    return @(prev >= 1 && cur < 1);
                                                }];

        [shouldStartSignal subscribeNext:^(id x) {
            @strongify(self)
            if ([x boolValue]) {
                [self.activityIndicator startAnimating];
            }
        }];

        [shouldStopSignal subscribeNext:^(id x) {
            @strongify(self)
            if ([x boolValue]) {
                [self.activityIndicator stopAnimating];
            }
        }];

        [scrollView insertSubview:self atIndex:0];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    self.label.frame = self.contentView.bounds;
    self.activityIndicator.center = self.contentView.center;
    self.imageView.center = self.contentView.center;
    self.maskView.center = self.contentView.center;
}





@end
