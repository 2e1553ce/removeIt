//
//  AVGCalculateService.m
//  OneTrak
//
//  Created by aiuar on 07.07.17.
//  Copyright © 2017 A.V. All rights reserved.
//

#import "AVGCalculateService.h"

@implementation AVGCalculateService

#pragma mark - AVGCalculateProtocol

- (NSUInteger)squareNumber:(NSInteger)number {
    if (number > 10000000) {
        return -1;
    }
    if (number < 0) {
        number = -number;
    }
    NSInteger temp = number;
    number = 0;
    for (NSUInteger i = 0; i < temp; i++) {
        number += temp;
    }
    return number;
}

@end
