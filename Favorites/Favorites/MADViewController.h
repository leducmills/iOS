//
//  MADViewController.h
//  Favorites
//
//  Created by Ben Leduc-Mills on 10/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface MADViewController : UIViewController {
    Favorite *user;
}
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UITextView *quoteText;
- (IBAction)infoButtonTapped:(UIBarButtonItem *)sender;

@end
