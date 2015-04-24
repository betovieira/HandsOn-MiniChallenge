//
//  BaseSolucoesViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/20/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "BaseSolucoesViewController.h"
#import "SolucoesAdapterViewObject.h"
#import "SolucoesTableViewController.h"
#import "Area.h"

@interface BaseSolucoesViewController () <UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblOrdenar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblFiltrar;
@end

@implementation BaseSolucoesViewController

Area *a;
SolucoesAdapterViewObject *sa;
NSMutableArray *listaSolucoes;
NSMutableArray *listaAreas;
UIActionSheet *ordenarActionSheet;
UIActionSheet *filtrarActionSheet;
NSString *paramOrdenar;
NSString *paramFiltrar;
UIButton *imagemCurtir;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    sa = [[SolucoesAdapterViewObject alloc]init];
    
    SolucoesTableViewController *solucoesView;
    
    listaSolucoes = [sa retornaSolucaoAdaptadosTodos];
    solucoesView = [[SolucoesTableViewController alloc]initWithListaNova:listaSolucoes];
    
    solucoesView = [self.storyboard instantiateViewControllerWithIdentifier:@"viewSolucoes"];
    
    solucoesView.view.frame = self.containerView.frame;
    
    [solucoesView willMoveToParentViewController:self];
    [self.containerView addSubview:solucoesView.view];
    [self addChildViewController:solucoesView];
    [solucoesView didMoveToParentViewController:self];
    
    
    paramOrdenar = @"Ultimos inseridos";
    paramFiltrar = @"Todos";
    
    self.lblOrdenar.title = paramOrdenar;
    self.lblFiltrar.title = paramFiltrar;
    
    a = [[Area alloc] init];
    listaAreas = [a retornaAreasTodas];
    
    ordenarActionSheet = [[UIActionSheet alloc] initWithTitle:@"Ordenar por:"
                                                     delegate:self
                                            cancelButtonTitle:nil
                                       destructiveButtonTitle:nil
                                            otherButtonTitles:@"Mais curtidas", @"Ultimos Inseridos",  nil];
    
    filtrarActionSheet = [[UIActionSheet alloc] initWithTitle:@"Filtrar por:"
                                                     delegate:self
                                            cancelButtonTitle:nil
                                       destructiveButtonTitle:nil
                                            otherButtonTitles:nil];
    

    

}

-(void) mudaContainerView:(NSMutableArray *)m
{
    SolucoesTableViewController *solucoesView;
    solucoesView = [[SolucoesTableViewController alloc] initWithListaNova:m];
    
    solucoesView = [self.storyboard instantiateViewControllerWithIdentifier:@"viewSolucoes"];
    
    solucoesView.view.frame = self.containerView.frame;
    
    [solucoesView willMoveToParentViewController:self];
    [self.containerView addSubview:solucoesView.view];
    [self addChildViewController:solucoesView];
    [solucoesView didMoveToParentViewController:self];
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
        [filtrarActionSheet  showFromBarButtonItem:(UIBarButtonItem *)sender animated:YES];
        [filtrarActionSheet reloadInputViews];
        //Se for iPhone
    }else{
        [filtrarActionSheet showInView:self.view];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *param;
    
    @try {
        param = [actionSheet buttonTitleAtIndex:buttonIndex];
        if(actionSheet == ordenarActionSheet)
        {
            paramOrdenar = param;
            
            if([[paramOrdenar lowercaseString] isEqualToString:@"ultimos inseridos"])
            {
                if([paramFiltrar isEqualToString:@"Todos"]){
                    listaSolucoes = [sa retornaSolucaoAdaptadosTodos];
                    [self mudaContainerView:listaSolucoes];
                    paramOrdenar = param;
                    
                }else{
                    listaSolucoes = [sa retornaTodosSolucoesAdaptadosAreaUltimos:paramFiltrar];
                    [self mudaContainerView:listaSolucoes];
                    paramOrdenar = param;
                }
            }else if([[paramOrdenar lowercaseString] isEqualToString:@"mais curtidas"])
            {
                if([paramFiltrar isEqualToString:@"Todos"]){
                    listaSolucoes = [sa retornaSolucoesAdaptadosTodosPorCurtida];
                    [self mudaContainerView:listaSolucoes];
                    paramOrdenar = param;
                }else{
                    listaSolucoes = [sa retornaTodosSolucoesAdaptadosAreaCurtida:paramFiltrar];
                    [self mudaContainerView:listaSolucoes];
                    paramOrdenar = param;
                }
            }
        }
        
        if(actionSheet == filtrarActionSheet)
        {
            paramFiltrar = param;
            
            if([[paramFiltrar lowercaseString] isEqualToString:@"todos"]){
                if([[paramOrdenar lowercaseString] isEqualToString:@"ultimos inseridos"]){
                    listaSolucoes = [sa retornaSolucaoAdaptadosTodos];
                    [self mudaContainerView:listaSolucoes];
                    paramFiltrar = param;
                    NSLog(@"fuck3");
                }else if([[paramOrdenar lowercaseString] isEqualToString:@"mais curtidas"]){
                    listaSolucoes = [sa retornaSolucoesAdaptadosTodosPorCurtida];
                    [self mudaContainerView:listaSolucoes];
                    paramFiltrar = param;
                    NSLog(@"fuck2");
                }
                
            }else{
                if([[paramOrdenar lowercaseString] isEqualToString:@"ultimos inseridos"]){
                    listaSolucoes = [sa retornaTodosSolucoesAdaptadosAreaUltimos:paramFiltrar];
                    [self mudaContainerView:listaSolucoes];
                    paramFiltrar = param;
                    NSLog(@"fuck1");
                    
                }else if([[paramOrdenar lowercaseString]isEqualToString:@"mais curtidas"]){
                    listaSolucoes = [sa retornaTodosSolucoesAdaptadosAreaCurtida:paramFiltrar];
                    [self mudaContainerView:listaSolucoes];
                    paramFiltrar = param;
                    
                    
                }
            }
        }
        
        self.lblOrdenar.title = paramOrdenar;
        self.lblFiltrar.title = paramFiltrar;
        //[((UITableView *)self.view)reloadData];
        
    }@catch(NSException *e) {
        NSLog(@"Clique fora da ActionSheet");
    }
    
}


@end
