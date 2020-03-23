//
//  DDJEntryController.h
//  JournalC
//
//  Created by David on 3/23/20.
//  Copyright © 2020 David. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDJEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface DDJEntryController : NSObject


+ (DDJEntryController *)sharedController;

- (void)saveToPersistentStorage;

@property (nonatomic, strong, readonly) NSArray *entries;
- (void)addEntriesObject:(DDJEntry *)entry;
- (void)removeEntriesObject:(DDJEntry *)entry;

@end

NS_ASSUME_NONNULL_END
