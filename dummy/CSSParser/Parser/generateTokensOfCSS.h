//
//  generateTokensOfCSS.h
//  dummy
//
//  Created by Ashish Maheshwari on 4/27/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "parseTokens.h"
#import "storeTheParsedData.h"
#import "CSSRenderer.h"

@interface generateTokensOfCSS : NSObject
{
    @protected
    storeTheParsedData *storeData;
    NSString * stringCSSromFileAtURL;
    
    @private
    NSMutableArray *createTokensOfTheFile;
}

-(void)generateTokensfromTheFile;

@property(nonatomic,strong)storeTheParsedData *storeData;

@end
