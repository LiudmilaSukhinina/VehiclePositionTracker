//
//  UsersListViewController.m
//  VehiclePositionTracker
//
//  Created by Liudmila Sukhinina on 9/4/18.
//  Copyright © 2018 Liudmila Sukhinina. All rights reserved.
//

#import "UsersListViewController.h"
#import "UsersListDataSource.h"
#import "OwnerCell.h"
#import "UserVehiclesViewController.h"
#import "UserVehiclesDataSource.h"
#import "UIAlertController+Errors.h"

@interface UsersListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tblUsers;
@property (nonatomic, strong) UsersListDataSource *dataSource;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation UsersListViewController

- (void)loadView {
    [super loadView];
    self.dataSource = [UsersListDataSource new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   //load users data from datasource

    self.tblUsers.tableFooterView = [UIView new];

    UIRefreshControl *refresh = [UIRefreshControl new];
    [refresh addTarget:self action:@selector(refreshActivated) forControlEvents:UIControlEventValueChanged];
    [self.tblUsers addSubview: refresh];
    self.refreshControl = refresh;

    [self updateData];
}

- (void)updateData {
    __weak typeof(self) weakSelf = self;
    [self.dataSource loadOwnersWithCallback:^(NSError * _Nullable error) {
        if(!error) {
            [weakSelf.tblUsers reloadData];
        } else {
           [UIAlertController showAlertInController:weakSelf withTitle:@"Some error has occurred" message:error.localizedDescription cancelTitle:@"Ok" completion:nil];
        }
    }];
}

- (void)refreshActivated {
    [_refreshControl endRefreshing];
    [self updateData];
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource allOwnersCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OwnerCell *cell = [tableView dequeueReusableCellWithIdentifier:[OwnerCell cellID]];

    if (cell) {
        Owner *owner = [self.dataSource getOwnerByIndex:indexPath.row];
        cell.owner = owner;
        return cell;
    }
    
    return [UITableViewCell new];
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"UserVehiclesSegueID" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [OwnerCell cellHeight];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[UserVehiclesViewController class]] ) {
        UserVehiclesViewController *destinationViewController = segue.destinationViewController;
      
        NSIndexPath *indexPath = [self.tblUsers indexPathForSelectedRow];
        NSInteger ownerIndex = indexPath.row;
        Owner *owner = [self.dataSource getOwnerByIndex:ownerIndex];
        UserVehiclesDataSource *vehicleDataSource = [UserVehiclesDataSource new];
        [destinationViewController setVehiclesByOwnerId:owner.userid dataSource:vehicleDataSource];
    }
}


@end
