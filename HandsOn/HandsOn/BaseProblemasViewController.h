//
//  BaseProblemasViewController.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/19/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseProblemasViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIToolbar *btnOrdenarPor;
- (IBAction)showOrdenarActionSheet:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnFiltrarArea;
- (IBAction)showFiltrarPorArea:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *containerView;

- (void)mudaContainerView:(NSMutableArray *)m;

@end
