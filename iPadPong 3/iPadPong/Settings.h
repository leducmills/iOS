//
//  Settings.h
//  iPadPong
//
//  Created by Ben Leduc-Mills on 10/31/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

@property(nonatomic) NSInteger scoreToWin;
@property(nonatomic) CGFloat aiDifficulty;
@property(nonatomic) CGFloat ballSpeedX;
@property(nonatomic) CGFloat ballSpeedY;
@property(nonatomic) BOOL sound;
@property(nonatomic) BOOL sensors;


@end
