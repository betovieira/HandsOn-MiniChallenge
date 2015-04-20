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
#import "MenuLateralPrincipalTableViewController.h"


@interface ProblemasTableViewController () <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblOrdResp;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lblFilResp;


@end

@implementation ProblemasTableViewController

Problema *p;
ProblemasAdapterViewObject *pa;

NSMutableArray *listaProblema;
NSString *paramOrdenar;
NSString *paramFiltrar;
UIButton *imagemCurtir;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    paramOrdenar = @"Ultimos Inseridos";
    paramFiltrar = @"Todos";
    
    p = [[Problema alloc]init];
   
    
    pa = [[ProblemasAdapterViewObject alloc] init];
    
    //listaProblema = [pa retornaProblemasAdaptadosTodos];

}

- (id)initWithListaNova:(NSMutableArray *)listaNova {
    self = [super init];
    if(self){
        listaProblema = listaNova;
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
    return listaProblema.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellProblema" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellProblema"];
    }
    
    pa = [listaProblema objectAtIndex:indexPath.row];
    
    UILabel *labelArea = (UILabel *)[cell viewWithTag:101];
    
    //Area
    labelArea.text = [NSString stringWithFormat:@"%@", pa.nomeArea];
    
    UILabel *labelTitulo = (UILabel *)[cell viewWithTag:103];
    labelTitulo.text = pa.descricaoProblema;
    
    //Usuario
    UILabel *labelCriador = (UILabel *)[cell viewWithTag:104];
    labelCriador.text = [NSString stringWithFormat:@"%@",pa.nome_usuario];
    
    //Curtidas
    UILabel *labelCurtida = (UILabel *)[cell viewWithTag:105];
    labelCurtida.text = [NSString stringWithFormat:@"%d", pa.curtidasProblema];
    // Configure the cell...
    
    //Numero de solucoes
    UILabel *labelSolucoes = (UILabel *)[cell viewWithTag:120];
    labelSolucoes.text = [NSString stringWithFormat:@"Soluções: %d", [p retornaQuantidadeDeSolucoes:pa.id_problema ] ];
    
    
    imagemCurtir = (UIButton *) [cell viewWithTag:210];
    
    //[imagemCurtir setImage: [UIImage imageNamed:@"img_curtirInativo.png"] forState:UIControlStateNormal];

    
    
    return cell;
}


- (IBAction)eventClickCurtidas:(id)sender {
    
    [imagemCurtir setImage: [UIImage imageNamed:@"img_curtirAtivo.png"] forState:UIControlStateNormal];
    
    NSLog(@"Sexo");
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"%lu", indexPath.row);
}






@end
