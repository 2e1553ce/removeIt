//
//  AVGCalculateServiceTests.m
//  OneTrak
//
//  Created by aiuar on 07.07.17.
//  Copyright © 2017 A.V. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AVGCalculateService.h"

@interface AVGCalculateServiceTests : XCTestCase

@property (nonatomic, strong) AVGCalculateService *service;

@end

@implementation AVGCalculateServiceTests

- (void)setUp {
    [super setUp];
    
    self.service = [AVGCalculateService new];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSquare {
    NSInteger toSuqare = 12;
    NSInteger expectedNumber = 144;
    NSInteger number = [self.service squareNumber:toSuqare];
    XCTAssertEqual(expectedNumber, number, @"Test square in normal case.");
}

- (void)testSquareNegativeNumber {
    NSInteger toSquare = -100;
    NSInteger number = [self.service squareNumber:toSquare];
    XCTAssertGreaterThanOrEqual(number, 0, @"Test square for negative.");
}

@end
