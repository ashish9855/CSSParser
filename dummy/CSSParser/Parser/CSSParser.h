//
//  CSSParser.h
//  dummy
//
//  Created by Ashish Maheshwari on 4/22/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CSSParser : NSObject


/*
 -- Pass the name and the type of file you want to Load from NIB
 */
-(void)initCSSstyleSheet:(NSString *)nameOfTheFile typeOfFile:(NSString *)fileType;
-(void)mark:(UIButton *)btn;

@end

