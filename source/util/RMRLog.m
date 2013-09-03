//
//  RMRLog.m
//
//  Created by Roland Rabien on 2013-06-04.
//  Copyright (c) 2013 Roland Rabien. All rights reserved.
//

#import "RMRLog.h"
#import "RMRDefaults.h"
#import <string.h>

static FILE* fp = NULL;
static NSString* syncer = @"mutex";

void RMRLogOpen()
{
    if (!fp)
    {
        NSString* path = [[RMRDefaults logDir] stringByAppendingPathComponent:@"log.txt"];
        fp = fopen([path UTF8String], "a");
    }
}

void RMRLogClose()
{
    if (fp)
    {
        fclose(fp);
        fp = NULL;
    }
}

void RMRLogClear()
{
    NSString* path = [[RMRDefaults logDir] stringByAppendingPathComponent:@"log.txt"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

void RMRLog(NSString* format, ...)
{
    va_list argList;
    va_start(argList, format);
    NSString* formattedMessage = [[NSString alloc] initWithFormat: format arguments: argList];
    va_end(argList);
    NSLog(@"%@", formattedMessage);
    
    @synchronized(syncer)
    {
        if (fp)
        {
            time_t rawtime;
            struct tm* timeinfo;
            
            time(&rawtime);
            timeinfo = localtime(&rawtime);
            
            char* tstr = asctime(timeinfo);
            char* n = strchr(tstr, '\n');
            if (n)
                *n = 0;
            
            fprintf(fp, "%s %s\n", tstr, [formattedMessage UTF8String]);
            fflush(fp);
        }
    }
}