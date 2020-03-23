//
//  DDJEntryDetailViewController.m
//  JournalC
//
//  Created by David on 3/23/20.
//  Copyright © 2020 David. All rights reserved.
//

#import "DDJEntryDetailViewController.h"
#import "DDJEntryController.h"

@interface DDJEntryDetailViewController ()


@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *textTextView;


@end

@implementation DDJEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    
    self.titleTextField.text = self.entry.title;
    self.textTextView.text = self.entry.text;
}
- (IBAction)saveButtonTapped:(id)sender {
    
    if (self.entry) {
        
        self.entry.title = self.titleTextField.text;
        self.entry.text = self.textTextView.text;
        self.entry.timestamp = [NSDate date];
        
    } else {
        
        DDJEntry *entry = [[DDJEntry alloc] initWithTitle:self.titleTextField.text text:self.textTextView.text timeStamp:[NSDate date]];
        
        [[DDJEntryController sharedController] addEntriesObject:entry];
        
        self.entry = entry;
    }
    
    [self.navigationController popViewControllerAnimated:true];
    
}


- (IBAction)clearButtonTapped:(id)sender {
    
    self.titleTextField.text = @"";
    self.textTextView.text = @"";
}


// UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// Properties

- (void)setEntry:(DDJEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}


@end
