//
//  FBLeakDetectorViewController.m
//  FBLeakDetectorVC
//
//  Created by Filip Busic on 7/4/18.
//

#import "FBLeakDetectorViewController.h"

@implementation FBLeakDetectorViewController

#pragma mark - Init methods
- (instancetype)init {
  self = [super init];
  if (self) {
    [self FBLeakDetectorViewControllerCommonInit];
  }
  return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self FBLeakDetectorViewControllerCommonInit];
  }
  return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self FBLeakDetectorViewControllerCommonInit];
  }
  return self;
}

#pragma mark - Common Init
- (void)FBLeakDetectorViewControllerCommonInit {
  self.leakDetectionDelay = 8.0;
}

#pragma mark - View Did Disappear
- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [self checkForLeaks];
}

#pragma mark - Private Methods
- (void)checkForLeaks {
  if (self.leakDetectorActionType != FBLeakDetectorActionTypeNone &&
      self.presentedViewController == nil &&
      (self.navigationController == nil || [self.navigationController.topViewController isEqual:self])) {
    __weak __typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.leakDetectionDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      __strong __typeof(weakSelf)strongSelf = weakSelf;
      if (strongSelf) {
        switch (strongSelf.leakDetectorActionType) {
          case FBLeakDetectorActionTypeLog:
            NSLog(@"FBLeakDetectorVC: <%@:%p> Did not deallocate successfully.", NSStringFromClass([strongSelf class]), &strongSelf);
            break;
            
          case FBLeakDetectorActionTypeException:
            [NSException raise:@"FBLeakDetectorVC: Found a leaked view controller!"
                        format:@"<%@:%p>: Did not deallocate successfully.", NSStringFromClass([strongSelf class]), &strongSelf];
            break;
            
          default:
            NSLog(@"FBLeakDetectorVC: A leak was found but the detection type was not supported. Choose between Log/Exception/None.");
            break;
        }
      }
    });
  }
}

@end
