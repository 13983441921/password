//
//  MNLib.h
//  地图新闻
//
//  Created by lichen on 4/11/14.
//  Copyright (c) 2014 lichen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^VoidBlock)();

@interface MNLib : NSObject

+(void)showTitle:(NSString *)strTitle message:(NSString *)strMessage buttonName:(NSString *)strButtonName;
+(BOOL)dictionary:(NSDictionary *)dict hasKeys:(NSArray *)array;

+(void)showTitle:(NSString *)strTitle message:(NSString *)strMessage delayTime:(float)delayTime completion:(VoidBlock)completion;


/**
 *	@brief	延迟delayTime的时候再做某事
 *
 *	@param 	delayTime 	延迟时间
 *	@param 	something 	需要做的事的块
 */
+ (void)delay:(float)delayTime doSomething:(VoidBlock)something;

//用user default设置NSString
+(void)setValue:(NSString *)strValue key:(NSString *)strKey;
+(NSString *)getValueByKey:(NSString *)strKey;

+(void)setObject:(id)obj key:(NSString *)strKey;
+(id)getObjByKey:(NSString *)strKey;

//用user default存转成nsdata的
+(void)setObjectWithNSDataFormat:(id)obj key:(NSString *)strKey;
+(id)getObjWithNSDataFormatByKey:(NSString *)strKey;

//用user default设置bool
+(void)setBOOL:(BOOL)bValue key:(NSString *)strKey;
+(BOOL)getBOOLByKey:(NSString *)strKey;

//十六制颜色转UIColor
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
+(UIColor *) hexStringToColor: (NSString *) stringToConvert withAlpha:(float)fAlpha;

@end
