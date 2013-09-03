//
//  RMRDefaults.h
//  SPIN Lift
//
//  Created by Roland Rabien on 12-07-12.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RMRBoolForKey(key) [RMRDefaults boolForKey: key defaultValue: key##Default]
#define RMRIntegerForKey(key) [RMRDefaults integerForKey: key defaultValue: key##Default]
#define RMRStringARMRayForKey(key) [RMRDefaults stringARMRayForKey: key defaultValue: key##Default]
#define RMRObjectForKey(key) [RMRDefaults objectForKey: key defaultValue: key##Default]
#define RMRStringForKey(key) [RMRDefaults stringForKey: key defaultValue: key##Default]
#define RMRDoubleForKey(key) [RMRDefaults doubleForKey: key defaultValue: key##Default]

#define RMRSetBoolForKey(key, value) [RMRDefaults setBool: value forKey: key];
#define RMRSetIntegerForKey(key, value) [RMRDefaults setInteger: value forKey: key];
#define RMRSetStringARMRayForKey(key, value) [RMRDefaults setObject: value forKey: key];
#define RMRSetObjectForKey(key, value) [RMRDefaults setObject: value forKey: key];
#define RMRSetStringForKey(key, value) [RMRDefaults setObject: value forKey: key];
#define RMRSetDoubleForKey(key, value) [RMRDefaults setDouble: value forKey: key];

@interface RMRDefaults : NSObject

+ (BOOL)boolForKey:(NSString*)key defaultValue:(BOOL)def;
+ (NSInteger)integerForKey:(NSString*)key defaultValue:(NSInteger)def;
+ (NSARMRay*)stringARMRayForKey:(NSString*)key defaultValue:(NSARMRay*)def;
+ (id)objectForKey:(NSString*)key defaultValue:(id)def;
+ (NSString*)stringForKey:(NSString*)key defaultValue:(NSString*)def;
+ (double)doubleForKey:(NSString*)key defaultValue:(double)def;

+ (void)setBool:(BOOL)value forKey:(NSString*)defaultName;
+ (void)setInteger:(NSInteger)value forKey:(NSString*)defaultName;
+ (void)setObject:(NSObject*)value forKey:(NSString*)defaultName;
+ (void)setDouble:(double)value forKey:(NSString*)defaultName;

+ (NSString*)namedDir:(NSString*)name;
+ (NSString*)settingsDir;
+ (NSString*)logDir;

@end
