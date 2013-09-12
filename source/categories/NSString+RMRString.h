//
//  NSMutableString+RMRString.h
//  RMR
//
//  Created by Roland Rabien on 2013-09-11.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RMRString)

- (NSString*)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet*)characterSet;
- (NSString*)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet*)characterSet;

- (NSString*)stringByTrimming;
- (NSString*)stringByTrimmingLeadingCharacters;
- (NSString*)stringByTrimmingTrailingCharacters;

@end
