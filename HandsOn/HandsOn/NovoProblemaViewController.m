//
//  NovoProblemaViewController.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "NovoProblemaViewController.h"
#import "Area.h"

@interface NovoProblemaViewController () <UIActionSheetDelegate>


@end

@implementation NovoProblemaViewController

Area *a;
NSMutableArray *listaAreas;
UIActionSheet *filtrarActionSheet;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    a = [[Area alloc] init];
    listaAreas = [a retornaAreasTodas];
    
    filtrarActionSheet = [[UIActionSheet alloc] initWithTitle:@"Area"
                                                     delegate:self
                                            cancelButtonTitle:nil
                                       destructiveButtonTitle:nil
                                            otherButtonTitles:nil];
    

    
    self.descricaoTxt.layer.borderWidth = 0.5f;
    self.descricaoTxt.layer.borderColor = [[UIColor grayColor] CGColor];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showFiltrarPorArea:(id)sender {
    
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
- (IBAction)showActionArea:(id)sender {
    
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
