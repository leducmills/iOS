//
//  MADViewController.m
//  Animation
//
//  Created by Ben Leduc-Mills on 11/15/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController () {
    CGPoint delta;
    NSTimer *timer;
    float ballRadius;
    CGPoint translation;
    float angle;
}

@end

@implementation MADViewController
@synthesize slider;
@synthesize sliderLabel;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ballRadius=imageView.frame.size.width/2;
    delta=CGPointMake(12.0, 4.0);
    translation=CGPointMake(0.0, 0.0);
    angle = 0;
    [self changeSliderValue];
}

- (void)viewDidUnload
{
    [self setSlider:nil];
    [self setSliderLabel:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)sliderMoved:(UISlider *)sender {
    
    [timer invalidate];
    [self changeSliderValue];
    
}


-(IBAction)changeSliderValue {
    sliderLabel.text=[NSString stringWithFormat:@"%.2f", slider.value];
    timer = [NSTimer scheduledTimerWithTimeInterval:slider.value
            target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (void) onTimer {
    
    [UIView beginAnimations:@"my_animation" context:nil];
    [UIView animateWithDuration:slider.value
                delay:0
                options:UIViewAnimationCurveLinear
                //animations:^{imageView.center = CGPointMake(imageView.center.x + delta.x, imageView.center.y + delta.y);}
                     animations:^{imageView.transform=CGAffineTransformMakeRotation(angle);}
                     completion:NULL];
    [UIView commitAnimations];
    
//    translation.x += delta.x;
//    translation.y += delta.y;
    
    angle+=0.04;
    if(angle>2*M_PI) {
        angle = 0;
    }

     imageView.center = CGPointMake(imageView.center.x + delta.x, imageView.center.y + delta.y);
    
    
//    if(imageView.center.x + translation.x > self.view.bounds.size.width - ballRadius || imageView.center.x + translation.x < ballRadius) {
//        delta.x = -delta.x;
//    }
//    
//    if(imageView.center.y + translation.y > self.view.bounds.size.height - ballRadius || imageView.center.y + translation.y < ballRadius) {
//        delta.y = -delta.y;
//    }
    
   
    
    if(imageView.center.x > self.view.bounds.size.width - ballRadius || imageView.center.x < ballRadius) {
        delta.x = -delta.x;
    }
    
    if(imageView.center.y > self.view.bounds.size.height - ballRadius || imageView.center.y < ballRadius) {
        delta.y = -delta.y;
    }
    
    
}

@end
