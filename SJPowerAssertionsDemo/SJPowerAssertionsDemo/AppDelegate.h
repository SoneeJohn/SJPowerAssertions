//
//  AppDelegate.h
//  SJPowerAssertionsDemo
//
//  Created by Soneé John on 9/18/14.
//  Copyright (c) 2014 AlphaSoft. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SJPowerAssertions/SJPowerAssertions.h>
@interface AppDelegate : NSObject <NSApplicationDelegate, SJPowerAssertionsDelegate>

@property (weak) IBOutlet NSMatrix *radioControls;
@property (weak) IBOutlet NSButton *startButton;
- (IBAction)startAction:(id)sender;
- (IBAction)stopAction:(id)sender;

@property (nonatomic, strong) SJPowerAssertions *powerAssertion;
@end

