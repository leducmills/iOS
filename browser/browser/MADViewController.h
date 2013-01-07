//
//  MADViewController.h
//  browser
//
//  Created by Ben Leduc-Mills on 9/20/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIWebViewDelegate, UIActionSheetDelegate>

- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
