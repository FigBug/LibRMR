//
//  RMRDefaults.h
//
//  Created by Roland Rabien on 12-07-12.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#define RMRDefaultsBoolForKey(key) [RMRDefaults boolForKey: key defaultValue: key##Default]
#define RMRDefaultsIntegerForKey(key) [RMRDefaults integerForKey: key defaultValue: key##Default]
#define RMRDefaultsStringArrayForKey(key) [RMRDefaults stringArrayForKey: key defaultValue: key##Default]
#define RMRDefaultsObjectForKey(key) [RMRDefaults objectForKey: key defaultValue: key##Default]
#define RMRDefaultsStringForKey(key) [RMRDefaults stringForKey: key defaultValue: key##Default]
#define RMRDefaultsDoubleForKey(key) [RMRDefaults doubleForKey: key defaultValue: key##Default]

#define RMRDefaultsSetBoolForKey(key, value) [RMRDefaults setBool: value forKey: key];
#define RMRDefaultsSetIntegerForKey(key, value) [RMRDefaults setInteger: value forKey: key];
#define RMRDefaultsSetStringArrayForKey(key, value) [RMRDefaults setObject: value forKey: key];
#define RMRDefaultsSetObjectForKey(key, value) [RMRDefaults setObject: value forKey: key];
#define RMRDefaultsSetStringForKey(key, value) [RMRDefaults setObject: value forKey: key];
#define RMRDefaultsSetDoubleForKey(key, value) [RMRDefaults setDouble: value forKey: key];

#define RMRDefaultsSetBoolToDefault(key) [RMRDefaults ifUnsetSetBool:key##Default forKey:key];
#define RMRDefaultsSetIntegerToDefault(key) [RMRDefaults ifUnsetSetInteger:key##Default forKey:key];
#define RMRDefaultsSetStringToDefault(key) [RMRDefaults ifUnsetSetObject:key##Default forKey:key];
#define RMRDefaultsSetObjectToDefault(key) [RMRDefaults ifUnsetSetObject:key##Default forKey:key];
#define RMRDefaultsSetStringArrayToDefault(key) [RMRDefaults ifUnsetSetObject:key##Default forKey:key];
#define RMRDefaultsSetDoubleToDefault(key) [RMRDefaults ifUnsetSetDouble:key##Default forKey:key];


@interface RMRDefaults : NSObject

+ (BOOL)boolForKey:(NSString*)key defaultValue:(BOOL)def;
+ (NSInteger)integerForKey:(NSString*)key defaultValue:(NSInteger)def;
+ (NSArray*)stringArrayForKey:(NSString*)key defaultValue:(NSArray*)def;
+ (id)objectForKey:(NSString*)key defaultValue:(id)def;
+ (NSString*)stringForKey:(NSString*)key defaultValue:(NSString*)def;
+ (double)doubleForKey:(NSString*)key defaultValue:(double)def;

+ (void)setBool:(BOOL)value forKey:(NSString*)defaultName;
+ (void)setInteger:(NSInteger)value forKey:(NSString*)defaultName;
+ (void)setObject:(NSObject*)value forKey:(NSString*)defaultName;
+ (void)setDouble:(double)value forKey:(NSString*)defaultName;

+ (void)ifUnsetSetBool:(BOOL)value forKey:(NSString*)key;
+ (void)ifUnsetSetInteger:(NSInteger)value forKey:(NSString*)key;
+ (void)ifUnsetSetObject:(NSObject*)value forKey:(NSString*)key;
+ (void)ifUnsetSetDouble:(double)value forKey:(NSString*)key;

+ (NSString*)namedDir:(NSString*)name;
+ (NSString*)settingsDir;
+ (NSString*)logDir;

@end
