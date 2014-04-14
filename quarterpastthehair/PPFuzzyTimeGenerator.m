//
//  PPFuzzyStringGenerator.m
//  fuzzytime
//
//  Created by Matthieu Cormier on 3/15/14.
//  Copyright (c) 2014 Matthieu Cormier. All rights reserved.
//

#import "PPFuzzyTimeGenerator.h"
#import "PPFuzzyLabel.h"

@implementation PPFuzzyTimeGenerator

+ (NSString*)descriptionForNow {
  PPFuzzyLabel* label = [PPFuzzyLabel labelForNow];
  
  return [label fuzzyString];
}


@end
