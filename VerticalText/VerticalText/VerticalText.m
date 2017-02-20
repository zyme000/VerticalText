/**
 *  文件名：VerticalText.m
 *  工程名：VerticalText
 *
 *  Created by 赵洋 on 16/8/26.
 *  Copyright © 2016 zy. All Rights Reserved.
 *
 *  修改记录：(仅记录功能修改)
 */

#import "VerticalText.h"
@interface VerticalText()

@property (nonatomic, strong) NSMutableArray *arrayHeights;
@property (nonatomic, assign) CGFloat floatTextWidth;

@end
@implementation VerticalText

- (void)drawRect:(CGRect)rect
{
    if (!_strShowText) {
        return;
    }
    _arrayHeights = [NSMutableArray array];
    
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat fontSize = (_attributes ? (_attributes[NSFontAttributeName] ? ((UIFont *)_attributes[NSFontAttributeName]).pointSize : 17) : 17) + 1;
    
    NSMutableParagraphStyle*style = [[NSMutableParagraphStyle alloc]init];
    style.alignment=NSTextAlignmentCenter;
    
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSParagraphStyleAttributeName] = style;
    if (_attributes) {
        [att addEntriesFromDictionary:_attributes];
    }
    att[NSFontAttributeName] = [UIFont systemFontOfSize:fontSize - 1];
    
    
    //记录每一行的长度
    for (int i = 0 ; i < _strShowText.length; i ++) {
        if ((x + fontSize) > self.frame.size.width) {
            _floatTextWidth = x;
            break;
        }
        
        NSString *strSingle = [_strShowText substringWithRange:NSMakeRange(i, 1)];
        if ([strSingle isEqualToString:@"\n"]) {
            x += fontSize;
            [_arrayHeights addObject:@(y)];
            y = 0;
            continue;
        }
        
        if ((y + fontSize) > self.frame.size.height ) {
            x += fontSize;
            [_arrayHeights addObject:@(y)];
            y = 0;
        }
        
        if (i == _strShowText.length - 1) {
            _floatTextWidth = x + fontSize;
            [_arrayHeights addObject:@(y + fontSize)];
        }
        
        y += fontSize;
    }
    
    
    NSLog(@"%@", _arrayHeights);
    NSLog(@"%lf", _floatTextWidth);
    
    if (_orderStyle == FromLeftToRight) {
        [self pr_fromLeftToRightDrawWithFontSize:fontSize attributes:att];
    } else {
        [self pr_fromRightToLeftDrawWithFontSize:fontSize attributes:att];
    }
    
    
    
}

- (void)pr_fromLeftToRightDrawWithFontSize:(CGFloat)fontSize attributes:(NSDictionary *)att {
    NSArray *array = @[@"0", @"0.5", @"1"];
    
    CGFloat floatY = [array[_layoutStyle % 3] floatValue];
    CGFloat floatX = [array[_layoutStyle / 3] floatValue];
    
    NSInteger row = 0;
    CGFloat x = (self.frame.size.width - _floatTextWidth) * floatX;
    CGFloat y = (self.frame.size.height - [_arrayHeights[row] integerValue]) * floatY;
    for (int i = 0 ; i < _strShowText.length; i ++) {
        if ((x + fontSize) > self.frame.size.width) {
            return;
        }
        
        
        NSString *strSingle = [_strShowText substringWithRange:NSMakeRange(i, 1)];
        if ([strSingle isEqualToString:@"\n"]) {
            x += fontSize;
            row ++;
            if (row < _arrayHeights.count) {
                y = (self.frame.size.height - [_arrayHeights[row] integerValue]) * floatY;
            }
            continue;
        }
        
        if ((y + fontSize) > self.frame.size.height ) {
            x += fontSize;
            row ++;
            if (row < _arrayHeights.count) {
                y = (self.frame.size.height - [_arrayHeights[row] integerValue]) * floatY;
            }
        }
        
        [strSingle drawInRect:CGRectMake(x, y, fontSize, fontSize) withAttributes:att];
        y += fontSize;
    }
    
}

- (void)pr_fromRightToLeftDrawWithFontSize:(CGFloat)fontSize attributes:(NSDictionary *)att {
    
    NSArray *array = @[@"0", @"0.5", @"1"];
    
    CGFloat floatY = [array[_layoutStyle % 3] floatValue];
    CGFloat floatX = [array[_layoutStyle / 3] floatValue];
    
    
    
    NSInteger row = 0;
    CGFloat x = (self.frame.size.width - _floatTextWidth) * floatX + _floatTextWidth - fontSize;
    CGFloat y = (self.frame.size.height - [_arrayHeights[row] integerValue]) * floatY;
    CGFloat minX = (self.frame.size.width - _floatTextWidth) * floatX;
    for (int i = 0 ; i < _strShowText.length; i ++) {
        if (x < minX) {
            return;
        }
        
        NSString *strSingle = [_strShowText substringWithRange:NSMakeRange(i, 1)];
        if ([strSingle isEqualToString:@"\n"]) {
            x -= fontSize;
            row ++;
            if (row < _arrayHeights.count) {
                y = (self.frame.size.height - [_arrayHeights[row] integerValue]) * floatY;
            }
            continue;
        }
        
        if ((y + fontSize) > self.frame.size.height ) {
            x -= fontSize;
            row ++;
            if (row < _arrayHeights.count) {
                y = (self.frame.size.height - [_arrayHeights[row] integerValue]) * floatY;
            }
        }
        
        [strSingle drawInRect:CGRectMake(x, y, fontSize, fontSize) withAttributes:att];
        y += fontSize;
    }
    
}


@end
