//
//  ScoreViewController.m
//  GameScores
//
//  Created by Ben Leduc-Mills on 11/6/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController
@synthesize scoreTextField, selection, delegate;

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
	// Do any additional setup after loading the view.
    scoreTextField.text=[selection objectForKey:@"object"];
}

- (void)viewDidUnload
{
    [self setScoreTextField:nil];
    selection = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([delegate respondsToSelector:@selector(setEditedSelection:)]) {
        [scoreTextField endEditing:YES];
        NSIndexPath *indexPath = [selection objectForKey:@"indexPath"];
        id object = scoreTextField.text;
        NSDictionary *editedSelection = [NSDictionary dictionaryWithObjectsAndKeys:indexPath, @"indexPath", object, @"object", nil];
        [delegate setValue:editedSelection forKey:@"editedSelection"];
    }
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
