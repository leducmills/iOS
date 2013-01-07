//
//  MADViewController.m
//  GizmoInClass
//
//  Created by Ben Leduc-Mills on 12/6/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize pointsLabel,ball,ballVelocity,sliderBar,highScoreLabel,bg,bg2;

float gravityMagnitude;
float accX;
float accY;
float flipRotation;
int points = 0;
int ballSize = 80;
int highScore = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self resetBall];
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0/30.0];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(void) displayHighScore {
    //Create the format to display X and Y as ints...
    NSNumberFormatter *intFormatter=[[NSNumberFormatter alloc]init];
    [intFormatter setNumberStyle:NSNumberFormatterNoStyle];
    highScoreLabel.text=[intFormatter stringFromNumber:[NSNumber numberWithFloat:highScore]];
    
    //    [intFormatter release];
}
-(void) displayScore {
    //Create the format to display X and Y as ints...
    NSNumberFormatter *intFormatter=[[NSNumberFormatter alloc]init];
    [intFormatter setNumberStyle:NSNumberFormatterNoStyle];
    pointsLabel.text=[intFormatter stringFromNumber:[NSNumber numberWithFloat:points]];
    //    [intFormatter release];
}


-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    accX = acceleration.x*10;
    accY = acceleration.y*-10;
    flipRotation += 0.1;
}

-(void) resetBall {
    ballSize=80;
    ball.center = CGPointMake(100+arc4random() % 600, -100);
    ballVelocity.x = (arc4random() %10);
    ballVelocity.x = ballVelocity.x-5;
    ballVelocity.y = 1;
    gravityMagnitude=.02;
}

-(void) gameLoop {
    ballVelocity.y=ballVelocity.y+gravityMagnitude;
    ballVelocity.x=ballVelocity.x;
    ball.center = CGPointMake(ball.center.x + ballVelocity.x, ball.center.y + ballVelocity.y);
    sliderBar.center=CGPointMake(sliderBar.center.x+accX*3, sliderBar.center.y+accY*3);
    
    //Make sure the slider (bumper) can't go out of bounds...
    if(sliderBar.center.y+20>self.view.bounds.size.height){
        sliderBar.center=CGPointMake(sliderBar.center.x, self.view.bounds.size.height-20);
    }
    if(sliderBar.center.y<100){
        sliderBar.center=CGPointMake(sliderBar.center.x, 100);
    }
    if(sliderBar.center.x+50>self.view.bounds.size.width){
        sliderBar.center=CGPointMake(self.view.bounds.size.width-50, sliderBar.center.y);
    }
    if(sliderBar.center.x<50){
        sliderBar.center=CGPointMake(50, sliderBar.center.y);
    }
    
    //Make sure ball bounces off walls
    if(ball.center.x > self.view.bounds.size.width-50) { //Detect collision with walls of the iPad...
        ball.center = CGPointMake(self.view.bounds.size.width-49, ball.center.y);
        ballVelocity.x = -0.8*ballVelocity.x;
    }
    if(ball.center.x < 50) { //Detect collision with walls of the iPad...
        ball.center = CGPointMake(51, ball.center.y);
        ballVelocity.x = -0.8*ballVelocity.x;
    }
    if(ball.center.y < 50) { //Detect collision with ceiling of iPad.
        ball.center = CGPointMake(ball.center.x, 51);
        ballVelocity.y = -0.8*ballVelocity.y;
    }
    
    if(ball.center.y > self.view.bounds.size.height+100) { //Detect collision with 500px from bottom...
        points=0;
        [self displayScore];
        [self resetBall];
        return;
    }
    if(ballSize<4){
        [self resetBall];
        return;
    }
    
    if(ballVelocity.y > 0) {
        //Detect collision with the ball
        if(ball.center.y > sliderBar.center.y-55) {
            if(ball.center.y < sliderBar.center.y+55) {
                if(ball.center.x > sliderBar.center.x-80) {
                    if(ball.center.x < sliderBar.center.x+80 && ball.center.y>40) {
                        ballVelocity.x=(ballVelocity.x+accX*3);//Adding AACX gives us some x variation to simulate spin...
                        ballVelocity.y=0.9*(ballVelocity.y);
                        ballSize=ballSize*1;
                        points++;
                        if(points>highScore){
                            highScore=points;
                            [self displayHighScore];
                        }
                        [self displayScore];
                    }
                }
            }
        }//end detecting collision with ball
    }
    
    
    ball.transform = CGAffineTransformMakeRotation(flipRotation);
    //bg.transform = CGAffineTransformMakeRotation(flipRotation);
    bg2.transform = CGAffineTransformMakeRotation(-1*flipRotation);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
