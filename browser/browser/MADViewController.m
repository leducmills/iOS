//
//  MADViewController.m
//  browser
//
//  Created by Ben Leduc-Mills on 9/20/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize spinner;
@synthesize webView;
@synthesize toolbar;


-(void) loadWebPageWithString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error loading page!"
                            message:[error localizedDescription]
                            delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"OK", nil];
    [alertView show];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadWebPageWithString:@"http://benatwork.cc"];
    webView.delegate=self;
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setToolbar:nil];
    [self setSpinner:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender {
    
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self
        cancelButtonTitle:@"Cancel"
        destructiveButtonTitle:nil
        otherButtonTitles:@"Benatwork", @"BoingBoing", @"XKCD", nil];
    [actionSheet showFromToolbar:toolbar];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {    
    
    switch (buttonIndex) {
        case 0:
            [self loadWebPageWithString:@"http://benatwork.cc"];
            break;
        case 1:
            [self loadWebPageWithString:@"http://boingboing.net"];
            break;
        case 2:
            [self loadWebPageWithString:@"http://xkcd.com"];
            break;
            
        default:
            break;
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [spinner stopAnimating];
}

@end
