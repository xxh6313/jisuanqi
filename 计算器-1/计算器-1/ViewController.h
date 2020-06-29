//
//  ViewController.h
//  计算器-1
//
//  Created by 魏学海 on 2020/6/22.
//  Copyright © 2020 魏学海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *resultText;
@property (nonatomic) BOOL isProcessing;
@property (nonatomic) NSMutableArray *numberStack;
@property (nonatomic) NSMutableArray *operandStack;

@end

