//
//  MADViewController.h
//  HelloWorld2
//
//  Created by Ben Leduc-Mills on 9/4/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

- (IBAction)buttonPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *messageText;

@end
