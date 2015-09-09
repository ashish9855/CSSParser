//
//  UILabelRenderer.h
//  dummy
//
//  Created by Ashish Maheshwari on 4/29/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Settings.h"
#import "UIColor+colorConversion.h"
#import <QuartzCore/QuartzCore.h>

@interface UILabelRenderer : NSObject

@property(nonatomic,strong)NSDictionary *getAllTheValueOfCSS;

+(void)renderTheLabel:(UILabel *)label withClass:(NSString *)cssClass;

@end
