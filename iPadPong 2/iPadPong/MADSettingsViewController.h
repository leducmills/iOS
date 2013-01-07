//
//  MADSettingsViewController.h
//  iPadPong
//
//  Created by Ben Leduc-Mills on 10/31/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"

@interface MADSettingsViewController : UIViewController


- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)scoreToWinSlider:(UISlider *)sender;
- (IBAction)AIDifficultySlider:(UISlider *)sender;
- (IBAction)ballSpeedXSlider:(UISlider *)sender;
- (IBAction)ballSpeedYSlider:(UISlider *)sender;
- (IBAction)soundSwitch:(UISwitch *)sender;

@property(nonatomic, strong) Settings *userSettings;

@property (weak, nonatomic) IBOutlet UISwitch *soundSwitchOutlet;
@property (weak, nonatomic) IBOutlet UISlider *scoreToWinOutlet;
@property (weak, nonatomic) IBOutlet UISlider *aiDiffOutlet;
@property (weak, nonatomic) IBOutlet UISlider *ballSpeedXOutlet;

@property (weak, nonatomic) IBOutlet UISlider *ballSpeedYOutlet;
@property (weak, nonatomic) IBOutlet UILabel *scoreToWinLabel;
@property (weak, nonatomic) IBOutlet UILabel *aiDiffLabel;
@property (weak, nonatomic) IBOutlet UILabel *ballSpeedXLabel;
@property (weak, nonatomic) IBOutlet UILabel *ballSpeedYLabel;

@end
