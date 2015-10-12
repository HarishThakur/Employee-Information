//
//  NSDictionary+JSONResult.m
//  Employee Information
//
//  Created by Harish Singh on 12/10/15.
//  Copyright (c) 2015 Sourcebits Technologies. All rights reserved.
//

#import "NSDictionary+JSONResult.h"

@implementation NSDictionary (JSONResult)

+(void) getJSONResult : (NSDictionary *) dictionaryData {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionaryData options:NSJSONWritingPrettyPrinted error:&error];

    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"Dictionary Result:\n%@",jsonString);
    }
}

@end
