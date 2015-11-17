//
//  ViewController.m
//  CalculatorImprovedUI
//
//  Created by Ihor Zabrotsky on 10/19/15.
//  Copyright (c) 2015 Ihor Zabrotsky. All rights reserved.
//

#import "ViewController.h"
#import  "Calculator.h"

const  double  PERCENT  =  0.01;
const  double  SIGN  =  -1.0;

@interface  ViewController  ()

@end

@implementation  ViewController

- (void)addDigitToDisplay:(double)lastDigit  {
    
//    if  (self.calc.perCentPressed  ||  self.calc.signPressed)  {
//    
//        [self.calc  setAllClear];
//        
//    }
//    
//    if  (self.calc.equalPressed  !=  NO)  {
//        
//        [self.calc  setAllClear];
//        
//    }

    
    if  (self.calc.additionalOperationPressed  ||  self.calc.equalPressed)  {
        
        [self.calc  setAllClear];
        
    }
    
    NSNumber  *divisor  =  [NSNumber numberWithDouble:1.0];
    
    for  (int  i  =  0;  i  <  self.calc.digitsAfterPoint;  ++i)  {
        
        divisor  =  [NSNumber  numberWithDouble:[divisor  doubleValue]*10.0  ];
        
    }
    
    
    NSNumber  *digit  =  [NSNumber  numberWithDouble:lastDigit/
                          [divisor  doubleValue]  ];
    
    if  (self.calc.digitsAfterPoint  ==  0)  {
        
        [self.calc  addDigit:digit];
        
    }
    else  {
        
        self.calc.secondValue  =  [NSNumber  numberWithDouble:
                                   [self.calc.secondValue  doubleValue]  +  [digit  doubleValue]];
        
        ++self.calc.digitsAfterPoint;
        
        
    }
    
    if  (self.calc.pointEnabled  !=  NO  &&  lastDigit  ==  0)  {
        
        Display.text  =  [NSString  stringWithFormat:@"%@0",
                          Display.text];
        
    }
    else  {
        
        Display.text  =  [NSString  stringWithFormat:@"%g",
                          [  [self.calc  secondValue]  doubleValue]  ];
    }
    
}

- (IBAction)Number0:(id)sender  {
    
    [self addDigitToDisplay:0.0];
    
}

- (IBAction)Number1:(id)sender  {
    
    [self addDigitToDisplay:1.0];
    
}

- (IBAction)Number2:(id)sender  {
    
    [self addDigitToDisplay:2.0];
    
}

- (IBAction)Number3:(id)sender  {
    
    [self addDigitToDisplay:3.0];
    
}

- (IBAction)Number4:(id)sender  {
    
    [self addDigitToDisplay:4.0];
    
}

- (IBAction)Number5:(id)sender  {
    
    [self addDigitToDisplay:5.0];
    
}

- (IBAction)Number6:(id)sender  {
    
    [self addDigitToDisplay:6.0];
    
}

- (IBAction)Number7:(id)sender  {
    
    [self addDigitToDisplay:7.0];
    
}

- (IBAction)Number8:(id)sender  {
    
    [self addDigitToDisplay:8.0];
    
}

- (IBAction)Number9:(id)sender  {
    
    [self addDigitToDisplay:9.0];
    
}

- (IBAction)AllClear:(id)sender  {
    
    [self.calc  setAllClear];
    
    Display.text  =  @"0";
    
}

- (IBAction)Plus:(id)sender  {
    
    [self.calc  operationPlus];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",
                      [self.calc.firstValue  doubleValue]  ];
}

- (IBAction)Minus:(id)sender  {
    
    [self.calc  operationMinus];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",
                      [self.calc.firstValue  doubleValue]  ];
}

- (IBAction)Multiply:(id)sender  {
    
    [self.calc  operationMultiply];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",
                      [self.calc.firstValue  doubleValue]  ];
}

- (IBAction)Divide:(id)sender  {
    
    [self.calc  operationDivide];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",
                      [self.calc.firstValue  doubleValue]  ];
}

- (IBAction)Equals:(id)sender  {
    
    if  (self.calc.firstValue  !=  nil)  {
        
        [self.calc  operationEquals];
        
        Display.text  =  [NSString  stringWithFormat:@"%g",
                          [self.calc.firstValue  doubleValue]  ];
        
    }
    
    self.calc.equalPressed  =  YES;
    
}

- (IBAction)Sign:(id)sender  {
    
//    if  (!self.calc.signPressed)  {
//        
//        self.calc.signPressed  =  YES;
//        
//    }
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  optionalMultiply:SIGN];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",
                    [self.calc.secondValue  doubleValue]  ];
}

- (IBAction)PerCent:(id)sender  {
    
//    if  (!self.calc.perCentPressed)  {
//        
//        self.calc.perCentPressed  =  YES;
//        
//    }

    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  optionalMultiply:PERCENT];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",
                    [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)Point:(id)sender  {
    
    if  (self.calc.equalPressed)  {
        
        [self.calc  setAllClear];
        
    }
    
    double  drob_4ast  =  [self.calc.secondValue  doubleValue]  -
    [self.calc.secondValue  intValue];
    
    if  (self.calc.pointEnabled  ==  NO  &&  drob_4ast  ==  0)  {
        
        self.calc.pointEnabled  =  YES;
        ++self.calc.digitsAfterPoint;
        
        if  (self.calc.secondValue  ==  nil)  {
            
            Display.text  =  @"0.";
            
        }
        else  {
            
            Display.text  =  [NSString  stringWithFormat:@"%@.", Display.text];
            
        }
        
    }
    
}

- (IBAction)TenX:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  tenX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)ExpX:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  expX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)XPow2:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  powX:2.0];
    
    Display.text  =  [NSString  stringWithFormat:@"%g", [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)XPow3:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  powX:3.0];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)XPowM1:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc powX:-1.0];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)Log10:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  logTen];
    
    Display.text  =  [NSString stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
    
}

- (IBAction)Log:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  lnX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)SqRoot:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  sqRoot];
    
    Display.text  =  [NSString  stringWithFormat:@"%g", [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)CbRoot:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  cbRoot];
    
    Display.text  =  [NSString  stringWithFormat:@"%g", [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)SinX:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  sinX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)CosX:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  cosX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)TanX:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  tanX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)SinhX:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  sinhX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)CoshX:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  coshX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}

- (IBAction)TanhX:(id)sender  {
    
    if  (!self.calc.additionalOperationPressed)  {
        
        self.calc.additionalOperationPressed  =  YES;
        
    }
    
    [self.calc  tanhX];
    
    Display.text  =  [NSString  stringWithFormat:@"%g",  [self.calc.secondValue  doubleValue]  ];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.calc = [Calculator new];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
