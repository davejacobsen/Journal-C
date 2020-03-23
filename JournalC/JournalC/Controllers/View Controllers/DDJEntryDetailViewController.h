//
//  DDJEntryDetailViewController.h
//  JournalC
//
//  Created by David on 3/23/20.
//  Copyright © 2020 David. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDJEntryController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DDJEntryDetailViewController : UIViewController

@property (nonatomic, strong) DDJEntry *entry;

@end

NS_ASSUME_NONNULL_END
