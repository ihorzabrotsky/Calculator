//
//  Calculator.m
//  CalculatorImprovedUI
//
//  Created by Ihor Zabrotsky on 10/19/15.
//  Copyright (c) 2015 Ihor Zabrotsky. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(void)prepareForInitialization  {
    
    self.signPressed  =  NO;
    self.perCentPressed  =  NO;
    
    self.additionalOperationPressed  =  NO;
    
    self.pointEnabled  =  NO;
    self.digitsAfterPoint  =  0;
    
    if  (self.equalPressed  !=  NO)  { // this if executes always when '=' is pressed
        // so we have 2 variants:
        // 1) firstValue is initialized
        // 2) firstValue is NOT initialized
        if (self.firstValue  !=  nil)  {
            
            self.secondValue  =  nil;
            self.activeOperation  =  EMPTY;
            
        }
        
        self.equalPressed  =  NO; // this we have to do anyway
        
    }
    
    if  (self.secondValue  !=  nil)  {
        
        if  (self.firstValue  ==  nil)  {
            
            self.firstValue  =  self.secondValue;
            
        }
        else  {
            
            [self  executeOperation];
            
        }
        
        if  (self.equalPressed  ==  NO)  {
            
            self.secondValue  =  nil;
        }
        
    }
    
}

- (void)executeOperation  {
    
    switch  (self.activeOperation)  {
            
        case  PLUS:
            self.firstValue  =  [NSNumber  numberWithDouble:
                                 ( [self.firstValue  doubleValue]  +
                                  [self.secondValue  doubleValue] ) ];
            break;
            
        case  MINUS:
            self.firstValue  =  [NSNumber  numberWithDouble:
                                 ( [self.firstValue  doubleValue]  -
                                  [self.secondValue  doubleValue] ) ];
            break;
            
        case  MULTIPLY:
            self.firstValue  =  [NSNumber  numberWithDouble:
                                 ( [self.firstValue  doubleValue]  *
                                  [self.secondValue  doubleValue] ) ];
            break;
            
        case  DIVIDE:
            self.firstValue  =  [NSNumber  numberWithDouble:
                                 ( [self.firstValue  doubleValue]  /
                                  [self.secondValue  doubleValue] ) ];
            break;
            
        default:
            
            break;
            
    }
    
}

- (void)operationPlus  {
    
    [self  prepareForInitialization];
    
    self.activeOperation  =  PLUS;
    
}

- (void)operationMinus  {
    
    [self  prepareForInitialization];
    
    self.activeOperation  =  MINUS;
    
}

- (void)operationMultiply  {
    
    [self  prepareForInitialization];
    
    self.activeOperation  =  MULTIPLY;
    
}

- (void)operationDivide  {
    
    [self  prepareForInitialization];
    
    self.activeOperation  =  DIVIDE;
    
}

- (void)operationEquals  {
    
    
    
    self.equalPressed  =  YES;
    
    if  (self.firstValue  !=  nil)  {
        
        [self  executeOperation];
        
    }
    
}

- (void)addDigit:(NSNumber *)digit  {
    
    self.secondValue  =  [NSNumber  numberWithDouble:
                          [self.secondValue  doubleValue]  *  10  +  [digit  doubleValue] ];
    
}

- (void)setAllClear  {
    
    self.firstValue  =  nil;
    self.secondValue  =  nil;
    
    self.activeOperation  =  EMPTY;
    self.equalPressed  =  NO;
    
    self.pointEnabled  =  NO;
    self.digitsAfterPoint  =  0;
    self.perCentPressed  =  NO;
    self.signPressed  =  NO;
    
    self.additionalOperationPressed  =  NO;
    
}

- (void)optionalMultiply:(double)coefficient  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              coefficient*[self.secondValue  doubleValue]  ];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  coefficient*[self.firstValue  doubleValue]  ];
            
            self.firstValue  =  nil;
            
        }  else {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          coefficient*[self.secondValue  doubleValue]  ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          coefficient*[self.firstValue  doubleValue]];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
}



