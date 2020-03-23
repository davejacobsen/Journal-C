//
//  DDJEntryListTableViewController.m
//  JournalC
//
//  Created by David on 3/23/20.
//  Copyright © 2020 David. All rights reserved.
//

#import "DDJEntryListTableViewController.h"
#import "DDJEntryDetailViewController.h"
#import "DDJEntryController.h"

@interface DDJEntryListTableViewController ()

@end

@implementation DDJEntryListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DDJEntryController sharedController] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
   DDJEntryController *entryController = [DDJEntryController sharedController];
   DDJEntry *entry = entryController.entries[indexPath.row];
   
   cell.textLabel.text = entry.title;
    
    return cell;
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   if ([segue.identifier isEqualToString:@"toViewEntry"]) {
       
       NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
       DDJEntry *entry = [DDJEntryController sharedController].entries[indexPath.row];
       
       DDJEntryDetailViewController *detailViewController = segue.destinationViewController;
       detailViewController.entry = entry;
   }
}

@end
