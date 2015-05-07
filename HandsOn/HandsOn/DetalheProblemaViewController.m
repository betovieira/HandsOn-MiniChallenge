//
//  DetalheProblemaViewController.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/24/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "DetalheProblemaViewController.h"
#import "ProblemasAdapterViewObject.h"
#import "DetalheProblemaContainer1TableView.h"
#import "DetalheProblemaContainer2TableView.h"
#import "SolucoesAdapterViewObject.h"
#import "Singleton.h"

@interface DetalheProblemaViewController ()

@end

ProblemasAdapterViewObject *p;
SolucoesAdapterViewObject *so;

@implementation DetalheProblemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    so =[[SolucoesAdapterViewObject alloc]init];
    @try{
    
    DetalheProblemaContainer1TableView *viewProblema1;
    viewProblema1 = [[DetalheProblemaContainer1TableView alloc] init];
    viewProblema1 = [self.storyboard instantiateViewControllerWithIdentifier:@"detalheProblemaContainer1"];
    
    viewProblema1.view.frame = self.containerDetalheProblema.frame;
    

    [viewProblema1 willMoveToParentViewController:self];
    

    [self.containerDetalheProblema addSubview:viewProblema1.view];
    

    [self addChildViewController:viewProblema1];
    
    [viewProblema1 didMoveToParentViewController:self];

    }
    @catch(NSException *e){
        NSLog(@"", e);
    }
    NSMutableArray *lista = [so retornaTodosSolucoesPorProblema:p.id_problema];
    
    DetalheProblemaContainer2TableView *viewProblema2;
    viewProblema2 = [[DetalheProblemaContainer2TableView alloc]  initWithLista:lista];
    
    viewProblema2 = [self.storyboard instantiateViewControllerWithIdentifier:@"detalheProblemaContainer2"];
    //NSLog(@"1");
    viewProblema2.view.frame = self.containerDetalheProblema.frame;
    
    [viewProblema2 willMoveToParentViewController:self];
    [self.containerSolucoesProblema addSubview:viewProblema2.view];
    [self addChildViewController:viewProblema2];
    [viewProblema2 didMoveToParentViewController:self];
    
    Singleton* a = [Singleton sharedManager];
    a.id_problema = [NSString stringWithFormat:@"%d", p.id_problema];
    a.id_area = [NSString stringWithFormat:@"%d",p.id_area];
    
    
    NSLog(@"-----------------jj-----2");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithProblema:(ProblemasAdapterViewObject *) temp {
    self = [super init];
    
    if(self){
        p = temp;
    }
    
    return self;
    
}

@end
