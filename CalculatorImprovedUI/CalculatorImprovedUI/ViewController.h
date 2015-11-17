//
//  ViewController.h
//  CalculatorImprovedUI
//
//  Created by Ihor Zabrotsky on 10/19/15.
//  Copyright (c) 2015 Ihor Zabrotsky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "Calculator.h"

@interface  ViewController  :  UIViewController  {
    
    IBOutlet  UILabel  *Display;
    
}

@property  Calculator  *calc;

- (void)addDigitToDisplay:(double)digit;

- (IBAction)Number0:(id)sender;
- (IBAction)Number1:(id)sender;
- (IBAction)Number2:(id)sender;
- (IBAction)Number3:(id)sender;
- (IBAction)Number4:(id)sender;
- (IBAction)Number5:(id)sender;
- (IBAction)Number6:(id)sender;
- (IBAction)Number7:(id)sender;
- (IBAction)Number8:(id)sender;
- (IBAction)Number9:(id)sender;
- (IBAction)Plus:(id)sender;
- (IBAction)Minus:(id)sender;
- (IBAction)Multiply:(id)sender;
- (IBAction)Divide:(id)sender;
- (IBAction)Equals:(id)sender;
- (IBAction)AllClear:(id)sender;
- (IBAction)Point:(id)sender;
- (IBAction)Sign:(id)sender;
- (IBAction)PerCent:(id)sender;
- (IBAction)TenX:(id)sender;
- (IBAction)ExpX:(id)sender;

- (IBAction)XPow2:(id)sender;
- (IBAction)XPow3:(id)sender;
- (IBAction)XPowM1:(id)sender;
- (IBAction)Log10:(id)sender;
- (IBAction)Log:(id)sender;
- (IBAction)SqRoot:(id)sender;
- (IBAction)CbRoot:(id)sender;
- (IBAction)SinX:(id)sender;
- (IBAction)CosX:(id)sender;
- (IBAction)TanX:(id)sender;
- (IBAction)SinhX:(id)sender;
- (IBAction)CoshX:(id)sender;
- (IBAction)TanhX:(id)sender;


@end

