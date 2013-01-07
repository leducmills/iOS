//
//  MADViewController.m
//  iPadPong
//
//  Created by Ben Leduc-Mills on 9/28/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//
//  Adapted (for the iPad and for left-handed players and with sound    ) from Jack McGrath
//  http://www.technobuffalo.com/companies/apple/introduction-to-ios-development-programming-pong-part-1/
//

#import "MADViewController.h"
#import <AudioToolbox/AudioToolbox.h>


//Some unchaning variables
#define gameStateRunning 1
#define gameStatePaused  2

#define ballSpeedX 4.2
#define ballSpeedY 5.2

#define computerMoveSpeed 4.2
#define scoreToWin 7

@interface MADViewController ()

@end

@implementation MADViewController

@synthesize playerPaddle, computerPaddle, ball;

@synthesize playerScoreText;
@synthesize computerScoreText;

@synthesize winOrLoseLabel,ballVelocity,gameState;


- (void)viewDidLoad
{
    [super viewDidLoad];
	//Set game state to paused on load so it doesn't start without you
    self.gameState = gameStatePaused;
    ballVelocity = CGPointMake(ballSpeedX,ballSpeedY);
    
    //Have the timer start, running the gameLoop every .01 seconds
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
    
    winOrLoseLabel.hidden = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
   
    if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight){
        return YES;
    }

    return NO;
    
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //keep track of user touch to un-pause the game (if user touches screnn, game starts)
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    self.gameState = gameStateRunning;
    
     //keep track of user touch to control the user's paddle 
    if(location.x < 115) {
        CGPoint yLocation = CGPointMake(playerPaddle.center.x, location.y);
        playerPaddle.center = yLocation;
    }
    
}

-(void) playPaddleSound {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"boing2"
                                                     ofType:@"wav"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID(
                                     (__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    AudioServicesPlaySystemSound (soundID);
    
}


-(void) gameLoop {
    //if gamestate is running, play Pong!
    if(gameState == gameStateRunning) {
        
        //keep labels hidden during play
        playerScoreText.hidden = YES;
        computerScoreText.hidden = YES;
        winOrLoseLabel.hidden = YES;
        
        //ball movement logic (for out of bounds and paddle detection)
        ball.center = CGPointMake(ball.center.x + ballVelocity.x , ball.center.y + ballVelocity.y);
        
        if(ball.center.x > self.view.bounds.size.width || ball.center.x < 0) {
            ballVelocity.x = -ballVelocity.x;
        }
        
        if(ball.center.y > self.view.bounds.size.height || ball.center.y < 0) {
            ballVelocity.y = -ballVelocity.y;
        }
        
        if (CGRectIntersectsRect (ball.frame, playerPaddle.frame)) {
            CGRect frame = ball.frame;
            frame.origin.x = CGRectGetMaxX(playerPaddle.frame);
            ball.frame = frame;
            ballVelocity.x = -ballVelocity.x;
        
           [self playPaddleSound];
            
            
        }
        
        if (CGRectIntersectsRect (ball.frame, computerPaddle.frame)) {
            CGRect frame = ball.frame;
            frame.origin.x = computerPaddle.frame.origin.x - frame.size.height;
            //frame.origin.x = CGRectGetMaxX(computerPaddle.frame);
            ball.frame = frame;
            ballVelocity.x = -ballVelocity.x;
            
            [self playPaddleSound];
   
            
            
        }
        
        // Computer Paddle Logic (follows ball position past a certain point on the screen)
        if(ball.center.x - 200 >= self.view.center.x) {
            if(ball.center.y < computerPaddle.center.y) {
                CGPoint compLocation = CGPointMake(computerPaddle.center.x, computerPaddle.center.y - computerMoveSpeed);
                computerPaddle.center = compLocation;
            }
            
            if(ball.center.y > computerPaddle.center.y) {
                CGPoint compLocation = CGPointMake(computerPaddle.center.x, computerPaddle.center.y + computerMoveSpeed);
                computerPaddle.center = compLocation;
            }
        }
        
        // Scoring Logic
        if(ball.center.x <= 0) {
            computerScoreValue++;
            [self reset:(computerScoreValue >= scoreToWin)];
        }
        
        if(ball.center.x > self.view.bounds.size.width) {
            playerScoreValue++;
            [self reset:(playerScoreValue >= scoreToWin)];
        }
    }
}


-(void)reset:(BOOL) newGame {
    self.gameState = gameStatePaused;
    
    //ball.center = CGPointMake(241, 159);
    ball.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    
    playerScoreText.hidden = NO;
    computerScoreText.hidden = NO;
    
    playerScoreText.text = [NSString stringWithFormat:@"%d",playerScoreValue];
    computerScoreText.text = [NSString stringWithFormat:@"%d",computerScoreValue];
    
    if(newGame) {
        winOrLoseLabel.hidden = NO;
        
        if(computerScoreValue > playerScoreValue) {
            winOrLoseLabel.text = @"Game Over - You Lose!";
        } else {
            winOrLoseLabel.text = @"You Win!";
        }
        
        computerScoreValue = 0;
        playerScoreValue = 0;
    }
}

@end
