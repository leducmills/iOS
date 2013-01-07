//
//  MADViewController.m
//  tipCalculator
//
//  Created by Ben Leduc-Mills on 9/18/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize checkAmount;
@synthesize tipPercent;
@synthesize people;
@synthesize tipDue;
@synthesize totalDue;
@synthesize totalDuePerPerson;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    checkAmount.delegate = self;
    tipPercent.delegate = self;
    people.delegate = self;
    
}

- (void)viewDidUnload
{
    [self setCheckAmount:nil];
    [self setTipPercent:nil];
    [self setPeople:nil];
    [self setTipDue:nil];
    [self setTotalDue:nil];
    [self setTotalDuePerPerson:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


-(void)updateTipTotals {
    
    float amount = [checkAmount.text floatValue];
    float pct = [tipPercent.text floatValue];
    int numberOfPeople=[people.text intValue];
    
    pct=pct/100;
    
    float tip=amount*pct;
    float total=amount+tip;
    float personTotal=0;
    
    if(numberOfPeople >0) {
        personTotal=total/numberOfPeople;
    }
    else {
        UIAlertView *alertView=[[UIAlertView alloc]
                                initWithTitle:@"Waring"
                                message:@"Division by 0 is bad!"
                                delegate:self
                                cancelButtonTitle:@"Abort!"
                                otherButtonTitles:@"Ok!", nil];
        [alertView show];
    }
    NSNumberFormatter *currencyFormatter=[[NSNumberFormatter alloc]init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    //[currencyFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    tipDue.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:tip]];
    totalDue.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:total]];
    totalDuePerPerson.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:personTotal]];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    //[self updateTipTotals];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex ==1) {
        people.text=[NSString stringWithFormat:@"1"];
        [self updateTipTotals];
    }
}

- (IBAction)calcButton:(UIButton *)sender {
    [self updateTipTotals];
}
@end