- (void)tenX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              pow(10, [self.secondValue  doubleValue]  )];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  pow(10, [self.firstValue  doubleValue] ) ];
            
            self.firstValue  =  nil;
            
        }  else {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          pow(10, [self.secondValue  doubleValue] ) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          pow(10, [self.firstValue  doubleValue] )];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }

    
}

- (void)expX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              exp([self.secondValue  doubleValue]  )];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  exp([self.firstValue  doubleValue] ) ];
            
            self.firstValue  =  nil;
            
        }  else {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          exp([self.secondValue  doubleValue] ) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          exp([self.firstValue  doubleValue] )];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }

    
}

- (void)powX:(double)coefficient  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              pow([self.secondValue  doubleValue], coefficient  )];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  pow([self.firstValue  doubleValue], coefficient ) ];
            
            self.firstValue  =  nil;
            
        }  else {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          pow([self.secondValue  doubleValue], coefficient ) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          pow([self.firstValue  doubleValue] , coefficient)];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
}

- (void)logTen  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              log10([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  log10([self.firstValue  doubleValue]) ];
            
            self.firstValue  =  nil;
            
        }  else {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          log10([self.secondValue  doubleValue]) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          log10([self.firstValue  doubleValue])];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
}

- (void)lnX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              log([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  log([self.firstValue  doubleValue]) ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          log([self.secondValue  doubleValue]) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          log([self.firstValue  doubleValue])];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
}

- (void)  executeMathematicalOperation:(double  (^)(double)) someUnaryOperation  {
    
    if (!self.firstValue  &&  self.secondValue)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              someUnaryOperation([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  &&  !self.secondValue)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  someUnaryOperation([self.firstValue  doubleValue]) ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  &&  self.secondValue) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          someUnaryOperation([self.secondValue  doubleValue]) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          someUnaryOperation([self.firstValue  doubleValue])];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
    
}

- (void)sqRoot  {
    
    [self  executeMathematicalOperation:^(double  arg)  {
        return  sqrt(arg);
    }];
    
}

- (void)cbRoot  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              cbrt([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  cbrt([self.firstValue  doubleValue]) ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          cbrt([self.secondValue  doubleValue]) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          cbrt([self.firstValue  doubleValue])];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }

    
}

- (void)sinX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              sin([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  sin([self.firstValue  doubleValue]) ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          sin([self.secondValue  doubleValue]) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          sin([self.firstValue  doubleValue])];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }

    
}

- (void)cosX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              cos([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  cos([self.firstValue  doubleValue]) ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          cos([self.secondValue  doubleValue])  ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          cos([self.firstValue  doubleValue])  ];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }

}

- (void)tanX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              tan([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  tan([self.secondValue  doubleValue])  ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          tan([self.secondValue  doubleValue])  ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          tan([self.secondValue  doubleValue])  ];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
}

- (void)sinhX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              sinh([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  sinh([self.firstValue  doubleValue]) ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          sinh([self.secondValue  doubleValue]) ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          sinh([self.firstValue  doubleValue])];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
    
}

- (void)coshX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              cosh([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  cosh([self.firstValue  doubleValue]) ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          cosh([self.secondValue  doubleValue])  ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          cosh([self.firstValue  doubleValue])  ];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
}

- (void)tanhX  {
    
    if (self.firstValue  ==  nil  &&  self.secondValue  !=  nil)  {
        
        self.secondValue  =  [NSNumber  numberWithDouble:
                              tanh([self.secondValue  doubleValue])];
        
    }  else  {
        
        if  (self.firstValue  !=  nil  &&  self.secondValue  ==  nil)  {
            
            self.secondValue  =  [NSNumber  numberWithDouble:
                                  tanh([self.secondValue  doubleValue])  ];
            
            self.firstValue  =  nil;
            
        }  else  {
            
            if  (self.firstValue  !=  nil  &&  self.secondValue  !=  nil) {
                
                if  (self.equalPressed  ==  NO)  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          tanh([self.secondValue  doubleValue])  ];
                    
                }  else  {
                    
                    self.secondValue  =  [NSNumber  numberWithDouble:
                                          tanh([self.secondValue  doubleValue])  ];
                    
                    self.firstValue  =  nil;
                    self.equalPressed  =  NO;
                    self.activeOperation  =  EMPTY;
                    
                }
                
            }
            
        }
        
    }
    
}


@end