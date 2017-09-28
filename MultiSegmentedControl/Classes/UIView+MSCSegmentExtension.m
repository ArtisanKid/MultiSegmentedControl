//
//  UIView+MSCSegmentExtension.m
//  Masonry
//
//  Created by 李翔宇 on 2017/9/28.
//

#import "UIView+MSCSegmentExtension.h"
#import <objc/runtime.h>

static const void * const UIView_MSCSegmentExtension_Leading_Key = &UIView_MSCSegmentExtension_Leading_Key;
static const void * const UIView_MSCSegmentExtension_Trailing_Key = &UIView_MSCSegmentExtension_Trailing_Key;

@implementation UIView (MSCSegmentExtension)

- (MASConstraint *)msc_leading {
    return objc_getAssociatedObject(self, UIView_MSCSegmentExtension_Leading_Key);
}

- (void)setMsc_leading:(MASConstraint *)msc_leading {
    objc_setAssociatedObject(self, UIView_MSCSegmentExtension_Leading_Key, msc_leading, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MASConstraint *)msc_trailing {
    return objc_getAssociatedObject(self, UIView_MSCSegmentExtension_Trailing_Key);
}

- (void)setMsc_trailing:(MASConstraint *)msc_trailing {
    objc_setAssociatedObject(self, UIView_MSCSegmentExtension_Trailing_Key, msc_trailing, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
