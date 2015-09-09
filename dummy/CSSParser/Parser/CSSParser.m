//
//  CSSParser.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/22/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "CSSParser.h"
#import "getThepathofFile.h"
#import "readFile.h"

@implementation CSSParser

-(void)initCSSstyleSheet:(NSString *)nameOfTheFile typeOfFile:(NSString *)fileType{
    
    @try {
        
        // get the data of the classes seperated
        /*
         -- .
         -- #
         -- h1,h2
         */
        
        
        // get the file path
        NSURL *filePath=[getThepathofFile getThePathOfFile:nameOfTheFile ofType:fileType];
 
        readFile *read =[readFile new];
        [read readFile:filePath];
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"%@",exception);
    }
}

-(void)mark:(UIButton *)btn{
    
    btn.backgroundColor=[UIColor blackColor];
}

@end
