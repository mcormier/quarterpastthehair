//
//  PPFuzzyStringGenerator.m
//  fuzzytime
//
//  Created by Matthieu Cormier on 3/15/14.
//  Copyright (c) 2014 Matthieu Cormier. All rights reserved.
//

#import "PPFuzzyTimeGenerator.h"

@implementation PPFuzzyTimeGenerator

+ (NSString*)descriptionForNow {
  
  NSDate *now = [NSDate date];
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:now];
  
  NSInteger hour = [components hour];
  NSInteger minutes = [components minute];
  
  
  return [PPFuzzyTimeGenerator descriptionFor:minutes and:hour];
}

// TODO -- use current - next ref ... -- create an object with ref string and current next pointer.
+ (NSString*)descriptionFor:(NSInteger)minute and:(NSInteger)hour {
  
  NSString* descString = [PPFuzzyTimeGenerator numberToMinuteLabel:minute];
  NSString* hourStr = [PPFuzzyTimeGenerator hourString:hour];
  
  return [NSString stringWithFormat:descString, hourStr];
}

+ (NSString*)hourString:(NSInteger)value {
  
  NSInteger hour = value % 12;
  NSString *hourLabel = [PPFuzzyTimeGenerator numberToHourLabel:hour];
  
  return NSLocalizedString(hourLabel, nil);
}


+ (NSString*)numberToHourLabel:(NSInteger)value {
  
  NSInteger hour = value % 12;
  
  switch( hour) {
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


+ (NSString*)numberToMinuteLabel:(NSInteger)minute {
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


@end
