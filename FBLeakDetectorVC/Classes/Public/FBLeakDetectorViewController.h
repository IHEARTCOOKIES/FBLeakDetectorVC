//
//  FBLeakDetectorViewController.h
//  FBLeakDetectorVC
//
//  Created by Filip Busic on 7/4/18.
//

#import <UIKit/UIKit.h>

/** Types of actions for when the leak detector finds a leak. */
typedef NS_ENUM(NSUInteger, FBLeakDetectorActionType) {
  /** -Log will NSLog a message of the potentially leaked view controller along with its address. */
  FBLeakDetectorActionTypeLog = 0,
  
  /** -Assert will raise a NSException if the leak detector finds a leak. */
  FBLeakDetectorActionTypeException,
  
  /** -None will do nothing if the leak detector finds a leak. */
  FBLeakDetectorActionTypeNone
};

@interface FBLeakDetectorViewController : UIViewController

/** ENUM for the action of the leak detector. Override this property in the View Controller and set it to either Log/Exception/None. This property defaults to `FBLeakDetectorActionTypeLog`. */
@property (nonatomic, assign, readonly) FBLeakDetectorActionType leakDetectorActionType;

/** A delay for how long we should wait before we start checking for leaks after the view controller disappears. This property defaults to 8.0 seconds. */
@property (nonatomic, assign, readwrite) NSTimeInterval leakDetectionDelay;

@end
