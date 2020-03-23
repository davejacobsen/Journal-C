//
//  DDJEntryController.m
//  JournalC
//
//  Created by David on 3/23/20.
//  Copyright © 2020 David. All rights reserved.
//

#import "DDJEntryController.h"
#import "DDJEntry.h"


static NSString * const EntriesKey = @"entries";

@interface DDJEntryController ()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation DDJEntryController

+ (DDJEntryController *)sharedController
{
    static DDJEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DDJEntryController alloc] init];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (DDJEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        DDJEntry *entry = [[DDJEntry alloc] initWithDictionary:dictionary];
        [self addEntriesObject:entry];
    }
}

#pragma mark - Properties

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntriesObject:(DDJEntry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntriesObject:(DDJEntry *)entry
{
    [self.internalEntries removeObject:entry];
}


@end
