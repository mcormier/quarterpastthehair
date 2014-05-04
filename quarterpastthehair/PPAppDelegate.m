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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
   [self addToMenuBar];
}


- (void)addToMenuBar {
  // TODO
  // 'release' is unavailable: not available in automatic reference counting mode
  //[statusItem release];
  statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
  

  
  [statusItem setTitle:[PPFuzzyTimeGenerator descriptionForNow]];
  [statusItem setMenu:statusMenu];
  
  // So we can modify the date and time place holder
  // menu items right before the menu item is displayed.
  [statusMenu setDelegate:(id)self];
  
}

// NSMenuDelegate Protocol
- (void)menuWillOpen:(NSMenu *)menu {
  
  NSDate *currDate = [NSDate date];
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
  [dateFormatter setDateFormat:@"dd MMMM YYYY"];
  NSString *dateString = [dateFormatter stringFromDate:currDate];

  [currentDateMenuItem setTitle:dateString];
  
  [dateFormatter setDateFormat:@"HH:mm"];
  [currentTimeMenuItem setTitle: [dateFormatter stringFromDate:currDate] ];

}




@end
