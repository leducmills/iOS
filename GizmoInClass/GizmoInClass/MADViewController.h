//
//  MADViewController.h
//  GizmoInClass
//
//  Created by Ben Leduc-Mills on 12/6/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIAccelerometerDelegate> {
//    IBOutlet UILabel *pointsLabel;
//    IBOutlet UILabel *highScoreLabel;
//    
//    IBOutlet UIImageView *ball;
//    IBOutlet UIImageView *sliderbar;
//    IBOutlet UIImageView *bg;
//    IBOutlet UIImageView *bg2;
//    CGPoint ballVelocity;
}

@property(retain, nonatomic) IBOutlet UILabel *highScoreLabel;
@property(retain, nonatomic) IBOutlet UILabel *pointsLabel;

@property(nonatomic,retain) IBOutlet UIImageView *ball;
@property(nonatomic,retain) IBOutlet UIImageView *sliderBar;
@property(nonatomic,retain) IBOutlet UIImageView *bg;
@property(nonatomic,retain) IBOutlet UIImageView *bg2;
@property(nonatomic) CGPoint ballVelocity;


@end
