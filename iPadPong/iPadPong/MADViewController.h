//
//  MADViewController.h
//  iPadPong
//
//  Created by Ben Leduc-Mills on 9/28/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController {


IBOutlet UIImageView *ball;

IBOutlet UIImageView *playerPaddle;
IBOutlet UIImageView *computerPaddle;

IBOutlet UILabel *playerScoreText;
IBOutlet UILabel *computerScoreText;

IBOutlet UILabel *winOrLoseLabel;

CGPoint ballVelocity;

NSInteger gameState;

NSInteger playerScoreValue;
NSInteger computerScoreValue;


}

@property (nonatomic, retain)IBOutlet UIImageView *ball;

@property (nonatomic, retain)IBOutlet UIImageView *playerPaddle;
@property (nonatomic, retain)IBOutlet UIImageView *computerPaddle;

@property (nonatomic, retain)IBOutlet UILabel *playerScoreText;
@property (nonatomic, retain)IBOutlet UILabel *computerScoreText;


@property(nonatomic,retain)  IBOutlet UILabel *winOrLoseLabel;

@property(nonatomic) CGPoint ballVelocity;
@property(nonatomic) NSInteger gameState;

-(void)reset:(BOOL) newGame;



@end
