//
//  PPAppDelegate.m
//  quarterpastthehair
//
//  Created by Matthieu Cormier on 4/13/14.
//  Copyright (c) 2014 Matthieu Cormier. All rights reserved.
//

#import "PPAppDelegate.h"

@interface PPAppDelegate (PrivateMethods)
- (void)addToMenuBar;
@end

@implementation PPAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  // Insert code here to initialize your application
}


- (void)addToMenuBar {
  // TODO
  // 'release' is unavailable: not available in automatic reference counting mode
  //[statusItem release];
  statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
  
  //  NSDate *now = [NSDate date];
  
  
  //  [statusItem setTitle:
  //       [now descriptionWithCalendarFormat:@"%H:%M:%S %Z"
  //                                 timeZone:nil
  //                                   locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] ]];
  
  [statusItem setTitle:[PPFuzzyTimeGenerator descriptionForNow]];
  
  
  [statusItem setMenu:statusMenu];
  
}


@end
