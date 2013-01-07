//
//  MADViewController.m
//  HelloWorld2
//
//  Created by Ben Leduc-Mills on 9/4/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize messageText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMessageText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonPressed:(UIButton *)sender {
    //messageText.text = @"Hello World";
    
    NSString *title = [sender titleForState:UIControlStateNormal];
    messageText.text = [NSString stringWithFormat:@"%@ World", title];
    
}
@end
