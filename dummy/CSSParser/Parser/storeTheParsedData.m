//
//  storeTheParsedData.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/27/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "storeTheParsedData.h"

@implementation storeTheParsedData

+ (id)sharedManager {
    static storeTheParsedData *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        [sharedMyManager allocateObjects];
    });
    return sharedMyManager;
}

-(void)allocateObjects{
    
    self.storeAllTheVariables=[NSMutableArray new];
    self.storeAllSeperatedTokens=[NSMutableArray new];
}

@end
