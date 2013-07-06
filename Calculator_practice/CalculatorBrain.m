//
//  CalculatorBrain.m
//  Calculator_practice
//
//  Created by Dimo on 13/7/1.
//  Copyright (c) 2013年 ISL. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack
{
    if (!_operandStack)
    {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject)[self.operandStack removeLastObject];
    NSLog(@"The object num %@",operandObject);
    return [operandObject doubleValue];
    
}

- (NSString*)popOperation
{
    NSString *operandObject = [self.operandStack lastObject];
    if(operandObject)[self.operandStack removeLastObject];
    NSLog(@"The object oper %@",operandObject);
    return operandObject;
    
}


- (void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

- (void) pushOperationOnButton:(NSString *)operations
{
    [self.operandStack addObject:operations];
}

- (double)performOperation
{
    double result = 0;
    
    double theSecondNumberInArray = [self popOperand];
    NSString *theOperationInArray = [self popOperation];
    double theFirstNumberInArray = [self popOperand];
    
    if([theOperationInArray isEqualToString:@"+"])
    {
        result =  theFirstNumberInArray + theSecondNumberInArray;
        
    }else if ([theOperationInArray isEqualToString:@"*"]){
        
        result = theFirstNumberInArray * theSecondNumberInArray;
        
    }else if ([theOperationInArray isEqualToString:@"-"]){
        
        result = theFirstNumberInArray - theSecondNumberInArray;
        
    }else if ([theOperationInArray isEqualToString:@"/"])
    {
        result = theFirstNumberInArray / theSecondNumberInArray;
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
