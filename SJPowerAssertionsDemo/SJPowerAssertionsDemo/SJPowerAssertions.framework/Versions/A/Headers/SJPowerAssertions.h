//
//  SJPowerAssertions.h
//  SJPowerAssertions
//
//  Created by Soneé John on 9/18/14.
//  Copyright (c) 2014 AlphaSoft. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <IOKit/pwr_mgt/IOPMLib.h>
@protocol SJPowerAssertionsDelegate;

@interface SJPowerAssertions : NSObject{
    

}

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

/**
 Creates a power assertion.
 
 @param description A string that describes the name of the activity (e.g. "Downloading video files" Name may be no longer than 128 characters.
 
 @param assertionType The type of power assertion to create (e.g. "SJPowerAssertionsPreventIdleSleep"
 
 @param error Will be nil if no error has occurred.
 
 @param assertionID Returns the assertion ID.
 
 */
-(void)createPowerAssertion:(NSString *)description assertionType:(SJPowerAssertionType)assertionType completionHandler:(void (^) (NSError *error, unsigned int *assertionID))completionHandler;

/**
 Creates a power assertion, if you have a delegate set-up it will invoke these.
 
 @param description A string that describes the name of the activity (e.g. "Downloading video files" Name may be no longer than 128 characters.
 
 @param assertionType The type of power assertion to create (e.g. "SJPowerAssertionsPreventIdleSleep"
 
 */
-(void)createPowerAssertion:(NSString *)description assertionType:(SJPowerAssertionType)assertionType;


/**
 Creates a power assertion, if you have a delegate set-up it will invoke these.
 
 @param description A string that describes the name of the activity (e.g. "Downloading video files" Name may be no longer than 128 characters.
 
 @parm time: Will start holding the assertion after the specified amount of seconds
 
 @param assertionType The type of power assertion to create (e.g. "SJPowerAssertionsPreventIdleSleep"
 
 */
-(void)createPowerAssertion:(NSString *)description startHoldingAssertionAfter:(NSTimeInterval)time assertionType:(SJPowerAssertionType)assertionType;

/**
 Releases the current power assertion
 */
-(void)stopHoldingAssertion;


/**
 Creates a power assertion that will be held for specfic amount of time, if you have a delegate set-up it will invoke these.
 
 @param description A string that describes the name of the activity (e.g. "Downloading video files" Name may be no longer than 128 characters.
 
 @parm time: Will hold a assertion after the specified amount of seconds
 
 @param assertionType The type of power assertion to create (e.g. "SJPowerAssertionsPreventIdleSleep"
 
 */
-(void)createPowerAssertion:(NSString *)description holdFor:(NSTimeInterval)time assertionType:(SJPowerAssertionType)assertionType;

/**
 Will give you the current assertion ID.
 
*/
@property IOPMAssertionID currentPowerAssertion;

/**
 Set whether or not you want to get debug infomation logged.
 */
@property (nonatomic, assign) BOOL verboseLogging;

/**
 The description of the current assertion
 */
@property (nonatomic, strong) NSString *assertionDescription;

@property (nonatomic, assign) NSObject<SJPowerAssertionsDelegate> *delegate;


@end



@protocol SJPowerAssertionsDelegate<NSObject>
@optional

/**

 Delegate method called when the assertion creation process fails

*/
- (void)assertionFailed:(SJPowerAssertions *)asssertion;

/**
 
 Delegate method called when the assertion creation process successes
 
 */
- (void)assertionDone:(SJPowerAssertions *)asssertion;

@end


