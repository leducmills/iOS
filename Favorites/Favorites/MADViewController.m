//
//  MADViewController.m
//  Favorites
//
//  Created by Ben Leduc-Mills on 10/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"
#import "InfoViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize wordLabel;
@synthesize quoteText;


- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    wordLabel.text=user.word;
    quoteText.text=user.quote;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    user=[[Favorite alloc]init];
}

- (void)viewDidUnload
{
    [self setWordLabel:nil];
    [self setQuoteText:nil];
    user=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)infoButtonTapped:(UIBarButtonItem *)sender {
    NSLog(@"info button tapped");
    NSLog(@"value: %@", wordLabel.text);
    
    InfoViewController *infoViewController=[[InfoViewController alloc]init];
    
    infoViewController.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    
    infoViewController.userInfo=user;
    
    [self presentViewController:infoViewController animated:YES completion:NULL];
    
}
@end
