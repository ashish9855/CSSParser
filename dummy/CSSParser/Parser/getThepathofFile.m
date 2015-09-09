//
//  getThepathofFile.m
//  dummy
//
//  Created by Ashish Maheshwari on 5/1/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "getThepathofFile.h"

@implementation getThepathofFile

+(NSURL *)getThePathOfFile:(NSString *)nameOfFile ofType:(NSString *)fileType{
    
    NSString *pathOfCSS = [[NSBundle mainBundle] pathForResource:nameOfFile ofType:fileType];
    return [NSURL fileURLWithPath:pathOfCSS];
}

@end
