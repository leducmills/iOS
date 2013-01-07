//
//  GameDetailsViewController.h
//  GameScores
//
//  Created by Ben Leduc-Mills on 11/8/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GameDetailsViewController;
@protocol GameDetailsViewControllerDelegate <NSObject>
    
            
- (void) gameDetailsViewControllerDidCancel: (GameDetailsViewController *)controller;
- (void) gameDetailsViewController:(GameDetailsViewController *)controller DidSave:(NSString *)newGame;

@end

@interface GameDetailsViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property(weak, nonatomic)id<GameDetailsViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;

@end
