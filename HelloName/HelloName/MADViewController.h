//
//  MADViewController.h
//  HelloName
//
//  Created by Ben Leduc-Mills on 9/4/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *messageField;
- (IBAction)textFieldDoneEditing:(id)sender;

@end
