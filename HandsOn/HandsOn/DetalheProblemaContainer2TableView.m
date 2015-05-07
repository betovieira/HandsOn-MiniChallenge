//
//  DetalheProblemaContainer2TableView.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/24/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "DetalheProblemaContainer2TableView.h"
#import "SolucoesAdapterViewObject.h"
#import "Solucao.h"


@interface DetalheProblemaContainer2TableView ()

@end

@implementation DetalheProblemaContainer2TableView

NSMutableArray *listaSolucao;
SolucoesAdapterViewObject *sa;
Solucao *s;


- (void)viewDidLoad {
    [super viewDidLoad];
    s = [[Solucao alloc]init];
    sa = [[SolucoesAdapterViewObject alloc] init];
    
    [((UITableView *)self.view)reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithLista:(NSMutableArray *) temp {
    self = [super init];
    
    if(self){
        listaSolucao = temp;
    }
    
    return self;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellSolucao2" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellSolucao2"];
    }
    
    sa = [listaSolucao objectAtIndex:indexPath.row];
    
    UILabel *labelArea = (UILabel *)[cell viewWithTag:880];
    
    labelArea.text = [NSString stringWithFormat:@"%@", sa.nomeArea];
    
    UILabel *labelTitulo = (UILabel *)[cell viewWithTag:881];
    labelTitulo.text = sa.descricaoSolucao;
    
    
    UILabel *labelImplementacoes = (UILabel *)[cell viewWithTag:882];
    labelImplementacoes.text = [NSString stringWithFormat:@"%zd implementações ", sa.quantidadeImplementacoes];
 //                               [s retornaQuantidadeImplementacoes:(int)sa.id_solucao]];
    
    
    UILabel *labelCurtida = (UILabel *)[cell viewWithTag:883];
    labelCurtida.text = [NSString stringWithFormat:@"%d", sa.curtidasSolucao];
    
    return cell;
}


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
