//
//  ProblemasTableViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/10/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "ProblemasTableViewController.h"
#import "Problema.h"
#import "ProblemasAdapterViewObject.h"

@interface ProblemasTableViewController ()
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblOrdResp;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblFilResp;

@end

@implementation ProblemasTableViewController

Problema *p;
Area *a;
ProblemasAdapterViewObject *pa;
NSMutableArray *listaProblema;
NSMutableArray *listaAreas;
UIActionSheet *ordenarActionSheet;
UIActionSheet *filtrarActionSheet;
NSString *paramOrdenar;
NSString *paramFiltrar;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    paramOrdenar = @"Ultimos Inseridos";
    paramFiltrar = @"Todos";
    p = [[Problema alloc]init];
    a = [[Area alloc] init];
    pa = [[ProblemasAdapterViewObject alloc] init];
    
    listaProblema = [pa retornaProblemasAdaptadosTodos];
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
    
    pa = [listaProblema objectAtIndex:indexPath.row];
    
    UILabel *labelArea = (UILabel *)[cell viewWithTag:101];
    
    
    labelArea.text = [NSString stringWithFormat:@"Área: %@", pa.nomeArea];
    
    

    
    UILabel *labelTitulo = (UILabel *)[cell viewWithTag:103];
    labelTitulo.text = pa.descricaoProblema;
    
    
    UILabel *labelCriador = (UILabel *)[cell viewWithTag:104];
    labelCriador.text = [NSString stringWithFormat:@"Usuario: %@",pa.nome_usuario];
    
    
    UILabel *labelCurtida = (UILabel *)[cell viewWithTag:105];
    labelCurtida.text = [NSString stringWithFormat:@"Curtidas: %d", pa.curtidasProblema];
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
                if([paramFiltrar isEqualToString:@"Todos"]){
                    listaProblema = [pa retornaProblemasAdaptadosTodos];
                }else{
                    listaProblema = [pa retornaTodosProblemasAdaptadosAreaUltimos:paramFiltrar];
                }
            }else if([paramOrdenar isEqualToString:@"Mais curtidas"])
            {
                if([paramFiltrar isEqualToString:@"Todos"]){
                    listaProblema = [pa retornaProblemasAdaptadosTodosPorCurtida];
                }else{
                    listaProblema = [pa retornaTodosProblemasAdaptadosAreaCurtida:paramFiltrar];
                }
            }
        }
       
        if(actionSheet == filtrarActionSheet)
        {
            paramFiltrar = param;
            
            if([param isEqualToString:@"Todos"]){
                listaProblema = [pa retornaProblemasAdaptadosTodos];
            }else{
                listaProblema = [pa retornaTodosProblemasAdaptadosAreaUltimos:paramFiltrar];
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
