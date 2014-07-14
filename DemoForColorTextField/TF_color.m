//
//  TF_color.m
//  DemoForColorTextField
//
//  Created by darklinden on 14-7-14.
//  Copyright (c) 2014年 darklinden. All rights reserved\
//

#import "TF_color.h"

#define NUM_COLOR [UIColor redColor]
#define LCHAR_COLOR [UIColor colorWithRed:0.f/255.f green:128.f/255.f blue:128.f/255.f alpha:1.f]
#define UCHAR_COLOR [UIColor blueColor]
#define SCHAR_COLOR [UIColor colorWithRed:94.f/255.f green:38.f/255.f blue:102.f/255.f alpha:1.f]
#define OTHER_COLOR [UIColor darkGrayColor]

@implementation TF_color

- (void)setColorText:(NSString *)text font:(UIFont *)font
{
    if (!text.length) {
        [super setText:@""];
        return;
    }
    
    if (!font) {
        font = [UIFont systemFontOfSize:12.f];
    }
    
    NSString *tmp_text = [text copy];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSUInteger position = 0;
    while (tmp_text.length) {
        NSString *tmp = [tmp_text substringToIndex:1];
        NSDictionary *dict = [self attrForText:tmp font:font];
        [att setAttributes:dict range:NSMakeRange(position, 1)];
        
        if (tmp_text.length > 1) {
            position++;
            tmp_text = [tmp_text substringFromIndex:1];
        }
        else {
            tmp_text = @"";
        }
    }
    
    [self setAttributedText:att];
}

- (NSDictionary *)attrForText:(NSString *)text font:(UIFont *)font
{
    const NSString *num = @"0123456789";
    const NSString *lchars = @"abcdefghijklmnopqrstuvwxyz";
    const NSString *uchars = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const NSString *schars = @"!@#$%^&*()_+-=`~[]\{}|;':\",./<>?";
    
    UIColor *color = OTHER_COLOR;
    if ([num rangeOfString:text options:NSLiteralSearch].location != NSNotFound) {
        color = NUM_COLOR;
    }
    else if ([lchars rangeOfString:text options:NSLiteralSearch].location != NSNotFound) {
        color = LCHAR_COLOR;
    }
    else if ([uchars rangeOfString:text options:NSLiteralSearch].location != NSNotFound) {
        color = UCHAR_COLOR;
    }
    else if ([schars rangeOfString:text options:NSLiteralSearch].location != NSNotFound) {
        color = SCHAR_COLOR;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:color forKey:NSForegroundColorAttributeName];
    [dict setObject:font forKey:NSFontAttributeName];
    
    return dict;
}

@end
