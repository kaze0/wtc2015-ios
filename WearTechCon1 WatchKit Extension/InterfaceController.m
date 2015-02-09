//
//  InterfaceController.m
//  WearTechCon1 WatchKit Extension
//
//  Created by Mike DiGovanni on 2/9/15.
//  Copyright (c) 2015 Mike DiGovanni. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceButton *drinkButton;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *delayButton;
- (IBAction)delay;
@property (weak, nonatomic) IBOutlet WKInterfaceMap *map;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(37, -122);
    MKCoordinateSpan span = MKCoordinateSpanMake(10, 10);
    
    [self.map addAnnotation:coord withPinColor:WKInterfaceMapPinColorPurple];
    [self.map setRegion:MKCoordinateRegionMake(coord, span)];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void) handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)remoteNotification {
    NSLog(@"watch:handleActionWithIdentifier %@", identifier);
    [WKInterfaceController openParentApplication:remoteNotification reply:nil]; //Tell the app to do something based on this notification
}

- (IBAction)delay {
    NSLog(@"delayAction");
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.watchsettings"];
    BOOL enabled = [defaults boolForKey:@"enabled_preference"];

    NSLog(@"delay pressed: %@", enabled ? @"true" : @"false");
    
    [defaults setBool:!enabled forKey:@"enabled_preference"];
}
- (IBAction)drink {
    NSLog(@"drinkAction");
}
@end



