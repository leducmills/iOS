//
//  MADViewController.h
//  iPadPong
//
//  Created by Ben Leduc-Mills on 9/28/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import "RscMgr.h"

#define BUFFER_LEN 1024

@interface MADViewController : UIViewController<RscMgrDelegate> {

Settings *settings;
    
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
    
CGFloat ballSpeedX;
CGFloat ballSpeedY;
CGFloat computerMoveSpeed;
NSInteger scoreToWin;
BOOL sound;
BOOL sensors;

RscMgr *rscMgr;
UInt8 rxBuffer[BUFFER_LEN];
UInt8 txBuffer[BUFFER_LEN];

}

@property (nonatomic, strong) RscMgr *rscMgr;
@property(nonatomic) UInt8 rxBuffer;
@property(nonatomic) UInt8 txBuffer;
@property(nonatomic) BOOL sensors;

@property(nonatomic, strong) Settings *settings;

@property (nonatomic, retain)IBOutlet UIImageView *ball;

@property (nonatomic, retain)IBOutlet UIImageView *playerPaddle;
@property (nonatomic, retain)IBOutlet UIImageView *computerPaddle;

@property (nonatomic, retain)IBOutlet UILabel *playerScoreText;
@property (nonatomic, retain)IBOutlet UILabel *computerScoreText;


@property(nonatomic,retain)  IBOutlet UILabel *winOrLoseLabel;

@property(nonatomic) CGPoint ballVelocity;
@property(nonatomic) NSInteger gameState;

- (IBAction)settingsButtonPressed:(UIBarButtonItem *)sender;


@property(nonatomic) CGFloat ballSpeedX;
@property(nonatomic) CGFloat ballSpeedY;
@property(nonatomic) CGFloat computerMoveSpeed;
@property(nonatomic) NSInteger scoreToWin;
@property(nonatomic) BOOL sound;

    

-(void)reset:(BOOL) newGame;



@end
