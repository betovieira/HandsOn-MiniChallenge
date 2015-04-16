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
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation ProblemasTableViewController

Problema *p;
Area *a;
NSMutableArray *listaProblema;
NSMutableArray *listaAreas;
UIActionSheet *ordenarActionSheet;
UIActionSheet *filtrarActionSheet;



- (void)viewDidLoad {
    [super viewDidLoad];
    p = [[Problema alloc]init];
    a = [[Area alloc] init];
    listaProblema = [p retornaProblemasTodos];
    listaAreas = [a retornaAreasTodas];
    
    ordenarActionSheet = [[UIActionSheet alloc] initWithTitle:@"Ordenar por:"
                                                     delegate:self
                                            cancelButtonTitle:nil
                                       destructiveButtonTitle:nil
                                            otherButtonTitles:@"Mais curtidas", @"Ultimos inseridos",  nil];
    
    filtrarActionSheet = [[UIActionSheet alloc] initWithTitle:@"Filtrar por:"
                                                     delegate:self
                                            cancelButtonTitle:nil
                                       destructiveButtonTitle:nil
                                            otherButtonTitles:nil];
    
    
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


- (IBAction)showOrdenarActionSheet:(id)sender {
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [ordenarActionSheet showFromBarButtonItem:(UIBarButtonItem *)sender animated:YES];
        
    }else{
        [ordenarActionSheet showInView:self.view];
    }

}
- (IBAction)showFiltrarPorArea:(id)sender {
    
    //Coloca no Botão de Filtrar Área
    for(Area * a in listaAreas)
        [filtrarActionSheet addButtonWithTitle:a.nomeArea];

    //Se for iPad
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [filtrarActionSheet showFromBarButtonItem:(UIBarButtonItem *)sender animated:YES];
    //Se for iPhone
    }else{
        [filtrarActionSheet showInView:self.view];
    }
    
}


@end
