//
//  MADViewController.h
//  Media
//
//  Created by Ben Leduc-Mills on 11/27/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileCoreServices/MobileCoreServices.h"
#import "MediaPlayer/MediaPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface MADViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender;

@end
