//
//  AVGResultLabel.m
//  OneTrak
//
//  Created by aiuar on 07.07.17.
//  Copyright © 2017 A.V. All rights reserved.
//

#import "AVGResultLabel.h"

@implementation AVGResultLabel

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.middleGrayColor;
        self.font = UIFont.resultLabel;
        self.numberOfLines = 1;
        self.minimumScaleFactor = 0.5;
        self.adjustsFontSizeToFitWidth = YES;
        self.textAlignment = NSTextAlignmentCenter;
        self.text = @"результат";
    }
    return self;
}

#pragma mark - Insets

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {10, 0, 0, 0};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
