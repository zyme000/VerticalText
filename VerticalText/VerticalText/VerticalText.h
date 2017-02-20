/**
 *  文件名：VerticalText.h
 *  工程名：VerticalText
 *
 *  Created by 赵洋 on 16/8/26.
 *  Copyright © zy. All Rights Reserved.
 *
 *  修改记录：(仅记录功能修改)
 */

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LeftTop,
    LeftMiddle,
    LeftBottom,
    MiddleTop,
    MiddleMiddle,
    MiddleBottom,
    RightTop,
    RightMiddle,
    RightBottom,
}LayoutStyle_VerticalText;

typedef enum : NSUInteger {
    FromLeftToRight,
    FromRightToLeft
} OrderStyle_VerticalText;

@interface VerticalText : UIView

/*** 文字属性 ***/
@property (nonatomic, strong) NSDictionary *attributes;
/*** 需要展示的文字 ***/
@property (nonatomic, copy) NSString *strShowText;
/*** 对其方式 ***/
@property (nonatomic, assign) LayoutStyle_VerticalText layoutStyle;
/*** 文字从左到右/从右到左 ***/
@property (nonatomic, assign) OrderStyle_VerticalText orderStyle;
@end
