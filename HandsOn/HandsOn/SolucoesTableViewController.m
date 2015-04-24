//
//  SolucoesTableViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/10/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "SolucoesTableViewController.h"
#import "Solucao.h"
#import "Area.h"
#import "SolucoesAdapterViewObject.h"

@interface SolucoesTableViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblOrdResp;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblFilResp;


@end

@implementation SolucoesTableViewController

Solucao *s;
Area *a;
SolucoesAdapterViewObject *sa;

UIActionSheet *ordenarActionSheet;
UIActionSheet *filtrarActionSheet;
NSString *paramOrdenar;
NSString *paramFiltrar;
NSMutableArray *listaAreas;

NSMutableArray *listaSolucao;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    paramOrdenar = @"Ultimos Inseridos";
    paramFiltrar = @"Todos";
    
    s = [[Solucao alloc] init];
    a = [[Area alloc] init];
    
    sa = [[SolucoesAdapterViewObject alloc]init];
    
    listaSolucao = [sa retornaSolucaoAdaptadosTodos];
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

- (id)initWithListaNova:(NSMutableArray *)listaNova {
    self = [super init];
    if(self){
        listaSolucao = listaNova;
    }
    
    [((UITableView *)self.view)reloadData];
    return self;
    
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
    
    sa = [listaSolucao objectAtIndex:indexPath.row];
    
    UILabel *labelArea = (UILabel *)[cell viewWithTag:201];
    
    labelArea.text = [NSString stringWithFormat:@"%@", sa.nomeArea];
    
    UILabel *labelTitulo = (UILabel *)[cell viewWithTag:202];
    labelTitulo.text = sa.descricaoSolucao;
    
    
    UILabel *labelImplementacoes = (UILabel *)[cell viewWithTag:203];
    labelImplementacoes.text = [NSString stringWithFormat:@"%zd implementações ",
                                [s retornaQuantidadeImplementacoes:sa.id_solucao]];
    
    
    UILabel *labelCurtida = (UILabel *)[cell viewWithTag:204];
    labelCurtida.text = [NSString stringWithFormat:@"%d", sa.curtidasSolucao];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
    [filtrarActionSheet addButtonWithTitle:@"Todos"];
    
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


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *param;
    
    @try {
        param = [actionSheet buttonTitleAtIndex:buttonIndex];
        if(actionSheet == ordenarActionSheet)
        {
            paramOrdenar = param;
            
            if([paramOrdenar isEqualToString:@"Ultimos inseridos"])
            {
                NSLog(@"%@", paramFiltrar);
                if([paramFiltrar isEqualToString:@"Todos"]){
                    listaSolucao = [sa retornaSolucaoAdaptadosTodos];
                }else{
                    
                    listaSolucao = [sa retornaTodosSolucoesAdaptadosAreaUltimos:paramFiltrar];
                }
            }else if([paramOrdenar isEqualToString:@"Mais curtidas"])
            {
                if([paramFiltrar isEqualToString:@"Todos"]){
                    listaSolucao = [sa retornaSolucoesAdaptadosTodosPorCurtida];
                }else{
                    listaSolucao = [sa retornaTodosSolucoesAdaptadosAreaCurtida:paramFiltrar];
                }
            }
        }
        
        if(actionSheet == filtrarActionSheet)
        {
            paramFiltrar = param;
            
            if([param isEqualToString:@"Todos"]){
                listaSolucao = [sa retornaSolucaoAdaptadosTodos];
            }else{
                listaSolucao = [sa retornaTodosSolucoesAdaptadosAreaUltimos:paramFiltrar];
            }
            
            if([paramFiltrar isEqualToString:@"Todos"]){
                if([paramOrdenar isEqualToString:@"Ultimos inseridos"]){
                    listaSolucao = [sa retornaSolucaoAdaptadosTodos];
                }else if([paramOrdenar isEqualToString:@"Mais curtidas"]){
                    listaSolucao = [sa retornaSolucoesAdaptadosTodosPorCurtida];
                }
            }else{
                if([paramOrdenar isEqualToString:@"Ultimos inseridos"]){
                    listaSolucao = [sa retornaTodosSolucoesAdaptadosAreaUltimos:paramFiltrar];
                }else if([paramOrdenar isEqualToString:@"Mais curtidas"]){
                    listaSolucao = [sa retornaTodosSolucoesAdaptadosAreaCurtida:paramFiltrar];
                }
            }
        }
        
        
        [((UITableView *)self.view)reloadData];
        
    }@catch(NSException *e) {
        NSLog(@"Clique fora da ActionSheet");
    }
    self.lblOrdResp.title = paramOrdenar;
    self.lblFilResp.title = paramFiltrar;
}


@end
