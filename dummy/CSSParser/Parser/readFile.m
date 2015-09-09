//
//  readFile.m
//  dummy
//
//  Created by Ashish Maheshwari on 5/1/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "readFile.h"
#import "storeTheParsedData.h"
#import "scanner.h"

@implementation readFile

{
    storeTheParsedData *storeData;
    NSString * stringCSSromFileAtURL;
    scanner *scan;
}

-(void)readFile:(NSURL *)pathOfTheFile{
    
    // allocate the singleton class
    storeData=[storeTheParsedData sharedManager];
    
    NSError *error;
    stringCSSromFileAtURL = [[NSString alloc]
                             initWithContentsOfURL:pathOfTheFile
                             encoding:NSUTF8StringEncoding
                             error:&error];
    if (stringCSSromFileAtURL == nil || [stringCSSromFileAtURL isEqualToString:@""]) {
        
    }
    else{
        
        if(error==nil){
            // scan the file for the characters
            
            scan=[[scanner alloc]init];
            [scan scanTheStringForTheCharacters:stringCSSromFileAtURL];
        }
    }
}

@end
