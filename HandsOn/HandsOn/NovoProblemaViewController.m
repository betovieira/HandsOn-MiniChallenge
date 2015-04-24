//
//  NovoProblemaViewController.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "NovoProblemaViewController.h"
#import "Area.h"
#import "Problema.h"

@interface NovoProblemaViewController () <UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;


@end

@implementation NovoProblemaViewController

CGPoint pontoScroll;

Area *a;
NSMutableArray *listaAreas;
UIActionSheet *filtrarActionSheet;
NSInteger indexCliclado;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pontoScroll = self.scrollViewNovoProblema.contentOffset;

    a = [[Area alloc] init];
    listaAreas = [a retornaAreasTodas];
    
    filtrarActionSheet = [[UIActionSheet alloc] initWithTitle:@"Selecionar área"
                                                     delegate:self
                                            cancelButtonTitle:nil
                                       destructiveButtonTitle:nil
                                            otherButtonTitles:nil];
    
    indexCliclado = -1;
    self.lblStatus.hidden = true;
    
    self.descricaoTxt.layer.borderWidth = 0.5f;
    self.descricaoTxt.layer.borderColor = [[UIColor grayColor] CGColor];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.txtCaminhoLink resignFirstResponder];
    [self.descricaoTxt resignFirstResponder];
    [self.scrollViewNovoProblema setContentOffset:pontoScroll animated:YES];
}

- (IBAction)txtEditBegin:(id)sender {
    CGPoint p = pontoScroll;
    p.y += 150;
    [self.scrollViewNovoProblema setContentOffset:p animated:YES];
    
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



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *param;
    
    @try {
        indexCliclado = buttonIndex + 1;
        
        param = [actionSheet buttonTitleAtIndex:buttonIndex];
        
        self.btnArea.title = param;

        
    }@catch(NSException *e) {
        NSLog(@"Clique fora da ActionSheet");
    }
}

- (IBAction)eventCadastrarProblema:(id)sender {
    Problema *p = [[Problema alloc]init];
    
    if(indexCliclado >= 3)
        indexCliclado += 1;
    
    p.id_area = (int) indexCliclado;
    p.id_usuario = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"id_usuario"];;
    
    p.descricaoProblema = self.txtTitulo.text;
    p.descricaoTotalProblema = self.descricaoTxt.text;
    p.caminhoLink = self.txtCaminhoLink.text;
    p.curtidasProblema = 0;
    
    self.lblStatus.hidden = false;
    if([p cadastroProblema:p])
    {
        NSLog(@"Foi carai %d - %d", p.id_usuario, p.id_area);
        self.lblStatus.text = @"Cadastrado com sucesso";
        self.txtTitulo.text = @"";
        self.txtTitulo.text = @"";
        self.txtCaminhoLink.text = @"";
        self.descricaoTxt.text = @"";
        self.btnArea.title = @"Selecione área";
        
    }else{
        self.lblStatus.text = @"Ocorreu algum erro na inserção, verifique a internet!";
        NSLog(@"Não foi carai %d - %d", p.id_usuario, p.id_area);
    }
}



@end
