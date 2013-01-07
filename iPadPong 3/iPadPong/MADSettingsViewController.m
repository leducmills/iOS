//
//  MADSettingsViewController.m
//  iPadPong
//
//  Created by Ben Leduc-Mills on 10/31/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADSettingsViewController.h"
#import "MADViewController.h"

@interface MADSettingsViewController ()

@end

@implementation MADSettingsViewController
@synthesize userSettings;
@synthesize soundSwitchOutlet;
@synthesize scoreToWinOutlet;
@synthesize aiDiffOutlet;
@synthesize ballSpeedXOutlet;
@synthesize ballSpeedYOutlet;
@synthesize scoreToWinLabel;
@synthesize aiDiffLabel;
@synthesize ballSpeedXLabel;
@synthesize ballSpeedYLabel;
@synthesize sensorToggleOutlet;



-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    if(userSettings.sound == YES) {
        [soundSwitchOutlet setOn:YES];
    }
    else [soundSwitchOutlet setOn:NO];
    
    if(userSettings.sensors == YES) {
        [sensorToggleOutlet setOn:YES];
    }
    else [sensorToggleOutlet setOn:NO];
    
    [scoreToWinOutlet setValue:userSettings.scoreToWin];
    [aiDiffOutlet setValue:userSettings.aiDifficulty];
    [ballSpeedXOutlet setValue:userSettings.ballSpeedX];
    [ballSpeedYOutlet setValue:userSettings.ballSpeedY];
    
    scoreToWinLabel.text = [NSString stringWithFormat:@"%d", userSettings.scoreToWin];
    aiDiffLabel.text = [NSString stringWithFormat:@"%.02f", userSettings.aiDifficulty];
    ballSpeedXLabel.text = [NSString stringWithFormat:@"%.02f", userSettings.ballSpeedX];
    ballSpeedYLabel.text = [NSString stringWithFormat:@"%.02f", userSettings.ballSpeedY];
    
       
    
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
    
}

- (void)viewDidUnload
{
    [self setSoundSwitchOutlet:nil];
    [self setScoreToWinOutlet:nil];
    [self setAiDiffOutlet:nil];
    [self setBallSpeedXOutlet:nil];
    [self setBallSpeedYOutlet:nil];
    [self setScoreToWinLabel:nil];
    [self setAiDiffLabel:nil];
    [self setBallSpeedXLabel:nil];
    [self setBallSpeedYLabel:nil];
    [self setSensorToggleOutlet:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        return YES;
    }
    
    return NO;
}

- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender {


    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)scoreToWinSlider:(UISlider *)sender {
    
    NSInteger value = sender.value;
    userSettings.scoreToWin = value;
    
    scoreToWinLabel.text = [NSString stringWithFormat:@"%d", userSettings.scoreToWin];
    
    NSLog(@"sendervalue: %d", userSettings.scoreToWin);
    
}

- (IBAction)AIDifficultySlider:(UISlider *)sender {
    
    userSettings.aiDifficulty = sender.value;
    aiDiffLabel.text = [NSString stringWithFormat:@"%.02f", userSettings.aiDifficulty];
    NSLog(@"ai diff: %f", sender.value);
}

- (IBAction)ballSpeedXSlider:(UISlider *)sender {
    
    userSettings.ballSpeedX = sender.value;
    ballSpeedXLabel.text = [NSString stringWithFormat:@"%.02f", userSettings.ballSpeedX];
}

- (IBAction)ballSpeedYSlider:(UISlider *)sender {
    
    userSettings.ballSpeedY = sender.value;
    ballSpeedYLabel.text = [NSString stringWithFormat:@"%.02f", userSettings.ballSpeedY];
}

- (IBAction)soundSwitch:(UISwitch *)sender {
    if(soundSwitchOutlet.isOn) {
        userSettings.sound = YES;
    }
    else userSettings.sound = NO;
    
    NSLog(@"sounds:, %d", userSettings.sound);
    
}

- (IBAction)sensorSwitch:(UISwitch *)sender {
    if(sensorToggleOutlet.isOn) {
        userSettings.sensors = YES;
    }
    else userSettings.sensors = NO;
}
@end
