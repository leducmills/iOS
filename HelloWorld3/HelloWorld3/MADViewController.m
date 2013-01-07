//
//  MADViewController.m
//  HelloWorld3
//
//  Created by Ben Leduc-Mills on 9/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize nyImage;
@synthesize messageField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setNyImage:nil];
    [self setMessageField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)chooseTeam:(UIButton *)sender {
    
    if(sender.tag == 1){
        nyImage.image = [UIImage imageNamed:@"Yankees-logo-300x300.png"];
        messageField.text=@"A Yankee fan, how boring";
    } else {
        nyImage.image = [UIImage imageNamed:@"metslogo300.png"];
        messageField.text = @"Yeah, you're a Mets fan";
    }
    
}
@end
