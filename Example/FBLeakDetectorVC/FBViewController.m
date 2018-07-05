//
//  FBViewController.m
//  FBLeakDetectorVC
//
//  Created by Filip Busic on 07/04/2018.
//  Copyright (c) 2018 Filip Busic. All rights reserved.
//

#import "FBViewController.h"

@implementation FBViewController

#pragma mark - IBAction(s)
- (IBAction)toLeakedAction:(id)sender {
  [self performSegueWithIdentifier:@"pushToLeakedVC" sender:nil];
}

@end
