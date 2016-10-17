//
//  TTButton.h
//  qianka
//
//  Created by TedTian on 2016/10/14.
//  Copyright © 2016年 xiaozi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TTButtonTitlePosition) {
    TTButtonTitlePositionDeflaut, //title at right,image is left
    TTButtonTitlePositionLeft, //title at left,image is right
    TTButtonTitlePositionTop,  //title at top,image is bottom
    TTButtonTitlePositionBottom//title at bottom,image is top
};

IB_DESIGNABLE
@interface TTButton : UIButton
//change the position of title
#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger titlePosition;
#else
@property (nonatomic) IBInspectable TTButtonTitlePosition titlePosition;
#endif
//the space of image and title


@property (nonatomic) IBInspectable CGFloat imageTitleSpace;
//make cornerRadius
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor * borderColor;

@end
