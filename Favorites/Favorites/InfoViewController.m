//
//  InfoViewController.m
//  Favorites
//
//  Created by Ben Leduc-Mills on 10/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "InfoViewController.h"
#import "MADViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController
@synthesize userWord;
@synthesize userQuote;
@synthesize userInfo;



-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    userWord.text=userInfo.word;
    userQuote.text=userInfo.quote;
}

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
    userWord.delegate=self;
    userQuote.delegate=self;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setUserQuote:nil];
    [self setUserWord:nil];
    userInfo=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) touchesEnded:(NSSet *)touches
            withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if([userQuote isFirstResponder] && [touch view] != userQuote) {
        [userQuote resignFirstResponder];
    }
}


- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    NSLog(@"userWord: %@", userWord.text);
    
    userInfo.word=userWord.text;
    userInfo.quote=userQuote.text;
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    

}
@end
