//
//  MenuLateralPrincipalTableViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/17/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "MenuLateralPrincipalTableViewController.h"


@interface MenuLateralPrincipalTableViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imgViewProblemas;

@end

@implementation MenuLateralPrincipalTableViewController
float inicioR;
float inicioG;
float inicioB;

float clickR;
float clickG;
float clickB;

float inativeR;
float inativeG;
float inativeB;

NSMutableArray *cells;


- (void)viewDidLoad {
    [super viewDidLoad];

    
    inicioR = 206.0/255.0f;
    inicioG = 77.0/255.0f;
    inicioB = 77.0/255.0f;
    
    clickR = 188.0/255.0f;
    clickG = 59.0/255.0f;
    clickB = 59.0/255.0f;
    
    inativeR = 191.0/255.0f;
    inativeG = 191.0/255.0f;
    inativeB = 191.0/255.0f;
    
    
    self.imgViewProblemas.autoresizingMask = UIViewAutoresizingNone;
    
    cells = [[NSMutableArray alloc]init];
    
    //self.cellProblema.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_menuproblemas.png"]];


    //self.cellSolucao.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_menusolucoes.png"] ];
    
    //self.cellPessoal.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_menupessoal.png"] ];

    //self.cellConfig.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_menuconfig.png"] ];
    
    [cells addObject:self.cellProblema];
    [cells addObject:self.cellSolucao];
    [cells addObject:self.cellPessoal];
    [cells addObject:self.cellConfig];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:inativeR green:inativeG blue:inativeB alpha:1.0f];
    
    self.imgViewProblemas.contentMode = UIViewContentModeScaleAspectFit;
    
    
    [self reiniciaMenuLateral];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) reiniciaMenuLateral
{
    
    for(int i = 0; i < 4; i++)
    {
        if(i < 2){
            UITableViewCell *c = [cells objectAtIndex:i];
            c.backgroundColor = [UIColor colorWithRed:inicioR green:inicioG blue:inicioB alpha:1.0f];
            
        }else{
            UITableViewCell *c = [cells objectAtIndex:i];
            c.backgroundColor = [UIColor colorWithRed:inativeR green:inativeB blue:inativeB alpha:1.0f];
        }
    }
    return;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [self reiniciaMenuLateral];
    [((UITableView *)self.view)reloadData];
    UITableViewCell *c;
    
    if(indexPath.row < 2){
        c = [cells objectAtIndex:indexPath.row];
        c.backgroundColor = [UIColor colorWithRed:clickR green:clickG blue:clickB alpha:1.0f];
    }
    
    
    
    NSLog(@"%lu", indexPath.row);
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
