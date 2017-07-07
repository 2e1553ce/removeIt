//
//  UIFont+AVGFont.h
//  OneTrak
//
//  Created by aiuar on 07.07.17.
//  Copyright © 2017 A.V. All rights reserved.
//

@interface UIFont (AVGFont)

@property (class, nonatomic, readonly) UIFont *textFieldPlaceholder;
@property (class, nonatomic, readonly) UIFont *counterLabel;
@property (class, nonatomic, readonly) UIFont *resultLabel;

+ (UIFont *)textFieldPlaceholder;
+ (UIFont *)counterLabel;
+ (UIFont *)resultLabel;

@end
