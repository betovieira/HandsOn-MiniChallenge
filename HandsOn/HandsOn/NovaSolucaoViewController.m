//
//  NovaSolucaoViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "NovaSolucaoViewController.h"
#import "Solucao.h"
#import "Singleton.h"


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
    Singleton *sing = [Singleton sharedManager];
    NSLog(@"%d", [sing.id_area intValue]);
    NSLog(@"%d", [sing.id_problema intValue]);
    
    s.id_problema = [sing.id_problema intValue] ; // User Default
    s.id_area = [sing.id_area intValue]; // User Default
    s.descricaoSolucao = self.txtTitulo.text;
    s.caminhoAnexoSolucao = self.txtAnexo.text;
    s.descricaoTotalSolucao = self.txtDescricao.text;
    s.caminhoLink = self.txtLinkVideo.text;
    s.interesses = self.txtHabilidades.text;
    s.curtidasSolucao = 0;
    
    if ([s cadastroSolucao:s]) {
        self.txtStatusCadastro.text = @"Cadastrado com sucesso!";
        NSLog(@"Foi carai");
    }else {
        self.txtStatusCadastro.text = @"Insira todos os dados!";
    }
}
@end
