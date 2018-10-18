//
//  KTDatePicker.m
//  KTPicker
//
//  Created by Ki on 2018/8/6.
//  Copyright © 2018年 Ki. All rights reserved.
//

#import "KTDatePicker.h"
#import <objc/runtime.h>

@implementation KTDatePicker

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    //self.backgroundColor = UIColor.lightGrayColor;
    unsigned int outCount;
    int i;
    objc_property_t * property = class_copyPropertyList([UIDatePicker class], &outCount);
    for (i = outCount - 1; i >=  0; i --) {
        //         循环获取属性的名字   property_getName函数返回一个属性的名称
        
        NSString *getPropertyName = [NSString stringWithCString:property_getName(property[i]) encoding:NSUTF8StringEncoding];
        
        NSString *getPropertyNameString = [NSString stringWithCString:property_getAttributes(property[i]) encoding:NSUTF8StringEncoding];
        if([getPropertyName isEqualToString:@"textColor"]){
            [self setValue:[UIColor blackColor] forKey:@"textColor"];
        }
        
        if([getPropertyName isEqualToString:@"textShadowColor"]){
            [self setValue:[UIColor redColor] forKey:@"textColor"];
        }
        NSLog(@"<%@> ##<%@>",getPropertyNameString,getPropertyName);
    }
    
    SEL selector = NSSelectorFromString(@"setHighlightsToday:");
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDatePicker instanceMethodSignatureForSelector:selector]];
    BOOL no = NO;
    [invocation setSelector:selector];
    [invocation setArgument:&no atIndex:2];
    [invocation invokeWithTarget:self];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    self.locale = locale;
    NSDate *localDate = [NSDate date];
    NSCalendar *gregorion = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];

    //设置时间
    [offsetComponents setYear:20];
    [offsetComponents setMonth:0];
    [offsetComponents setDay:0];

    //设置最大的时间
    NSDate * maxDate = [gregorion dateByAddingComponents:offsetComponents toDate:localDate options:0];
    self.maximumDate = maxDate;
    //设置日期的显示格式
    self.datePickerMode = UIDatePickerModeDate;
    
}













@end
