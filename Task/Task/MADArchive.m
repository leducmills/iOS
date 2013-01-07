//
//  MADArchive.m
//  Task
//
//  Created by Ben Leduc-Mills on 12/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADArchive.h"

#define kTask1key @"Task1"
#define kTask2key @"Task2"
#define kTask3key @"Task3"
#define kTask4key @"Task4"

@implementation MADArchive

@synthesize task1, task2, task3, task4;


-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:task1 forKey:kTask1key];
    [aCoder encodeObject:task2 forKey:kTask2key];
    [aCoder encodeObject:task3 forKey:kTask3key];
    [aCoder encodeObject:task4 forKey:kTask4key];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if(self=[super init]) {
        task1=[aDecoder decodeObjectForKey:kTask1key];
        task2=[aDecoder decodeObjectForKey:kTask2key];
        task3=[aDecoder decodeObjectForKey:kTask3key];
        task4=[aDecoder decodeObjectForKey:kTask4key];
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone {
    MADArchive *copy=[[[self class]allocWithZone:zone]init];
    copy.task1=[self.task1 copyWithZone:zone];
    copy.task1=[self.task2 copyWithZone:zone];
    copy.task1=[self.task3 copyWithZone:zone];
    copy.task1=[self.task4 copyWithZone:zone];
    return copy;
}

@end
