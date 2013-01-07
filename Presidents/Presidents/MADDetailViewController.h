//
//  MADDetailViewController.h
//  Presidents
//
//  Created by Ben Leduc-Mills on 11/1/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADDetailViewController : UIViewController <UISplitViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
