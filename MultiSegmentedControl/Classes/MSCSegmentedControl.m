//
//  MSCSegmentedControl.m
//  MultiSegmentedControl
//
//  Created by 李翔宇 on 2017/9/27.
//

#import "MSCSegmentedControl.h"
#import <Masonry/Masonry.h>
#import "UIView+MSCSegmentExtension.h"

@interface MSCSegmentedControl()

@property (nonatomic, strong) NSMutableArray<UIView<MSCSegmentProtocol> *> *segmentsM;
@property (nonatomic, strong) NSMutableArray<UIView<MSCDividerProtocol> *> *dividersM;

@end

@implementation MSCSegmentedControl

- (instancetype)initWithSegments:(NSArray<UIView<MSCSegmentProtocol> *> *)segments {
    self = [super init];
    if(self) {
        _segmentsM = [NSMutableArray array];
        _dividersM = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Public Method

- (NSArray<UIView<MSCSegmentProtocol> *> *)segments {
    return [self.segmentsM copy];
}

- (void)addSegment:(UIView<MSCSegmentProtocol> *)segment animated:(BOOL)animated {
    [self insertSegment:segment atIndex:self.segments.count animated:animated];
}

- (void)insertSegment:(UIView<MSCSegmentProtocol> *)segment atIndex:(NSUInteger)index animated:(BOOL)animated {
    
    
    UIView<MSCSegmentProtocol> *lastSegment = nil;
    if(index) {
        lastSegment = self.segments[index - 1];
    }
    
    UIView<MSCSegmentProtocol> *nextSegment = nil;
    if(index < self.segments.count) {
        nextSegment = self.segments[index];
    }

    [self addSubview:segment];
    [self.segmentsM insertObject:segment atIndex:index];
    
    if(lastSegment) {
        [lastSegment.msc_trailing uninstall];
        lastSegment.msc_trailing = nil;
        
        CGFloat offset = lastSegment.msc_edgeInsets.right + segment.msc_edgeInsets.left;
        [segment mas_makeConstraints:^(MASConstraintMaker *make) {
            segment.msc_leading = make.leading.mas_equalTo(lastSegment.mas_trailing).offset(offset);
        }];
    } else {
        [segment mas_makeConstraints:^(MASConstraintMaker *make) {
            segment.msc_leading = make.leading.mas_equalTo(segment.msc_edgeInsets.left);
        }];
    }
    
    [segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_greaterThanOrEqualTo(segment.msc_edgeInsets.top);
        make.bottom.mas_greaterThanOrEqualTo(segment.msc_edgeInsets.bottom);
        
        if(!CGSizeEqualToSize(segment.msc_size, CGSizeZero)) {
            make.width.mas_equalTo(segment.msc_size.width).priorityMedium();
            make.height.mas_equalTo(segment.msc_size.height).priorityMedium();
        }
    }];
    
    if(nextSegment) {
        [nextSegment.msc_leading uninstall];
        nextSegment.msc_leading = nil;
        
        CGFloat offset = segment.msc_edgeInsets.right + nextSegment.msc_edgeInsets.left;
        [nextSegment mas_makeConstraints:^(MASConstraintMaker *make) {
            nextSegment.msc_leading = make.leading.mas_equalTo(segment.mas_trailing).offset(offset);
        }];
    } else {
        [segment mas_makeConstraints:^(MASConstraintMaker *make) {
            segment.msc_trailing = make.trailing.mas_greaterThanOrEqualTo(segment.msc_edgeInsets.right);
        }];
    }
    
    if(animated) {
        [UIView animateWithDuration:.35 animations:^{
            [self layoutIfNeeded];
        }];
    }
}

- (void)removeFirstSegmentAnimated:(BOOL)animated {
    [self removeSegmentAtIndex:self.segments.count - 1 animated:animated];
}

- (void)removeLastSegmentAnimated:(BOOL)animated {
    [self removeSegmentAtIndex:0 animated:animated];
}

- (void)removeSegmentAtIndex:(NSUInteger)index animated:(BOOL)animated {
    if(index >= self.segments.count) {
        return;
    }
    
    UIView<MSCSegmentProtocol> *segment = self.segments[index];
    
    UIView<MSCSegmentProtocol> *lastSegment = nil;
    if(index) {
        lastSegment = self.segments[index - 1];
    }
    
    UIView<MSCSegmentProtocol> *nextSegment = nil;
    if(index + 1 < self.segments.count) {
        nextSegment = self.segments[index + 1];
    }
    
    [self.segmentsM removeObject:segment];
    [segment removeFromSuperview];
    
    if(lastSegment && nextSegment) {
        [segment.msc_leading uninstall];
        segment.msc_leading = nil;
        
        [nextSegment.msc_leading uninstall];
        nextSegment.msc_leading = nil;
        
        CGFloat offset = lastSegment.msc_edgeInsets.right + nextSegment.msc_edgeInsets.left;
        [nextSegment mas_makeConstraints:^(MASConstraintMaker *make) {
            nextSegment.msc_leading = make.leading.mas_equalTo(lastSegment.mas_trailing).offset(offset);
        }];
    } else if(lastSegment) {
        [segment.msc_leading uninstall];
        segment.msc_leading = nil;
        
        [lastSegment mas_makeConstraints:^(MASConstraintMaker *make) {
            lastSegment.msc_trailing = make.trailing.mas_greaterThanOrEqualTo(lastSegment.msc_edgeInsets.right);
        }];
    } else if(nextSegment) {
        [nextSegment.msc_leading uninstall];
        nextSegment.msc_leading = nil;
        
        [nextSegment mas_makeConstraints:^(MASConstraintMaker *make) {
            nextSegment.msc_leading = make.leading.mas_equalTo(nextSegment.msc_edgeInsets.left);
        }];
    }
    
    if(animated) {
        [UIView animateWithDuration:.35 animations:^{
            [self layoutIfNeeded];
        }];
    }
}

- (void)removeAllSegments {
    [self.segments makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.segmentsM removeAllObjects];
}

- (void)insertDivider:(UIView<MSCDividerProtocol> *)divider atIndex:(NSUInteger)index animated:(BOOL)animated {
    
}

#pragma mark - Private Method

@end
