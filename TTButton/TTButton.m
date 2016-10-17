//
//  TTButton.m
//  qianka
//
//  Created by TedTian on 2016/10/14.
//  Copyright © 2016年 xiaozi. All rights reserved.
//

#import "TTButton.h"

@implementation TTButton

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self setTitlePosition:_titlePosition];
}
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self setTitlePosition:_titlePosition];
}
- (void)setTitlePosition:(TTButtonTitlePosition)titlePosition
{
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
    
    _titlePosition = titlePosition;
    [self layoutIfNeeded];
    CGFloat imageWidth = CGRectGetWidth(self.imageView.frame);
    CGFloat titleWidth = CGRectGetWidth(self.titleLabel.frame);
    if (titleWidth == 0) {
        CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        titleWidth  = titleSize.width;
    }
    
    CGFloat titleTop = 0;
    CGFloat titleLeft = 0;
    CGFloat titleBottom = 0;
    CGFloat titleRight = 0;
    
    CGFloat imageTop = 0;
    CGFloat imageLeft = 0;
    CGFloat imageBottom = 0;
    CGFloat imageRight = 0;
    
    CGFloat space = 0.5 * _imageTitleSpace;
    
    switch (titlePosition) {
        case TTButtonTitlePositionDeflaut:
        {
            imageLeft = -space;
            imageRight = -imageLeft;
            titleRight = -space;
            titleLeft = -titleRight;
        }
            break;
        case TTButtonTitlePositionLeft:
        {
            imageLeft = space + titleWidth;
            imageRight = - imageLeft;
            titleLeft = -space - imageWidth;
            titleRight = - titleLeft;
        }
            break;
        case TTButtonTitlePositionTop:
        {
//            image居中
            CGFloat imageX = CGRectGetWidth(self.frame) * 0.5 - self.imageView.center.x;
            imageLeft = imageX;
            imageRight =  - imageLeft;
//            title居中
            CGFloat titleX = CGRectGetWidth(self.frame) * 0.5 - self.titleLabel.center.x;
            titleLeft = titleX;
            titleRight = - titleLeft;
//            把image和title看成整体，再居中
            CGFloat centerY = (CGRectGetHeight(self.imageView.frame) + CGRectGetHeight(self.titleLabel.frame)) * 0.5 + self.imageView.frame.origin.y;
            CGFloat imageY = CGRectGetHeight(self.frame)*0.5 - centerY;
            imageTop = imageY - space;
            imageBottom = - imageTop;
            
            CGFloat titleY = CGRectGetMaxY(self.imageView.frame) - self.titleLabel.frame.origin.y  + imageY;
            titleTop = titleY + space;
            titleBottom = -titleTop;
        }
            
            break;
        case TTButtonTitlePositionBottom:
        {
            //            image居中
            CGFloat imageX = CGRectGetWidth(self.frame) * 0.5 - self.imageView.center.x;
            imageLeft = imageX;
            imageRight =  - imageLeft;
            //            title居中
            CGFloat titleX = CGRectGetWidth(self.frame) * 0.5 - self.titleLabel.center.x;
            titleLeft = titleX;
            titleRight = - titleLeft;
            //            把image和title看成整体，再居中
            CGFloat centerY = (CGRectGetHeight(self.titleLabel.frame) + CGRectGetHeight(self.imageView.frame)) * 0.5 + self.titleLabel.frame.origin.y;
            CGFloat titleY = CGRectGetHeight(self.frame)*0.5 - centerY;
            titleTop = titleY - space;
            titleBottom = - titleTop;
            
            CGFloat imageY = CGRectGetMaxY(self.titleLabel.frame) - self.imageView.frame.origin.y + titleY;
            imageTop = imageY + space;
            imageBottom = - imageTop;
        }
            break;
        default:
            break;
    }
    [self setImageEdgeInsets:UIEdgeInsetsMake(imageTop, imageLeft, imageBottom, imageRight)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTop, titleLeft, titleBottom, titleRight)];
    
}
- (void)setImageTitleSpace:(CGFloat)imageTitleSpace
{
    _imageTitleSpace = imageTitleSpace;
    [self setTitlePosition:_titlePosition];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = [borderColor CGColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    if (borderWidth < 0) {
        self.layer.borderWidth = 0;
    }else
    {
        self.layer.borderWidth = borderWidth;
    }
}
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    if (cornerRadius<0) {
        
        self.layer.cornerRadius = cornerRadius;
    }else
    {
        self.layer.cornerRadius = cornerRadius;
    }
}

@end
