//
//  CCHViewController.m
//  device
//
//  Created by Kevin Lee on 8/7/14.
//  Copyright (c) 2014 ChaiONE. All rights reserved.
//

#import "CCHViewController.h"

@interface CCHViewController ()

@end

@implementation CCHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateTapped:(id)sender {
    [[CCHDevice sharedInstance] updateDeviceWithAlias:@"kevin" tags:@[@"tag1", @"tag2", @"alias"] completionHandler:^(NSDictionary *device, NSError *error) {
        if (error) {
            NSLog(@"Error during update: %@", error);
        } else {
            NSLog(@"Updated devic info: %@", device);
        }
    }];
}

- (IBAction)getByTagTapped:(id)sender {
    [[CCHDevice sharedInstance] getDevicesWithTags:@[@"alias"] completionHandler:^(NSArray *devices, NSError *error) {
        if (error) {
            NSLog(@"Error getting by tag, %@", error);
        } else {
            NSLog(@"Get by tags %@", devices);
        }
    }];
}


- (IBAction)getByAliasTapped:(id)sender {
    [[CCHDevice sharedInstance] getDevicesWithAlias:@"kevin" completionHandler:^(NSArray *devices, NSError *error) {
        if (error) {
            NSLog(@"Error getting by alias, %@", error);
        } else {
            NSLog(@"Get by alias %@", devices);
        }
    }];
}

- (IBAction)getByIdTapped:(id)sender {
    CCHDevice *device = [CCHDevice sharedInstance];
    [device getDeviceWithId:device.deviceId completionHandler:^(NSDictionary *device, NSError *error) {
        if (error) {
            NSLog(@"Error get by id %@", error);
        } else {
            NSLog(@"Device: %@", device);
        }
    }];
}
@end
