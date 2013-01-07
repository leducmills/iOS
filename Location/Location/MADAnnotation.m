//
//  MADAnnotation.m
//  Location
//
//  Created by Ben Leduc-Mills on 11/29/12.
//  Copyright (c) 2012 Ben Leduc-Mills. All rights reserved.
//

#import "MADAnnotation.h"

@implementation MADAnnotation

@synthesize coordinate, title, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coor {
    coordinate = coor;
    title=@"You are here:";
    subtitle=[NSString stringWithFormat:@"Latitude: %f. Longitude: %f", coordinate.latitude, coordinate.longitude];
    return self;

}

- (void) moveAnnotation:(CLLocationCoordinate2D)newCoordinate {
    [self willChangeValueForKey:@"coordinate"];
    [self willChangeValueForKey:@"subtitle"];
    coordinate = newCoordinate;
    subtitle = [[NSString alloc] initWithFormat:@"Latitude: %f. Longitude: %f", coordinate.latitude, coordinate.longitude];
    [self didChangeValueForKey:@"coordinate"];
    [self didChangeValueForKey:@"subtitle"];
}

@end
