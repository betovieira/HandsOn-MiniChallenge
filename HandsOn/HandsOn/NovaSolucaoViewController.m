//
//  NovaSolucaoViewController.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "NovaSolucaoViewController.h"
#import "Solucao.h"


@interface NovaSolucaoViewController ()
@end

@implementation NovaSolucaoViewController

CGPoint pontoScroll;

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    self.txtDescricao.layer.borderWidth = 0.5f;
    self.txtDescricao.layer.borderColor = [[UIColor grayColor] CGColor];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.txtTitulo resignFirstResponder];
    [self.txtAnexo resignFirstResponder];
    [self.txtLinkVideo resignFirstResponder];
    [self.txtHabilidades resignFirstResponder];
    [self.txtDescricao resignFirstResponder];
    
    [self.scrollView setContentOffset:pontoScroll animated:YES];
}

- (IBAction)txtEditBegin:(id)sender {
    CGPoint p = pontoScroll;
    p.y += 150;
    [self.scrollView setContentOffset:p animated:YES];
    
}


- (IBAction)eventCadastrar:(id)sender {
    Solucao *s = [[Solucao alloc]init];
    s.id_problema = 12; // User Default
    s.id_area = 1; // User Default
    s.descricaoSolucao = self.txtTitulo.text;
    s.caminhoAnexoSolucao = self.txtAnexo.text;
    s.descricaoTotalSolucao = self.txtDescricao.text;
    s.caminhoLink = self.txtLinkVideo.text;
    s.interesses = self.txtHabilidades.text;
    s.curtidasSolucao = 0;
    
    if ([s cadastroSolucao:s]) {
        NSLog(@"Foi carai");
    }else {
        NSLog(@"Nao foi");
    }
}
@end
