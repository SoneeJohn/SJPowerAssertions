//
//  SJPowerAssertions.h
//  SJPowerAssertions
//
//  Created by Soneé John on 9/18/14.
//  Copyright (c) 2014 AlphaSoft. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <IOKit/pwr_mgt/IOPMLib.h>

@interface SJPowerAssertions : NSObject
    
typedef NS_ENUM(NSUInteger, SJPowerAssertionType) {
    
    /**
     Will cause the system from idle sleeping. Note: The display may idle sleep, if you do not want the display to idle sleep use "SJPowerAssertionsPreventDisplayIdleSleep"
     */
    
    SJPowerAssertionsPreventIdleSleep  = 1,
    
    /**
     Will cause the system's display from idle sleeping
     */
    SJPowerAssertionsPreventDisplayIdleSleep = 2,
    
    
};
+ (instancetype) defaultAssertion;

/**
 Creates a power assertion.
 
 @param description A string that describes the name of the activity (e.g. "Downloading video files" Name may be no longer than 128 characters.
 
 @param assertionType The type of power assertion to create (e.g. "SJPowerAssertionsPreventIdleSleep"
 
 @param error Will be nil if no error has occurred.
 
 */
-(void)createPowerAssertion:(NSString *)description assertionType:(SJPowerAssertionType)assertionType completionHandler:(void (^) (NSError *error))completionHandler;

/**
 Releases the current power assertion
 */

-(void)stopHoldingAssertion;

 @property IOPMAssertionID currentPowerAssertion;

@end


