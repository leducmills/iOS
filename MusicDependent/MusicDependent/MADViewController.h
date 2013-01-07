//
//  MADViewController.h
//  MusicDependent
//
//  Created by Ben Leduc-Mills on 10/9/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

#define artistComponent 0
#define albumComponent 1

@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *choiceLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *musicPicker;

@property(strong, nonatomic) NSDictionary *artistAlbums;
@property(strong, nonatomic) NSArray *artists;
@property(strong, nonatomic) NSArray *albums;

@end
