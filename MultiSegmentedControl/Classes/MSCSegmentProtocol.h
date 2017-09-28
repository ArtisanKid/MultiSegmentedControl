//
//  MSCSegmentProtocol.h
//  MultiSegmentedControl
//
//  Created by 李翔宇 on 2017/9/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MSCSegmentProtocol <NSObject>

@property (nonatomic, assign, readonly) CGSize msc_size;
@property (nonatomic, assign, readonly) UIEdgeInsets msc_edgeInsets;

@end
