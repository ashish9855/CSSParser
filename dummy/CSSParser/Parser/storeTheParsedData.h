//
//  storeTheParsedData.h
//  dummy
//
//  Created by Ashish Maheshwari on 4/27/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface storeTheParsedData : NSObject

@property(nonatomic,retain)NSMutableArray *storeAllTheVariables;
@property(nonatomic,retain)NSMutableArray *storeAllSeperatedTokens;
@property(nonatomic,retain)NSString       *storeStringOfTheFile;

+ (id)sharedManager;

@end
