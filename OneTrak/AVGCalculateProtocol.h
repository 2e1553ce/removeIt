//
//  AVGCalculateProtocol.h
//  OneTrak
//
//  Created by aiuar on 07.07.17.
//  Copyright © 2017 A.V. All rights reserved.
//

@protocol AVGCalculateProtocol <NSObject>

/**
 Возводит число в квадрат используя сложение

 @param number Число которое нужно возвести в квадрат
 @return Возведенное в квадрат число
 */
- (NSUInteger)squareNumber:(NSInteger)number;

@end
