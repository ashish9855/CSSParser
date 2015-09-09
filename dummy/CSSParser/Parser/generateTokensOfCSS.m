//
//  generateTokensOfCSS.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/27/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "generateTokensOfCSS.h"

@interface generateTokensOfCSS()

- (void)generateTokensfromTheFile;

@end

@implementation generateTokensOfCSS

@synthesize storeData;


-(void)generateTokensfromTheFile{
    
    createTokensOfTheFile=[NSMutableArray new];
    storeData=[storeTheParsedData sharedManager];
    
    NSScanner *theScanner = [NSScanner scannerWithString:storeData.storeStringOfTheFile];
    
    NSString *ClassOfCSS;
    
    while ([theScanner isAtEnd] == NO) {
        
        // scan the characters
        [theScanner scanUpToString:@"}" intoString:&ClassOfCSS];
        //[theScanner scanUpToString:@"}" intoString:&ClassOfCSS];
        [theScanner setScanLocation: [theScanner scanLocation]+1];
        
        // Include . and brancket
        ClassOfCSS=[ClassOfCSS stringByReplacingOccurrencesOfString:@" " withString:@""];
        ClassOfCSS=[ClassOfCSS stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        ClassOfCSS=[ClassOfCSS stringByAppendingString:@"}"];
        
        // Add the class to the array
        [createTokensOfTheFile addObject:ClassOfCSS];
    }
    
    // parse the generated Tokens
     storeData.storeAllSeperatedTokens=[parseTokens generateDictionariesOfTheCSS:createTokensOfTheFile];
    
    [CSSRenderer rerender];

}


@end

