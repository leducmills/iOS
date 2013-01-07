//
//  MADViewController.m
//  HelloName
//
//  Created by Ben Leduc-Mills on 9/4/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize nameField;
@synthesize messageField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setNameField:nil];
    [self setMessageField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
    NSString *message = [[NSString alloc] initWithFormat:@"Hello, %@", nameField.text];
    messageField.text=message;
}
@end
