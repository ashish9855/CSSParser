//
//  scanner.m
//  dummy
//
//  Created by Ashish Maheshwari on 5/1/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "scanner.h"
#import "removeCharacters.h"
#import "generateTokensOfCSS.h"

@implementation scanner

-(void)scanTheStringForTheCharacters:(NSString *)inString{
    
    storeData=[storeTheParsedData sharedManager];
    storeData.storeStringOfTheFile=inString;
    removeCharacters *revChar=[[removeCharacters alloc]init];
    NSArray *data;
    
    // remove the comments /* ........ */
    data=[self scanCharacters:@"/*" endString:@"*/" onString:storeData.storeStringOfTheFile];
    if(data.count==0){
        
    }
    else{
        
        [revChar removeComments:data];
    }
    
    // remove the comment .... //
    data=[self scanCharacters:@"//" endString:@"\n" onString:storeData.storeStringOfTheFile];
    if(data.count==0){
        
        
    }
    else{
        
         [revChar removeComments:data];
    }
    
    // get all the variables
    data=[self scanCharacters:@"@" endString:@";" onString:storeData.storeStringOfTheFile];
    if(data.count==0){
        
    }
    else{
        
        [revChar removeVariables:data];
    }
    
    
    // start with the tokenization process
    generateTokensOfCSS *tokens=[[generateTokensOfCSS alloc]init];
    [tokens generateTokensfromTheFile];
    
}

-(NSArray *)scanCharacters:(NSString *)start  endString:(NSString *)end onString:(NSString *)stringOfFile{
    
    NSMutableArray *storeAllImports=[NSMutableArray new];
    
    NSScanner* scanner = [NSScanner scannerWithString:stringOfFile];
    while ([scanner isAtEnd] == NO) {
        
        [scanner setCharactersToBeSkipped:nil];
        [scanner scanUpToString:start intoString:NULL];
        if ([scanner scanString:start intoString:NULL]) {
            NSString* result = nil;
            if ([scanner scanUpToString:end intoString:&result]) {
                
                result=[start stringByAppendingString:result];
                result=[result stringByAppendingString:end];
                
                [storeAllImports addObject:result];
                
            }
        }
    }
    
    return [storeAllImports copy];
}

@end
