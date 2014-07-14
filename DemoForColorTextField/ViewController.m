//
//  ViewController.m
//  DemoForColorTextField
//
//  Created by darklinden on 14-7-14.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "ViewController.h"
#import "TF_color.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *text = textField.text;
    
    if (text.length > range.location + range.length) {
        if (range.length) {
            text = [text stringByReplacingCharactersInRange:range withString:string];
        }
        else {
            
        }
    }
    else if (range.location == text.length) {
        text = [text stringByAppendingString:string];
    }
    else {
        text = [string copy];
    }
    [(TF_color *)textField setColorText:text font:nil];
    
    return NO;
}

@end
