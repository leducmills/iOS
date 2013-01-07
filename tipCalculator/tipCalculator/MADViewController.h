//
//  MADViewController.h
//  tipCalculator
//
//  Created by Ben Leduc-Mills on 9/18/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *checkAmount;
@property (weak, nonatomic) IBOutlet UITextField *tipPercent;
@property (weak, nonatomic) IBOutlet UITextField *people;
@property (weak, nonatomic) IBOutlet UILabel *tipDue;
@property (weak, nonatomic) IBOutlet UILabel *totalDue;
@property (weak, nonatomic) IBOutlet UILabel *totalDuePerPerson;

- (IBAction)calcButton:(UIButton *)sender;

@end
