//
//  SolucoesTableViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/10/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "SolucoesTableViewController.h"
#import "Solucao.h"

@interface SolucoesTableViewController ()

@end

@implementation SolucoesTableViewController

Solucao *s;
NSMutableArray *listaSolucao;

- (void)viewDidLoad {
    [super viewDidLoad];
    s = [[Solucao alloc] init];
    listaSolucao = [s retornaSolucoes];
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return listaSolucao.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellSolucao" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellSolucao"];
    }
    
    s = [listaSolucao objectAtIndex:indexPath.row];
    
    UILabel *labelArea = (UILabel *)[cell viewWithTag:201];
    
    NSString *areadoida = NULL;
    
    if(s.id_area == 1)
    {
        areadoida = @"Educaçao";
    }else if(s.id_area == 2)
    {
        areadoida = @"Saude";
    }else if(s.id_area == 4)
    {
        areadoida = @"Entretenimento";
    }else if(s.id_area == 5)
    {
        areadoida = @"Culinaria";
    }else if(s.id_area == 6)
    {
        areadoida = @"Informatica";
    }else if(s.id_area == 7)
    {
        areadoida = @"Organizaçao";
    }else if(s.id_area == 8)
    {
        areadoida = @"Geral";
    }
    else if(s.id_area == 9)
    {
        areadoida = @"Segurança";
    }else if(s.id_area == 10)
    {
        areadoida = @"Viagem";
    }
    
    labelArea.text = [NSString stringWithFormat:@"Area: %@", areadoida];
    
    
    
    
    UILabel *labelTitulo = (UILabel *)[cell viewWithTag:202];
    labelTitulo.text = s.descricaoSolucao;
    
    
    UILabel *labelImplementacoes = (UILabel *)[cell viewWithTag:203];
    labelImplementacoes.text = [NSString stringWithFormat:@"Implementações: %zd",
                                [s retornaQuantidadeImplementacoes:s]];
    
    
    UILabel *labelCurtida = (UILabel *)[cell viewWithTag:204];
    labelCurtida.text = [NSString stringWithFormat:@"Curtidas: %d", s.curtidasSolucao];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
