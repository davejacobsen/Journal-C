//
//  DDJEntry.h
//  JournalC
//
//  Created by David on 3/23/20.
//  Copyright © 2020 David. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DDJEntry : NSObject

- (instancetype)initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timeStamp:(NSDate *)timeStamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryRepresentation;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timestamp;

@end

NS_ASSUME_NONNULL_END
