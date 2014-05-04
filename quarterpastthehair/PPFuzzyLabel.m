//
//  PPFuzzyLabel.m
//  quarterpastthehair
//
//  Created by Matthieu Cormier on 4/13/14.
//  Copyright (c) 2014 Matthieu Cormier. All rights reserved.
//

#import "PPFuzzyLabel.h"

@implementation PPFuzzyLabel


-(id)initWith:(NSInteger)_hour and:(NSInteger)_minute {

  if ( self = [super init]) {
    minute = _minute;
    hour = _hour;
  }
  
  return self;
}

- (NSString*)fuzzyString {
  
  NSString* descString = [self labelForMinute];
  
  NSString* hourRef= [self hourRefForMinute];
  
  NSString* hourStr;
  
  if ([hourRef isEqualToString:@"next"]){
    hourStr = [self numberToHourLabel:hour+1];
  } else {
    hourStr = [self numberToHourLabel:hour];
  }
  
  return [NSString stringWithFormat:descString, hourStr];

}

- (NSString*)hourRefForMinute {
  if ( minute == 0) { return @"current"; }
  
  if ( minute >= 58 ) { return NSLocalizedString(@"nearly %@", nil);}
  if ( minute >= 55 ) { return NSLocalizedString(@"five to ref", nil);}
  if (minute >= 48) { return NSLocalizedString(@"ten to ref", nil); }
  if (minute >= 43) { return NSLocalizedString(@"quarter to ref", nil); }
  if (minute >= 38) { return NSLocalizedString(@"twenty to ref", nil); }
  if (minute >= 33) { return NSLocalizedString(@"twentyfive to ref", nil); }
  if (minute >= 28) { return NSLocalizedString(@"half past ref", nil); }
  if (minute >= 23) { return NSLocalizedString(@"twentyfive past ref", nil); }
  if (minute >= 18) { return NSLocalizedString(@"twenty past ref", nil); }
  if (minute >= 13) { return NSLocalizedString(@"quarter past ref", nil); }
  if (minute >= 8) { return NSLocalizedString(@"ten past ref", nil); }
  if (minute >= 3) { return NSLocalizedString(@"five past ref", nil); }
  
  return @"shortly after ref";
}

- (NSString*)numberToHourLabel:(NSInteger)value {
  
  NSInteger valMod = value % 12;
  
  switch( valMod) {
    case 1: return @"one";
    case 2: return @"two";
    case 3: return @"three";
    case 4: return @"four";
    case 5: return @"five";
    case 6: return @"six";
    case 7: return @"seven";
    case 8: return @"eight";
    case 9: return @"nine";
    case 10: return @"ten";
    case 11: return @"eleven";
    case 12: return @"twelve";
  }
  
  // We shouldn't get here.
  return @"blah";
}

- (NSString*)labelForMinute {
  if ( minute == 0) { return @"%@ o'clock"; }
  if ( minute >= 58 ) { return @"nearly %@";}
  if ( minute >= 55 ) { return @"five to %@";}
  if (minute >= 48) { return @"ten to %@"; }
  if (minute >= 43) { return @"quarter to %@"; }
  if (minute >= 38) { return @"twenty to %@"; }
  if (minute >= 33) { return @"twentyfive to %@"; }
  if (minute >= 28) { return @"half past %@"; }
  if (minute >= 23) { return @"twentyfive past %@"; }
  if (minute >= 18) { return @"twenty past %@"; }
  if (minute >= 13) { return @"quarter past %@"; }
  if (minute >= 8) { return @"ten past %@"; }
  if (minute >= 3) { return @"five past %@"; }
  
  return @"shortly after %@";
}


+(id)labelForNow {
  NSDate *now = [NSDate date];
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:now];
  
  NSInteger hour = [components hour];
  NSInteger minutes = [components minute];
  
  return [[PPFuzzyLabel alloc] initWith:hour and:minutes];
}

@end
