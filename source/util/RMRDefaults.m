//
//  RMRDefaults.m
//
//  Created by Roland Rabien on 12-07-12.
//  Copyright (c) 2012 Roland Rabien. All rights reserved.
//

#import "RMRDefaults.h"

@implementation RMRDefaults

+ (BOOL)boolForKey:(NSString*)key defaultValue:(BOOL)def
{
    NSObject* res = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (res == nil)
        return def;
    else
        return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

+ (NSInteger)integerForKey:(NSString*)key defaultValue:(NSInteger)def
{
    NSObject* res = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (res == nil)
        return def;
    else
        return [[NSUserDefaults standardUserDefaults] integerForKey:key];
}

+ (NSArray*)stringArrayForKey:(NSString*)key defaultValue:(NSArray*)def
{
    NSObject* res = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (res == nil)
        return def;
    else
        return [[NSUserDefaults standardUserDefaults] arrayForKey:key];
}

+ (id)objectForKey:(NSString*)key defaultValue:(id)def
{
    NSObject* res = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (res == nil)
        return def;
    else
        return res;
}

+ (NSString*)stringForKey:(NSString*)key defaultValue:(NSString*)def
{
    NSObject* res = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (res == nil)
        return def;
    else
        return [[NSUserDefaults standardUserDefaults] stringForKey:key];    
}

+ (double)doubleForKey:(NSString*)key defaultValue:(double)def
{
    NSObject* res = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (res == nil)
        return def;
    else
        return [[NSUserDefaults standardUserDefaults] doubleForKey:key];
}

+ (void)setBool:(BOOL)value forKey:(NSString*)defaultName
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString*)defaultName
{
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setObject:(NSObject*)value forKey:(NSString*)defaultName
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)setDouble:(double)value forKey:(NSString*)defaultName
{
    [[NSUserDefaults standardUserDefaults] setDouble:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString*)createSpecialDir:(NSString*)dir
{
    NSArray* documentDirList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* res = [[documentDirList objectAtIndex:0] stringByAppendingPathComponent:dir];
    
    [[NSFileManager defaultManager] createDirectoryAtPath:res withIntermediateDirectories:NO attributes:nil error:nil];
    
    return res;
}

+ (NSString*)namedDir:(NSString*)name
{
    return [RMRDefaults createSpecialDir:name];
}

+ (NSString*)settingsDir
{
    return [RMRDefaults createSpecialDir:@"settings"];
}

+ (NSString*)logDir
{
    return [RMRDefaults createSpecialDir:@"logs"];
}

@end
