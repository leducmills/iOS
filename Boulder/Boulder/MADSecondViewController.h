//
//  MADSecondViewController.h
//  Boulder
//
//  Created by Ben Leduc-Mills on 10/18/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *secondWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *secondSpinner;

@end
