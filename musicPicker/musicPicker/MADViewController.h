//
//  MADViewController.h
//  musicPicker
//
//  Created by Ben Leduc-Mills on 10/4/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource >
@property (weak, nonatomic) IBOutlet UIPickerView *musicPicker;
@property (weak, nonatomic) IBOutlet UILabel *choiceLabel;

@property(strong, nonatomic) NSArray *genre;
@property(strong, nonatomic) NSArray *decade;

@end
