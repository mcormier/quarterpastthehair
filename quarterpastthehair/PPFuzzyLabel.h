//
//  PPFuzzyLabel.h
//  quarterpastthehair
//
//  Created by Matthieu Cormier on 4/13/14.
//  Copyright (c) 2014 Matthieu Cormier. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PPFuzzyLabel : NSObject {

  NSInteger hour;
  NSInteger minute;
  
  NSString* label;
  BOOL nextHour;
}

-(id)initWith:(NSInteger)hour and:(NSInteger)minute;

-(NSString*)fuzzyString;


+(id)labelForNow;



@end


