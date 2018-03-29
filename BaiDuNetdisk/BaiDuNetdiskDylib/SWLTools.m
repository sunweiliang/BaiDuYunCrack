//
//  SWLTools.m
//  iThunder
//
//  Created by iOS-dev on 2018/2/13.
//  Copyright © 2018年 weiliang.sun. All rights reserved.
//

#import "SWLTools.h"

@implementation SWLTools

+(NSString *)GetRandomString:(NSInteger)length{
    
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < length; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    
    return string;
}

@end
