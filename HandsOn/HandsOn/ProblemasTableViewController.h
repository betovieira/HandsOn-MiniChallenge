//
//  ProblemasTableViewController.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/10/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProblemasTableViewController : UITableViewController

- (id)initWithListaNova:(NSMutableArray *)listaNova;
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//@property (strong, nonatomic) IBOutlet UIToolbar *btnOrdenarPor;
//- (IBAction)showOrdenarActionSheet:(id)sender;
//@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnFiltrarArea;
//- (IBAction)showFiltrarPorArea:(id)sender;

//-(NSString*) makeRestAPICall : (NSString*) reqURLStr;
@end
