//
//  scanner.h
//  dummy
//
//  Created by Ashish Maheshwari on 5/1/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "storeTheParsedData.h"

@interface scanner : NSObject

{
    @protected
    storeTheParsedData *storeData;
}
-(void)scanTheStringForTheCharacters:(NSString *)inString;
-(NSArray *)scanCharacters:(NSString *)start  endString:(NSString *)end onString:(NSString *)stringOfFile;
@end
