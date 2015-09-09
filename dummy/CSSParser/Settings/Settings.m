//
//  Settings.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "Settings.h"

storeTheParsedData *parsedData;

@implementation Settings


+(BOOL)isClassPresent:(NSString *)classOfCSS{

    BOOL hasClass=NO;
    
    parsedData=[storeTheParsedData sharedManager];
    
    // check if the class is present
    for(int i=0;i<[parsedData.storeAllSeperatedTokens count];i++){
        
        NSLog(@"%@",[[parsedData.storeAllSeperatedTokens objectAtIndex:i]allKeys]);
        
        if([[[parsedData.storeAllSeperatedTokens objectAtIndex:i]allKeys]containsObject:classOfCSS]){
            
            hasClass=YES;
            break;
        }
        else{
            
             hasClass=NO;
        }
    }
    
    return hasClass;
}

+(NSDictionary *)getAllTheCSSKeys:(NSString *)classOfCSS{
    
    NSDictionary *dictionayOfCSSkeys=nil;
    
    parsedData=[storeTheParsedData sharedManager];
    
    // check if the class is present
    for(int i=0;i<[parsedData.storeAllSeperatedTokens count];i++){
        
        NSLog(@"%@",[[parsedData.storeAllSeperatedTokens objectAtIndex:i]allKeys]);
        
        if([[[parsedData.storeAllSeperatedTokens objectAtIndex:i]allKeys]containsObject:classOfCSS]){
            
            dictionayOfCSSkeys=[[parsedData.storeAllSeperatedTokens objectAtIndex:i]objectForKey:classOfCSS];
            break;
        }
        else{
            
        }
    }
    
    return dictionayOfCSSkeys;
}

+(BOOL)doesClass:(NSDictionary *)cssClass containsKey:(NSString *)key{
    
    if([[cssClass allKeys]containsObject:key]){
        
        return YES;
    }
    else{
        
        return NO;
    }
}

@end
