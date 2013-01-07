//
//  MADViewController.h
//  beatles
//
//  Created by Ben Leduc-Mills on 9/13/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *beatlesImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeNumberLabel;
@property (weak, nonatomic) IBOutlet UISwitch *capitalizedSwitch;


- (IBAction)changeImage:(UISegmentedControl *)sender;
- (IBAction)changeFontSlider:(UISlider *)sender;
- (IBAction)updateFont:(UISwitch *)sender;
@end
