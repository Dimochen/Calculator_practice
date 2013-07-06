//
//  CalculatorViewController.m
//  Calculator_practice
//
//  Created by Dimo on 13/6/26.
//  Copyright (c) 2013年 ISL. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    
        if(self.userIsInTheMiddleOfEnteringANumber)
        {
            self.display.text = [self.display.text stringByAppendingString:digit];
            
        } else {
            
            self.display.text = digit;
            self.userIsInTheMiddleOfEnteringANumber = YES;
        }
    
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    
    double resultString = 0;
    resultString = [self.brain performOperation];
    NSString *result = [NSString stringWithFormat:@"%g",resultString];
    self.display.text = result;
}

- (IBAction)operationPressed:(UIButton *)sender
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    
    NSString *operationOnButton = [sender currentTitle];
    [self.brain pushOperationOnButton:operationOnButton];    
}

@end
