//
//  ViewController.m
//  dummy
//
//  Created by Ashish Maheshwari on 4/13/15.
//  Copyright (c) 2015 Ashish Maheshwari. All rights reserved.
//

#import "ViewController.h"
#import "CSSParser.h"
#import "VariableParser.h"
#import "storeTheParsedData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //NSArray *prices = [self valueForKeyPath:@"cssParser"];
    
    
    // parse the CSS file
    
    CSSParser *cssParse=[[CSSParser alloc]init];
    [cssParse initCSSstyleSheet:@"demo" typeOfFile:@"txt"];
    
    [CSSRenderer renderTheView:btnl withClassName:@"hell0_ee"];
    
    // parse the Variable File
    
    VariableParser *varParse=[[VariableParser alloc]init];
    [varParse initCSSstyleSheet:@"variables" typeOfFile:@"txt"];
    
    storeTheParsedData *store=[storeTheParsedData sharedManager];
    NSLog(@"%@",store.storeAllTheVariables);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
