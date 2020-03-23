//
//  DDJEntry.m
//  JournalC
//
//  Created by David on 3/23/20.
//  Copyright © 2020 David. All rights reserved.
//

#import "DDJEntry.h"

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const TimestampKey = @"timestamp";

@implementation DDJEntry

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text timeStamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _text = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *text = dictionary[TextKey];
    NSDate *timestamp = dictionary[TimestampKey];
    return [self initWithTitle:title text:text timeStamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             TextKey: self.text,
             TimestampKey: self.timestamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[DDJEntry class]]) { return NO; }
    // Shortcut to comparing all properties one by one. We let NSDictionary do it for us
    return [[self dictionaryRepresentation] isEqualToDictionary:[(DDJEntry *)object dictionaryRepresentation]];
}


@end
