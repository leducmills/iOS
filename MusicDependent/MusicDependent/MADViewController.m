//
//  MADViewController.m
//  MusicDependent
//
//  Created by Ben Leduc-Mills on 10/9/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize choiceLabel;
@synthesize musicPicker;

@synthesize artistAlbums;
@synthesize artists;
@synthesize albums;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plistPath=[bundle pathForResource:@"artistalbums" ofType:@"plist"];
    
//    NSDictionary *dictionary=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
//    self.artistAlbums=dictionary;
    
    self.artistAlbums = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
//    NSArray *components = [self.artistAlbums allKeys];
//    self.artists=components;
    
    self.artists = [self.artistAlbums allKeys];
    
    NSString *selectedArtist=[self.artists objectAtIndex:0];
    
//    NSArray *array=[self.artistAlbums objectForKey:selectedArtist];
//    self.albums=array;
    
    self.albums = [self.artistAlbums objectForKey:selectedArtist];
	// Do any additional setup after loading the view, typically from a nib.
    //musicPicker.delegate = self;
    
}

- (void)viewDidUnload
{
    [self setChoiceLabel:nil];
    [self setMusicPicker:nil];
    self.artistAlbums=nil;
    self.artists=nil;
    self.albums=nil;
    
    
    [super viewDidUnload];
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
    
    if(component==artistComponent)
        return [self.artists count];
    else return [self.albums count];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if(component==artistComponent) {
        
        NSString *selectedArtist=[self.artists objectAtIndex:row];
        
        NSArray *array=[self.artistAlbums objectForKey:selectedArtist];
            self.albums=array;
        
        [musicPicker selectRow:0 inComponent:albumComponent animated:YES];
        [musicPicker reloadComponent:albumComponent];
        
    }
    
    NSInteger artistrow=[musicPicker selectedRowInComponent:artistComponent];
    NSInteger albumrow=[musicPicker selectedRowInComponent:albumComponent];
    
    choiceLabel.text=[NSString stringWithFormat:@"You like the album %@ by %@", [self.albums objectAtIndex:albumrow], [self.artists objectAtIndex:artistrow]];
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component==artistComponent) {
        return [self.artists objectAtIndex:row];
    }
    else return [self.albums objectAtIndex:row];
}

@end
