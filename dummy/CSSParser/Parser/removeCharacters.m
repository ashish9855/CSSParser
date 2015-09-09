//
//  removeCharacters.m
//  dummy
//
//  Created by Ashish Maheshwari on 5/1/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "removeCharacters.h"
#import "storeTheParsedData.h"

@implementation removeCharacters

{
    storeTheParsedData *storeData;
}

-(void)allocateObjects{
    
    storeData=[storeTheParsedData sharedManager];
}

-(void)removeVariables:(NSArray *)data{
    
    [self allocateObjects];
    
    // store all the variables to the singleton
    for(int i=0;i<[data count];i++){
        
        [storeData.storeAllTheVariables addObject:[data objectAtIndex:i]];
    }
    
    // check if the results are valid
    for(int m=0;m<[data count];m++){
        
        if([[storeData.storeAllTheVariables objectAtIndex:m]containsString:@":"]){
            
            // remove all the variables from the string
            
            storeData.storeStringOfTheFile=[storeData.storeStringOfTheFile stringByReplacingOccurrencesOfString:[data objectAtIndex:m] withString:@""];
        }
        else{
            
            [storeData.storeAllTheVariables removeObject:[data objectAtIndex:m]];
        }
    }

}

-(void)removeComments:(NSArray *)data{
    
    [self allocateObjects];
    
    // store all the variables to the singleton
    for(int i=0;i<[data count];i++){
        
        NSLog(@"%@",storeData.storeStringOfTheFile);
        
        storeData.storeStringOfTheFile=[storeData.storeStringOfTheFile stringByReplacingOccurrencesOfString:[data objectAtIndex:i] withString:@""];
    }
    
    

}

@end
