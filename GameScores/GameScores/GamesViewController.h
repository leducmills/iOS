//
//  GamesViewController.h
//  GameScores
//
//  Created by Ben Leduc-Mills on 11/6/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDetailsViewController.h"

@interface GamesViewController : UITableViewController <GameDetailsViewControllerDelegate>

@property(strong, nonatomic) NSMutableArray *games;
@property(strong, nonatomic) NSMutableArray *scores;
@property(copy, nonatomic) NSDictionary *editedSelection;


@end
