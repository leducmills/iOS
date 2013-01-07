//
//  MADViewController.m
//  musicPicker
//
//  Created by Ben Leduc-Mills on 10/4/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize musicPicker;
@synthesize choiceLabel;
@synthesize genre, decade;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *array=[[NSArray alloc] initWithObjects:@"Country", @"Pop", @"Rock",@"Alternative", @"Hip Hop", @"Jazz", @"Classical", @"New Age", nil];
    self.genre=array;
    
    NSArray *array2=[[NSArray alloc] initWithObjects:@"1950s", @"1960s", @"1970s",@"1980s", @"1990s", @"2000s", @"2010s", nil];
    self.decade=array2;
    
}

- (void)viewDidUnload
{
    [self setMusicPicker:nil];
    [self setChoiceLabel:nil];
    [super viewDidUnload];
    self.genre=nil;
    self.decade=nil;
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}


- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component ==0) {
    return [genre count];
    }
    else return [decade count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component==0) {
    return [genre objectAtIndex:row];
    }
    else return [decade objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSInteger genrerow=[musicPicker selectedRowInComponent:0];
    NSInteger decaderow=[musicPicker selectedRowInComponent:1];
    
    choiceLabel.text=[NSString stringWithFormat:@"You Like %@ from the %@", [genre objectAtIndex:genrerow], [decade objectAtIndex:decaderow]];
    
    if([genre objectAtIndex:genrerow] == @"New Age") {
        choiceLabel.text=[NSString stringWithFormat:@"C'mon, nobody likes New Age!"];
    }
    
}

@end
