//
//  NSAttributedString+GGChart.m
//  GGCharts
//
//  Created by 黄舜 on 17/9/21.
//  Copyright © 2017年 I really is a farmer. All rights reserved.
//

#import "NSAttributedString+GGChart.h"

@interface NSMutableAttributedString (GGChart)

@end

@implementation NSMutableAttributedString (GGChart)

- (void)setText:(NSString *)text color:(UIColor *)color font:(UIFont *)font
{
    NSRange range = [self.string rangeOfString:text];
    
    [self addAttribute:NSForegroundColorAttributeName  //文字颜色
                 value:color
                 range:range];
    
    [self addAttribute:NSFontAttributeName             //文字字体
                 value:font
                 range:range];
}

@end

@implementation NSAttributedString (GGChart)

/**
 * 扇形事例图富文本字符串样式
 *
 * @param name 扇形图名字
 * @param nameColor 颜色
 * @param title 扇形图说明
 * @param fractional 分数
 *
 * @return 富文本字符串
 */
+ (NSAttributedString *)pieChartWeightAttributeStringWith:(NSString *)name nameColor:(UIColor *)nameColor title:(NSString *)title fractional:(NSString *)fractional
{
    NSString * string = [NSString stringWithFormat:@"%@%@\n%@", name, fractional, title];
    NSMutableAttributedString * attrbuteString = [[NSMutableAttributedString alloc] initWithString:string];
    [attrbuteString setText:name color:nameColor font:[UIFont systemFontOfSize:15]];
    [attrbuteString setText:fractional color:C_HEX(0x767676) font:[UIFont systemFontOfSize:8]];
    [attrbuteString setText:title color:C_HEX(0x343843) font:[UIFont systemFontOfSize:11]];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paraStyle.lineSpacing = 5;
    [attrbuteString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, string.length)];
    
    return attrbuteString;
}

/**
 * 扇形事例图富文本字符串样式
 *
 * @param largeString 大字符
 * @param smallString 小字符
 *
 * @return 富文本字符串
 */
+ (NSAttributedString *)pieInnerStringWithLargeString:(NSString *)largeString smallString:(NSString *)smallString
{
    NSString * string = [NSString stringWithFormat:@"%@%@", largeString, smallString];
    NSMutableAttributedString * attrbuteString = [[NSMutableAttributedString alloc] initWithString:string];
    [attrbuteString setText:largeString color:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:20]];
    [attrbuteString setText:smallString color:[UIColor whiteColor] font:[UIFont systemFontOfSize:12]];
    
    return attrbuteString;
}

@end
