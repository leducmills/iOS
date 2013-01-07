//
//  MADViewController.m
//  Media
//
//  Created by Ben Leduc-Mills on 11/27/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController () {
    UIImage *image;
    NSURL *videoURL;
    AVAudioPlayer *audioPlayer;
}

@end

@implementation MADViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender {
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        imagePickerController.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeImage, (NSString *)kUTTypeMovie, nil];
        
        [self presentModalViewController:imagePickerController animated:YES];
        
        
    } else {
        NSLog(@"Can't access the camera");
    }
    
    
}

- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    
    if(image || videoURL) {
        
        [actionSheet addButtonWithTitle:@"Save"];
    }
    
    [actionSheet addButtonWithTitle:@"Camera Roll"];
    [actionSheet addButtonWithTitle:@"Play Audio"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    
    actionSheet.cancelButtonIndex = actionSheet.numberOfButtons -1;
    
    [actionSheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if([buttonTitle isEqualToString:@"Save"]) {
        if(image) {
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
        
        else if(videoURL) {
            
            NSString *urlString = [videoURL path];
            
            if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlString)) {
                
                UISaveVideoAtPathToSavedPhotosAlbum(urlString, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
            }
            
        }
    }
    else if ([buttonTitle isEqualToString:@"Camera Roll"]) {
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        imagePickerController.allowsEditing=NO;
        imagePickerController.delegate = self;
        [self presentModalViewController:imagePickerController animated:YES];
        
    }
    
    else if ([buttonTitle isEqualToString:@"Play Audio"])
	{
		
		NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"started" ofType:@"m4r"];
		NSURL *fileURL = [NSURL URLWithString:soundFilePath];
		
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
		audioPlayer.delegate = self;
		[audioPlayer play];
	}
}


- (void) image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if(error) {
        NSLog(@"error! %@", [error localizedDescription]);
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Image Saved" message:@"Image Saved successfully." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}


- (void) video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if(error) {
        NSLog(@"error! %@", [error localizedDescription]);
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Video Saved" message:@"Video Saved successfully." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    image = nil;
    imageView.image = nil;
    videoURL = nil;
    
    if([mediaType isEqualToString:(NSString *) kUTTypeImage]) {
        
        UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        
        image = editedImage ? editedImage : originalImage;
        imageView.image = image;
    }
    
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
    }
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated:YES];
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
	audioPlayer = nil;
}


- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
	audioPlayer = nil;
}


@end
