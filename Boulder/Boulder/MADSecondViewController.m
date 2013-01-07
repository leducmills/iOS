//
//  MADSecondViewController.m
//  Boulder
//
//  Created by Ben Leduc-Mills on 10/18/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController
@synthesize secondWebView;
@synthesize secondSpinner;

- (void) loadWebPageWithString: (NSString *) urlString {
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [secondWebView loadRequest:request];
    
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
    // Do any additional setup after loading the view from its nib.
    secondWebView.delegate=self;
    [self loadWebPageWithString:@"http://xkcd.com"];
}

- (void)viewDidUnload
{
    [self setSecondWebView:nil];
    [self setSecondSpinner:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void) webViewDidStartLoad:(UIWebView *)webView {
    [secondSpinner startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView {
    [secondSpinner stopAnimating];
}


@end
