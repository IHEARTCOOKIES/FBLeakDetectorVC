//
//  FBLeakedViewController.m
//  FBLeakDetectorVC_Example
//
//  Created by Filip Busic on 7/4/18.
//  Copyright © 2018 Filip Busic. All rights reserved.
//

#import "FBLeakedViewController.h"

typedef void(^SomeRetainedBlock)(void);
@interface FBLeakedViewController ()
@property (nonatomic, copy, readwrite) SomeRetainedBlock block;
@end

@implementation FBLeakedViewController

#pragma mark - Leak Detection Action Type
- (FBLeakDetectorActionType)leakDetectorActionType {
  return FBLeakDetectorActionTypeException;
}

#pragma mark - View Did Load
- (void)viewDidLoad {
  [super viewDidLoad];
  
  // This should keep this VC in memory
  self.block = ^{
    NSLog(@"Self is: %@", self);
  };
}

#pragma mark - IBAction(s)
- (IBAction)dismissAction:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
