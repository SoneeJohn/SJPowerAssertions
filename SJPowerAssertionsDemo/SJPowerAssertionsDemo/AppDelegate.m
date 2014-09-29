//
//  AppDelegate.m
//  SJPowerAssertionsDemo
//
//  Created by Soneé John on 9/18/14.
//  Copyright (c) 2014 AlphaSoft. All rights reserved.
//

#import "AppDelegate.h"
#import <SJPowerAssertions/SJPowerAssertions.h>
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate
            
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
 // Time based methods
    SJPowerAssertions *test = [[SJPowerAssertions alloc]init];
    [test createPowerAssertion:@"Timer Test 1" startHoldingAssertionAfter:10.0 assertionType:SJPowerAssertionsPreventIdleSleep];
    [test setDelegate:self];
    
    SJPowerAssertions *test2 = [[SJPowerAssertions alloc]init];
    [test2 createPowerAssertion:@"Timer Test 2" startHoldingAssertionAfter:10.0 assertionType:SJPowerAssertionsPreventIdleSleep];
    [test2 setDelegate:self];
    
 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"First assertion stopped, the assertion ID was: %u",[test currentPowerAssertion]);
        [test stopHoldingAssertion];
    
});
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(40 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"Second assertion stopped, the assertion ID was: %u",[test2 currentPowerAssertion]);
        [test2 stopHoldingAssertion];
        
    });
    
    
    
    
    SJPowerAssertions *test3 = [[SJPowerAssertions alloc]init];
    
    [test3 setDelegate:self];
    
    [test3 createPowerAssertion:@"5 Mins Test" holdFor:300 assertionType:SJPowerAssertionsPreventDisplayIdleSleep];
    


}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

//Our Delegate Methods
-(void)assertionDone:(SJPowerAssertions *)asssertion{
    
    NSLog(@"Assertion creation process completed. The assertion ID is: %u, and the work description is: %@",asssertion.currentPowerAssertion, asssertion.assertionDescription);
}

-(void)assertionFailed:(SJPowerAssertions *)asssertion{
    NSLog(@"Assertion creation process failed. The assertion ID is: %u, and the work description is: %@",asssertion.currentPowerAssertion, asssertion.assertionDescription);

}
- (IBAction)startAction:(id)sender {
    
    if ([self.radioControls selectedTag] == 1) {
        
        //Prevent idle display sleep
        
        self.powerAssertion = [[SJPowerAssertions alloc]init];
        
        //Set delegate
        [self.powerAssertion setDelegate:self];
        
        
        //This will enable debug information to be logged.
        self.powerAssertion.verboseLogging = YES;
        
        [self.powerAssertion createPowerAssertion:@"Power Assertion Test Prevent idle display sleep" assertionType:SJPowerAssertionsPreventDisplayIdleSleep];
        
        /*If you perfer you may use the block method
        [self.powerAssertion createPowerAssertion:@"Power Assertion Test Prevent idle display sleep" assertionType:SJPowerAssertionsPreventDisplayIdleSleep completionHandler:^(NSError *error, unsigned int *assertionID) {
            
            if (error == nil) {
                // No error
                NSLog(@"Assertion was created successfully. The Assertion ID is: %d and the work description is: %@",*assertionID, self.powerAssertion.assertionDescription);
                
            } else{
                //Handle Error
            }

            
        }];
       */
  
    } else{
        //Prevent idle  sleep
        
        self.powerAssertion = [[SJPowerAssertions alloc]init];
        self.powerAssertion.verboseLogging = YES;
        
        //Set delegate
        [self.powerAssertion setDelegate:self];
        
        [self.powerAssertion createPowerAssertion:@"Power Assertion Test prevent idle sleep" assertionType:SJPowerAssertionsPreventIdleSleep];
        
        /*If you perfer you may use the block method
         [self.powerAssertion createPowerAssertion:@"Power Assertion Test prevent idle sleep" assertionType:SJPowerAssertionsPreventIdleSleep completionHandler:^(NSError *error, unsigned int *assertionID) {
         
         if (error == nil) {
         // No error
         NSLog(@"Assertion was created successfully. The Assertion ID is: %d and the work description is: %@",*assertionID, self.powerAssertion.assertionDescription);
         
         } else{
         //Handle Error
         }
         
         
         }];
         */

        
    }
    
    }

- (IBAction)stopAction:(id)sender {
    
    if (![self.powerAssertion currentPowerAssertion]) {
        NSRunAlertPanel(@"No Power Assertion", @"You are not currenly holding any power assertions" , @"OK", nil, nil);
        return;
        
    }
    
     [self.powerAssertion stopHoldingAssertion];
}
@end
