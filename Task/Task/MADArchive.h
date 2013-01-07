//
//  MADArchive.h
//  Task
//
//  Created by Ben Leduc-Mills on 12/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MADArchive : NSObject<NSCoding, NSCopying>

@property(copy, nonatomic)NSString *task1;
@property(copy, nonatomic)NSString *task2;
@property(copy, nonatomic)NSString *task3;
@property(copy, nonatomic)NSString *task4;

@end
