//
//  MADViewController.h
//  HelloWorld3
//
//  Created by Ben Leduc-Mills on 9/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *nyImage;
@property (weak, nonatomic) IBOutlet UILabel *messageField;

- (IBAction)chooseTeam:(UIButton *)sender;


@end
