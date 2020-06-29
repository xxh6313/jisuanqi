//
//  ViewController.m
//  计算器-1
//
//  Created by 魏学海 on 2020/6/22.
//  Copyright © 2020 魏学海. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}


-(NSMutableArray *)operandStack
{
    if(!_operandStack)
        _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}
 
-(NSMutableArray *)numberStack
{
    if(!_numberStack)
        _numberStack = [[NSMutableArray alloc] init];
     
    return _numberStack;
}
 
- (IBAction)operandPressed:(UIButton *)sender {
     
    if([self isAvailableToCalculate])
    {
        [self doCalculate];
    }
    else
    {
        [self.numberStack addObject:self.resultText.text];
    }
     
    [self.operandStack addObject:sender.titleLabel.text];
    self.isProcessing = NO;
}


- (IBAction)numberPressed:(UIButton *)sender {
     
    if (self.isProcessing) {
        self.resultText.text =
        [self.resultText.text stringByAppendingString:sender.titleLabel.text];
    }
    else{
        self.resultText.text = sender.titleLabel.text;
        self.isProcessing = YES;
    }
}
 
- (IBAction)resetPressed:(id)sender {
     
    self.isProcessing = NO;
     
    [self.numberStack removeAllObjects];
    [self.operandStack removeAllObjects];
     
    self.resultText.text = @"0";
}
 
-(void)doCalculate
{
    NSString *operand = [self.operandStack lastObject];
     
    if(operand)
    {
        NSString *outObject = [self.numberStack lastObject];
        int outputInteger = outObject ? [outObject intValue] : 0;
        [self.numberStack removeLastObject];
         
        int resultInteger = 0;
         
        if ([operand isEqualToString:@"+"])
        {
            resultInteger =  [self.resultText.text intValue] + outputInteger;
        }
        else if ([operand isEqualToString:@"-"])
        {
            resultInteger = outputInteger - [self.resultText.text intValue];
        }
        else if ([operand isEqualToString:@"*"])
        {
            resultInteger = outputInteger * [self.resultText.text intValue];
        }
        else
        {
            resultInteger = [self.resultText.text intValue] == 0 ? 0 : outputInteger / [self.resultText.text intValue];
        }
         
        [self.operandStack removeLastObject];
         
        NSString *resultString = [NSString stringWithFormat:@"%d", resultInteger];
        self.resultText.text = resultString;
        [self.numberStack addObject:resultString];
    }
}
 
-(BOOL)isAvailableToCalculate
{
    return [self.operandStack lastObject] != nil;
}
 
- (IBAction)enterPressed:(id)sender
{
    [self doCalculate];
}

@end
