//
//  CalculatorBrain.h
//  Calculator_practice
//
//  Created by Dimo on 13/7/1.
//  Copyright (c) 2013年 ISL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (void)pushOperationOnButton:(NSString *)operations;
- (double)performOperation;

@end
