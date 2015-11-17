//
//  Calculator.h
//  CalculatorImprovedUI
//
//  Created by Ihor Zabrotsky on 10/19/15.
//  Copyright (c) 2015 Ihor Zabrotsky. All rights reserved.
//

#import  <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>
#import  <math.h>

typedef  enum  {  EMPTY,  PLUS,  MINUS,  DIVIDE,  MULTIPLY  }  OperationID;

@interface  Calculator  :  NSObject

@property  (strong,  nonatomic)  NSNumber  *firstValue;
@property  (strong,  nonatomic)  NSNumber  *secondValue;
@property  (strong,  nonatomic)  NSNumber  *memoryValue;

@property  (nonatomic,  assign)  OperationID  activeOperation;

@property  (nonatomic,  assign)  BOOL  equalPressed;
@property  (nonatomic,  assign)  BOOL  pointEnabled;
@property  (nonatomic,  assign)  BOOL  perCentPressed;
@property  (nonatomic,  assign)  BOOL  signPressed;

@property  (nonatomic,  assign)  BOOL  additionalOperationPressed;

@property  (nonatomic,  assign)  int  digitsAfterPoint;

- (void)executeOperation;
- (void)prepareForInitialization;

- (void)operationPlus;
- (void)operationMinus;
- (void)operationMultiply;
- (void)operationDivide;

- (void)operationEquals;

- (void)addDigit:(NSNumber  *)digit;

- (void)setAllClear;

- (void)optionalMultiply:(double)coefficient;

- (void)tenX;
- (void)expX;
- (void)powX:(double)coefficient;

- (void)logTen;
- (void)lnX;

- (void)sqRoot;
- (void)cbRoot;

- (void)sinX;
- (void)cosX;
- (void)tanX;

- (void)sinhX;
- (void)coshX;
- (void)tanhX;


@end