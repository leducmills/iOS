//
//  MADViewController.m
//  Continents
//
//  Created by Ben Leduc-Mills on 10/23/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController () {
    NSDictionary *continentData;
}

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plistPath=[bundle pathForResource:@"continents" ofType:@"plist"];
    
    NSDictionary *dictionary=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    continentData=dictionary;
    self.title=@"Continents"; //sets title of view controller
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    continentData=nil;
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [continentData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIndentifier = @"CellIndentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIndentifier];
    
    }
    UIImage *world=[UIImage imageNamed:@"world.png"];
    cell.imageView.image=world;
    
    cell.detailTextLabel.text=@"A continent";
    
    NSArray *rowData=[continentData allKeys];
    cell.textLabel.text = [rowData objectAtIndex:indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rowData=[continentData allKeys];
    NSString *rowValue=[rowData objectAtIndex:indexPath.row];
    NSString *message=[[NSString alloc] initWithFormat:@"You Selected %@", rowValue];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Row Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
