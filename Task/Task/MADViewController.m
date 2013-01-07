//
//  MADViewController.m
//  Task
//
//  Created by Ben Leduc-Mills on 12/11/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"
#import "MADArchive.h"

//#define kFilename @"data.plist"
#define kFilename @"archive"
#define kDataKey @"Data"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize task1;
@synthesize task2;
@synthesize task3;
@synthesize task4;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath=[self dataFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        
        NSData *data=[[NSMutableData alloc]initWithContentsOfFile:[self dataFilePath]];
        
        NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        MADArchive *taskArchive=[unarchiver decodeObjectForKey:kDataKey];
        [unarchiver finishDecoding];
        task1.text=taskArchive.task1;
        task2.text=taskArchive.task2;
        task3.text=taskArchive.task3;
        task4.text=taskArchive.task4;
        
        
        
//        NSArray *dataArray = [[NSArray alloc]initWithContentsOfFile:filePath];
//        
//        task1.text=[dataArray objectAtIndex:0];
//        task2.text=[dataArray objectAtIndex:1];
//        task3.text=[dataArray objectAtIndex:2];
//        task4.text=[dataArray objectAtIndex:3];
    }
    
    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

- (void)viewDidUnload
{
    [self setTask1:nil];
    [self setTask2:nil];
    [self setTask3:nil];
    [self setTask4:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSString *)dataFilePath {
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory=[paths objectAtIndex:0];
    
    return[docDirectory stringByAppendingPathComponent:kFilename];
    NSLog(@"%@", [docDirectory stringByAppendingPathComponent:kFilename]);
}

-(void)applicationWillResignActive:(NSNotification *)notification {
    
    MADArchive *taskArchive=[[MADArchive alloc]init];
    
    taskArchive.task1=task1.text;
    taskArchive.task2=task2.text;
    taskArchive.task3=task3.text;
    taskArchive.task4=task4.text;
    
    NSMutableData *data=[[NSMutableData alloc]init];
    
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:taskArchive forKey:kDataKey];
    [archiver finishEncoding];
    
    [data writeToFile:[self dataFilePath] atomically:YES];
    
    
    
//    NSMutableArray *array=[[NSMutableArray alloc]init];
//    [array addObject:task1.text];
//    [array addObject:task2.text];
//    [array addObject:task3.text];
//    [array addObject:task4.text];
//    
//    [array writeToFile:[self dataFilePath] atomically:YES];
}

@end
