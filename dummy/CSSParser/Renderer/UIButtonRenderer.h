//
//  UIButtonRenderer.h
//  dummy
//
//  Created by Ashish Maheshwari on 4/28/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Settings.h"
#import "UIColor+colorConversion.h"
#import <QuartzCore/QuartzCore.h>

@interface UIButtonRenderer : NSObject

@property(nonatomic,strong)NSDictionary *getAllTheValueOfCSS;

+(void)renderTheButton:(UIButton *)button withClass:(NSString *)cssClass;

@end
