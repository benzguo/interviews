//
//  BPLoggerEventSpec.m
//  boilerplate
//
//  Created by Ben Guo on 5/26/15.
//  Copyright 2015 benzguo. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "BPLoggerEvent.h"


SPEC_BEGIN(BPLoggerEventSpec)

describe(@"BPLoggerEvent", ^{

    describe(@"initialization", ^{
        it(@"should initialize properties with params", ^{
            NSDate *date = [NSDate date];
            NSDictionary *dict = @{};
            BPLoggerEvent *sut = [[BPLoggerEvent alloc] initWithDate:date data:dict];

            [[sut.date should] equal:date];
            [[sut.data should] equal:dict];
        });

    });

    describe(@"dictionaryRepresentation", ^{
        it(@"should return the correct dictionary", ^{
            NSDate *date = [NSDate date];
            NSDictionary *dict = @{};
            BPLoggerEvent *sut = [[BPLoggerEvent alloc] initWithDate:date data:dict];
            NSDictionary *result = [sut dictionaryRepresentation];

            NSTimeInterval interval = [date timeIntervalSince1970];
            [[result should] equal:@{
                                     @"date": @(interval),
                                     @"data": sut.data
                                     }];
        });
        
    });

});

SPEC_END
