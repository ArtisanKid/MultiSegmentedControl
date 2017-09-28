//
//  MSCSegmentedControl.h
//  MultiSegmentedControl
//
//  Created by 李翔宇 on 2017/9/27.
//

#import <UIKit/UIKit.h>
#import "MSCSegmentProtocol.h"
#import "MSCDividerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MSCSegmentedControl : UIView

- (instancetype)initWithSegments:(NSArray<UIView<MSCSegmentProtocol> *> *)segments NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong, readonly) NSArray<UIView<MSCSegmentProtocol> *> *segments;

- (void)addSegment:(UIView<MSCSegmentProtocol> *)segment animated:(BOOL)animated;
- (void)insertSegment:(UIView<MSCSegmentProtocol> *)segment atIndex:(NSUInteger)index animated:(BOOL)animated;

- (void)removeFirstSegmentAnimated:(BOOL)animated;
- (void)removeLastSegmentAnimated:(BOOL)animated;
- (void)removeSegmentAtIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)removeAllSegments;

- (void)insertDivider:(UIView<MSCDividerProtocol> *)divider atIndex:(NSUInteger)index animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
