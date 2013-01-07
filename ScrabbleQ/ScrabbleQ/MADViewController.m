//
//  MADViewController.m
//  ScrabbleQ
//
//  Created by Ben Leduc-Mills on 10/23/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController () {
    NSDictionary *words;
    NSArray *letters;
}

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plistPath=[bundle pathForResource:@"qwordswithoutu" ofType:@"plist"];
    
    NSDictionary *dictionary=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    words=dictionary;
    
    NSArray *array=[[words allKeys] sortedArrayUsingSelector:@selector(compare:)];
    letters=array;
    
    self.title=@"Words"; //sets title of view controller
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    words=nil;
    letters=nil;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [letters count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString *letter=[letters objectAtIndex:section];
    NSArray *letterSection=[words objectForKey:letter];
    return [letterSection count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSUInteger section=[indexPath section]; //when a negative number doesn't make sense, use unsigned
   // NSUInteger row=[indexPath row];
    NSString *letter=[letters objectAtIndex:section];
    NSArray *wordsSection=[words objectForKey:letter];
    
    static NSString *CellIndentifier = @"CellIndentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
        
    }

    cell.textLabel.text = [wordsSection objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *letter=[letters objectAtIndex:section];
    return letter;
}

-(NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView {
    return letters;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
