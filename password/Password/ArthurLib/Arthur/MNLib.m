//
//  MNLib.m
//  地图新闻
//
//  Created by lichen on 4/11/14.
//  Copyright (c) 2014 lichen. All rights reserved.
//

#import "MNLib.h"

@implementation MNLib

+(void)showTitle:(NSString *)strTitle message:(NSString *)strMessage buttonName:(NSString *)strButtonName
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle
                                                    message:strMessage
                                                   delegate:nil
                                          cancelButtonTitle:strButtonName
                                          otherButtonTitles:nil];
    [alert show];
}

+(void)showTitle:(NSString *)strTitle message:(NSString *)strMessage delayTime:(float)delayTime completion:(VoidBlock)completion
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle
                                                    message:strMessage
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil];
    [alert show];
    
    //很牛逼的NSTimer的block用法
    [NSTimer scheduledTimerWithTimeInterval:delayTime
                                     target:[NSBlockOperation blockOperationWithBlock:^{
        if (completion) {
            completion();
        }
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    }]
                                   selector:@selector(main)
                                   userInfo:nil
                                    repeats:NO
     ];
}

+(BOOL)dictionary:(NSDictionary *)dict hasKeys:(NSArray *)arrKeys
{
    for (int index = 0; index < [arrKeys count]; index++) {
        if (![dict objectForKey:arrKeys[index]]) {
            return NO;
        }
    }
    return YES;
}

+ (void)delay:(float)delayTime doSomething:(VoidBlock)something
{
    [NSTimer scheduledTimerWithTimeInterval:delayTime
                                     target:[NSBlockOperation blockOperationWithBlock:^{
        something();
    }]
                                   selector:@selector(main)
                                   userInfo:nil
                                    repeats:NO
     ];
}

+(void)setValue:(NSString *)strValue key:(NSString *)strKey
{
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [setting removeObjectForKey:strKey];
    [setting setObject:strValue forKey:strKey];
    [setting synchronize];
}

+(NSString *)getValueByKey:(NSString *)strKey
{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    NSString *value = [setting objectForKey:strKey];
    if (value && [value isEqualToString:@""] == NO){
        return value;
    }else{
        return nil;
    }
}

+(void)setObject:(id)obj key:(NSString *)strKey
{
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [setting removeObjectForKey:strKey];
    [setting setObject:obj forKey:strKey];
    [setting synchronize];
}

+(id)getObjByKey:(NSString *)strKey
{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    return [setting objectForKey:strKey];
}

+(void)setObjectWithNSDataFormat:(id)obj key:(NSString *)strKey
{
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [setting removeObjectForKey:strKey];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:obj];    
    [setting setObject:data forKey:strKey];
    [setting synchronize];
}

+(id)getObjWithNSDataFormatByKey:(NSString *)strKey
{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    NSData *data = [setting objectForKey:strKey];
    if (data){
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }else{
        return nil;
    }
}

+(void)setBOOL:(BOOL)bValue key:(NSString *)strKey
{
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [setting removeObjectForKey:strKey];
    if (bValue) {
        [setting setObject:strKey forKey:strKey];
    }
    [setting synchronize];
}

+(BOOL)getBOOLByKey:(NSString *)strKey
{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    NSString *value = [setting objectForKey:strKey];
    if (value && [value isEqualToString:@""] == NO){
        return YES;
    }else{
        return NO;
    }
}

+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+(UIColor *) hexStringToColor: (NSString *) stringToConvert withAlpha:(float)fAlpha
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:fAlpha];
}

@end
