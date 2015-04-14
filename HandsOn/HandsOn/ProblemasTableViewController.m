//
//  ProblemasTableViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/10/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "ProblemasTableViewController.h"
#import "Problema.h"

@interface ProblemasTableViewController ()

@end

@implementation ProblemasTableViewController

Problema *p;
NSMutableArray *listaProblema;

- (void)viewDidLoad {
    [super viewDidLoad];
    p = [[Problema alloc]init];
    listaProblema = [p retornaProblemasTodos];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return listaProblema.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellProblema" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellProblema"];
    }
    
    p = [listaProblema objectAtIndex:indexPath.row];
    
    UILabel *labelArea = (UILabel *)[cell viewWithTag:101];
    NSString *areadoida = NULL;
    
    if(p.id_area == 1)
    {
        areadoida = @"Educaçao";
    }else if(p.id_area == 2)
    {
        areadoida = @"Saude";
    }else if(p.id_area == 4)
    {
        areadoida = @"Entretenimento";
    }else if(p.id_area == 5)
    {
        areadoida = @"Culinaria";
    }else if(p.id_area == 6)
    {
        areadoida = @"Informatica";
    }else if(p.id_area == 7)
    {
        areadoida = @"Organizaçao";
    }else if(p.id_area == 8)
    {
        areadoida = @"Geral";
    }
    else if(p.id_area == 9)
    {
        areadoida = @"Segurança";
    }else if(p.id_area == 10)
    {
        areadoida = @"Viagem";
    }
        
    
    labelArea.text = [NSString stringWithFormat:@"Area: %@", areadoida];
    
    
    UILabel *labelSolucao = (UILabel *)[cell viewWithTag:102];
    labelSolucao.text = [NSString stringWithFormat:@"Problema: %d", p.id_problema];
    
    
    
    UILabel *labelTitulo = (UILabel *)[cell viewWithTag:103];
    labelTitulo.text = p.descricaoProblema;
    
    
    UILabel *labelCriador = (UILabel *)[cell viewWithTag:104];
    labelCriador.text = [NSString stringWithFormat:@"Usuario: %d",p.id_usuario];
    
    
    UILabel *labelCurtida = (UILabel *)[cell viewWithTag:105];
    labelCurtida.text = [NSString stringWithFormat:@"Curtidas: %d", p.curtidasProblema];
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"%lu", indexPath.row);
}

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
