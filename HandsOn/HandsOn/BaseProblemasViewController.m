//
//  BaseProblemasViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/19/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "BaseProblemasViewController.h"
#import "Area.h"
#import "ProblemasTableViewController.h"
#import "ProblemasAdapterViewObject.h"

@interface BaseProblemasViewController () <UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblOrdenar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblFiltrar;

@end

@implementation BaseProblemasViewController

Area *a;
ProblemasAdapterViewObject *pa;
NSMutableArray *listaProblema;
NSMutableArray *listaAreas;
UIActionSheet *ordenarActionSheet;
UIActionSheet *filtrarActionSheet;
NSString *paramOrdenar;
NSString *paramFiltrar;
UIButton *imagemCurtir;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pa = [[ProblemasAdapterViewObject alloc] init];
    
    ProblemasTableViewController *problemaView;
    
    
    listaProblema = [pa retornaProblemasAdaptadosTodos];
    
    //problemaView = [[ProblemasTableViewController alloc] initWithListaNova:listaProblema];
    
    problemaView = [self.storyboard instantiateViewControllerWithIdentifier:@"viewProblemas"];
    problemaView.view.frame = self.containerView.frame;
    
    [problemaView willMoveToParentViewController:self];
    [self.containerView addSubview:problemaView.view];
    [self addChildViewController:problemaView];
    [problemaView didMoveToParentViewController:self];
    
   
    
    paramOrdenar = @"Ultimos inseridos";
    paramFiltrar = @"Todos";
    
    self.lblOrdenar.title = paramOrdenar;
    self.lblFiltrar.title = paramFiltrar;
    
    
    [self.lblOrdenar setTintColor:[UIColor clearColor]];
    [self.lblFiltrar setTintColor:[UIColor clearColor]];

    
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

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) mudaContainerView:(NSMutableArray *)m
{
    ProblemasTableViewController *problemaView;
    //problemaView = [[ProblemasTableViewController alloc] initWithListaNova:m];
    
    problemaView = [self.storyboard instantiateViewControllerWithIdentifier:@"viewProblemas"];
    
    problemaView.view.frame = self.containerView.frame;
    
    [problemaView willMoveToParentViewController:self];
    [self.containerView addSubview:problemaView.view];
    [self addChildViewController:problemaView];
    [problemaView didMoveToParentViewController:self];
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
                    listaProblema = [pa retornaProblemasAdaptadosTodos];
                    [self mudaContainerView:listaProblema];
                    paramOrdenar = param;
                    
                }else{
                    listaProblema = [pa retornaTodosProblemasAdaptadosAreaUltimos:paramFiltrar];
                    [self mudaContainerView:listaProblema];
                    paramOrdenar = param;
                }
            }else if([[paramOrdenar lowercaseString] isEqualToString:@"mais curtidas"])
            {
                if([paramFiltrar isEqualToString:@"Todos"]){
                    listaProblema = [pa retornaProblemasAdaptadosTodosPorCurtida];
                    [self mudaContainerView:listaProblema];
                    paramOrdenar = param;
                }else{
                    listaProblema = [pa retornaTodosProblemasAdaptadosAreaCurtida:paramFiltrar];
                    [self mudaContainerView:listaProblema];
                    paramOrdenar = param;
                }
            }
        }
        
        if(actionSheet == filtrarActionSheet)
        {
            paramFiltrar = param;
            
            if([[paramFiltrar lowercaseString] isEqualToString:@"todos"]){
                if([[paramOrdenar lowercaseString] isEqualToString:@"ultimos inseridos"]){
                    listaProblema = [pa retornaProblemasAdaptadosTodos];
                    [self mudaContainerView:listaProblema];
                    paramFiltrar = param;
                    //NSLog(@"fuck3");
                }else if([[paramOrdenar lowercaseString] isEqualToString:@"mais curtidas"]){
                    listaProblema = [pa retornaProblemasAdaptadosTodosPorCurtida];
                    [self mudaContainerView:listaProblema];
                    paramFiltrar = param;
                    //NSLog(@"fuck2");
                }
                
            }else{
                if([[paramOrdenar lowercaseString] isEqualToString:@"ultimos inseridos"]){
                    listaProblema = [pa retornaTodosProblemasAdaptadosAreaUltimos:paramFiltrar];
                    [self mudaContainerView:listaProblema];
                    paramFiltrar = param;
                    //NSLog(@"fuck1");
                    
                }else if([[paramOrdenar lowercaseString]isEqualToString:@"mais curtidas"]){
                    listaProblema = [pa retornaTodosProblemasAdaptadosAreaCurtida:paramFiltrar];
                    [self mudaContainerView:listaProblema];
                    paramFiltrar = param;
                    //NSLog(@"fuck4");
                    
                    
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
