//
//  ArthurStringAndObject.m
//  ArthurLib
//
//  Created by lichen on 5/20/14.
//  Copyright (c) 2014 codoon. All rights reserved.
//

#import "ArthurStringAndObject.h"
#import "Base64.h"

@implementation ArthurStringAndObject

+ (NSString *)encodeFromObject:(id)obj
{
    NSData *dataStart = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSString *strEncoded = [dataStart base64EncodedString];
    return strEncoded;
}

+ (id)decodeFromString:(NSString *)str
{
    NSData *dataEnd = [NSData dataWithBase64EncodedString:str];
    id obj = [NSKeyedUnarchiver unarchiveObjectWithData:dataEnd];
    return obj;
}

@end
