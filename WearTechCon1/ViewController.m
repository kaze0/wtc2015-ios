//
//  ViewController.m
//  WearTechCon1
//
//  Created by Mike DiGovanni on 2/9/15.
//  Copyright (c) 2015 Mike DiGovanni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)delay:(id)sender {
    NSLog(@"delayAction");
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.watchsettings"];
    BOOL enabled = [defaults boolForKey:@"enabled_preference"];
    
    NSLog(@"delay pressed: %@", enabled ? @"true" : @"false");
    
    [defaults setBool:!enabled forKey:@"enabled_preference"];
}

@end
