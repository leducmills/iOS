//
//  MADViewController.m
//  beatles
//
//  Created by Ben Leduc-Mills on 9/13/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize beatlesImage;
@synthesize titleLabel;
@synthesize imageControl;
@synthesize fontSizeNumberLabel;
@synthesize capitalizedSwitch;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBeatlesImage:nil];
    [self setTitleLabel:nil];
    [self setImageControl:nil];
    [self setFontSizeNumberLabel:nil];
    [self setCapitalizedSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self updateCaps];
}

- (void)updateImage {
    if(imageControl.selectedSegmentIndex == 0) {
        titleLabel.text=@"Young Beatles";
        beatlesImage.image=[UIImage imageNamed:@"beatles1.png"];
    } else if (imageControl.selectedSegmentIndex==1) {
        titleLabel.text=@"Older Beatles";
        beatlesImage.image=[UIImage imageNamed:@"beatles2.png"];
    }
}

- (void) updateCaps {
    if(capitalizedSwitch.isOn) {
        titleLabel.text=[titleLabel.text uppercaseString];
    } else {
        titleLabel.text=[titleLabel.text lowercaseString];
    }
}

- (IBAction)changeFontSlider:(UISlider *)sender {
    
    int fontSize = sender.value;
    
    fontSizeNumberLabel.text=[NSString stringWithFormat:@"%d", fontSize];
    
    UIFont *newFont = [UIFont systemFontOfSize:fontSize];
    
    titleLabel.font=newFont;
    
}

- (IBAction)updateFont:(UISwitch *)sender {
    [self updateCaps];
    
}
@end
