//
//  parseTokens.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/24/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "parseTokens.h"

@implementation parseTokens

+(NSMutableArray *)generateDictionariesOfTheCSS:(NSMutableArray *)dataOfClasses{
    
    NSMutableArray *getTheSeperatedClasses=[NSMutableArray new];
    NSMutableDictionary *getAllTheTagsAndClasses;
    NSMutableDictionary *setAllTheTagsAndClasses;
    NSMutableArray *storeAllTheClassesCreated=[[NSMutableArray alloc]init];
    
    for (int i=0; i<dataOfClasses.count; i++) {
        
        getAllTheTagsAndClasses=[NSMutableDictionary new];
        // seperate all the strig son the basis of semicolon
        NSArray *arrOfCSSTags=[[dataOfClasses objectAtIndex:i]componentsSeparatedByString:@";"];
        
        // check if the string contains comma's
        
        if([[arrOfCSSTags objectAtIndex:0] rangeOfString:@","].location == NSNotFound){
            
            setAllTheTagsAndClasses =[NSMutableDictionary new];
            NSString* deleteUnwantedCharacters;
            
            for (int j=0; j<arrOfCSSTags.count-1; j++) {
                
                if(j==0){
                    
                    // sepearte and add the class name
                    NSArray *cssClass=[[arrOfCSSTags objectAtIndex:j]componentsSeparatedByString:@"{"];
                    
                    // scan the string for # and . and remove them
                    deleteUnwantedCharacters =
                    [[[cssClass objectAtIndex:0] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@".#"]]
                     componentsJoinedByString:@""];
                  //  [getAllTheTagsAndClasses setValue:deleteUnwantedCharacters forKey:@"class"];
                    
                    //if([cssClass objectAtIndex:0])
                    
                    // seperate by colon : to get the tags
                    NSArray *tagsOfCSS=[[cssClass objectAtIndex:1]componentsSeparatedByString:@":"];
                    [getAllTheTagsAndClasses setValue:[tagsOfCSS objectAtIndex:1] forKey:[tagsOfCSS objectAtIndex:0]];
                }
                else{
                    
                    // seperate by colon : to get the tags
                    NSArray *tagsOfCSS=[[arrOfCSSTags objectAtIndex:j]componentsSeparatedByString:@":"];
                    [getAllTheTagsAndClasses setValue:[tagsOfCSS objectAtIndex:1] forKey:[tagsOfCSS objectAtIndex:0]];
                }
            }
            
            
            [setAllTheTagsAndClasses setObject:getAllTheTagsAndClasses forKey:deleteUnwantedCharacters];
            
            // add all the keys to the array
            NSInteger indexOfObject=[self checkIfTheClassIsPresent:deleteUnwantedCharacters inTheObject:storeAllTheClassesCreated];
            
            if(indexOfObject!=-1){
                
                [getTheSeperatedClasses replaceObjectAtIndex:indexOfObject withObject:setAllTheTagsAndClasses];
            }
            else{
                

                [getTheSeperatedClasses addObject:setAllTheTagsAndClasses];
                // add the tag to the array
                [storeAllTheClassesCreated addObject:deleteUnwantedCharacters];
            }
            
        }
        else{
            
            NSArray *cssClass=[[arrOfCSSTags objectAtIndex:0]componentsSeparatedByString:@"{"];
            NSArray *multipleClasses=[[cssClass objectAtIndex:0]componentsSeparatedByString:@","];
            
            NSString* deleteUnwantedCharacters;
            
            for (int l=0; l<multipleClasses.count; l++) {
                
                getAllTheTagsAndClasses=[NSMutableDictionary new];
                
                // set the class
                // scan the string for # and . and remove them
                deleteUnwantedCharacters =
                [[[multipleClasses objectAtIndex:l] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@".#"]]
                 componentsJoinedByString:@""];
                //[getAllTheTagsAndClasses setValue:deleteUnwantedCharacters forKey:@"class"];
                
                setAllTheTagsAndClasses =[NSMutableDictionary new];
                
                for (int j=0; j<arrOfCSSTags.count-1; j++) {
                    
                    if(j==0){
                        
                        // sepearte and add the class name
                        NSArray *cssClass=[[arrOfCSSTags objectAtIndex:j]componentsSeparatedByString:@"{"];
                        // seperate by colon : to get the tags
                        NSArray *tagsOfCSS=[[cssClass objectAtIndex:1]componentsSeparatedByString:@":"];
                        [getAllTheTagsAndClasses setValue:[tagsOfCSS objectAtIndex:1] forKey:[tagsOfCSS objectAtIndex:0]];
                    }
                    else{
                        
                        // seperate by colon : to get the tags
                        NSArray *tagsOfCSS=[[arrOfCSSTags objectAtIndex:j]componentsSeparatedByString:@":"];
                        [getAllTheTagsAndClasses setValue:[tagsOfCSS objectAtIndex:1] forKey:[tagsOfCSS objectAtIndex:0]];
                    }
                }
                
                [setAllTheTagsAndClasses setObject:getAllTheTagsAndClasses forKey:deleteUnwantedCharacters];
                
                // add all the keys to the array
                NSInteger indexOfObject=[self checkIfTheClassIsPresent:deleteUnwantedCharacters inTheObject:storeAllTheClassesCreated];
                
                if(indexOfObject!=-1){
                    
                    [getTheSeperatedClasses replaceObjectAtIndex:indexOfObject withObject:setAllTheTagsAndClasses];
                }
                else{
                    
                    [getTheSeperatedClasses addObject:setAllTheTagsAndClasses];
                    // add the tag to the array
                    [storeAllTheClassesCreated addObject:deleteUnwantedCharacters];
                }

            }
        }
    }
    return getTheSeperatedClasses;
}

+(NSInteger)checkIfTheClassIsPresent:(NSString *)class inTheObject:(NSMutableArray *)setOfObjects{
    

    if([setOfObjects containsObject:class]){
        
        return [setOfObjects indexOfObject:class];
    }
    else{
        
        return -1;
    }
}


@end
