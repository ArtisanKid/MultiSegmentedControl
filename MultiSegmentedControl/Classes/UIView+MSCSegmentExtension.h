//
//  UIView+MSCSegmentExtension.h
//  Masonry
//
//  Created by 李翔宇 on 2017/9/28.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface UIView (MSCSegmentExtension)

@property (nonatomic, strong) MASConstraint *msc_leading;
@property (nonatomic, strong) MASConstraint *msc_trailing;

@end
