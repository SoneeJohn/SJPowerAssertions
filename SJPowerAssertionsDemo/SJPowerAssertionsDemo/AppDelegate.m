//
//  AppDelegate.m
//  SJPowerAssertionsDemo
//
//  Created by Soneé John on 9/18/14.
//  Copyright (c) 2014 AlphaSoft. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate
            
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)startAction:(id)sender {
    
    if ([self.radioControls selectedTag] == 1) {
        
        //Prevent idle display sleep
        
        self.powerAssertion = [SJPowerAssertions defaultAssertion];
        
        
        [self.powerAssertion createPowerAssertion:@"Power Assertion Test Prevent idle display sleep" assertionType:SJPowerAssertionsPreventDisplayIdleSleep completionHandler:^(NSError *error) {
            
            if (error == nil) {
                // No error
                
            } else{
                //Handle Error
            }
            
        }];

  
    } else{
        //Prevent idle  sleep
        
        self.powerAssertion = [SJPowerAssertions defaultAssertion];
        
        
        [self.powerAssertion createPowerAssertion:@"Power Assertion Test prevent idle sleep" assertionType:SJPowerAssertionsPreventIdleSleep completionHandler:^(NSError *error) {
            
            if (error == nil) {
                // No error
            
            } else{
                //Handle Error
            }
            
        }];

   
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
