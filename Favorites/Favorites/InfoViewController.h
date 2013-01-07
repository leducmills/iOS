//
//  InfoViewController.h
//  Favorites
//
//  Created by Ben Leduc-Mills on 10/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface InfoViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userWord;

@property (weak, nonatomic) IBOutlet UITextView *userQuote;
- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender;

@property(strong, nonatomic)Favorite *userInfo;

@end
