//
//  MenuLateralPrincipalTableViewController.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/17/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuLateralPrincipalTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableViewCell *cellProblema;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellSolucao;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellPessoal;
@property (strong, nonatomic) IBOutlet UITableViewCell *cellConfig;

- (void) reiniciaMenuLateral;


@end
