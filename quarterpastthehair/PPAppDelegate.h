//
//  PPAppDelegate.h
//  quarterpastthehair
//
//  Created by Matthieu Cormier on 4/13/14.
//  Copyright (c) 2014 Matthieu Cormier. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "PPFuzzyTimeGenerator.h"

@interface PPAppDelegate : NSObject <NSApplicationDelegate> {
  
  IBOutlet NSMenu *statusMenu;
  
  // TODO -- private variable declared in public .h file.\?
@private
  NSStatusItem* statusItem;
  
}

@property (assign) IBOutlet NSWindow *window;

@end
