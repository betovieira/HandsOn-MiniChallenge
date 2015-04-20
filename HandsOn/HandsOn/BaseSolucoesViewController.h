//
//  BaseSolucoesViewController.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/20/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseSolucoesViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnOrdenarPor;

- (IBAction)showOrdenarActionSheet:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnFiltrarArea;
- (IBAction)showFiltrarPorArea:(id)sender;

- (void)mudaContainerView:(NSMutableArray *)m;

@property (strong, nonatomic) IBOutlet UIView *containerView;

@end
