//
//  AVGTextField.m
//  OneTrak
//
//  Created by aiuar on 07.07.17.
//  Copyright © 2017 A.V. All rights reserved.
//

#import "AVGTextField.h"

@implementation AVGTextField

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.placeholder = @"Введите число";
        self.font = UIFont.textFieldPlaceholder;
        self.textAlignment = NSTextAlignmentRight;
        self.borderStyle = UITextBorderStyleRoundedRect;
    }
    return self;
}

#pragma mark - Disable Copy & Paste

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copy:) || action == @selector(paste:)) {
        return NO;
    }
    return [super canPerformAction:action withSender:sender];
}
@end
