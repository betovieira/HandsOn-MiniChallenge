//
//  LoginViewController.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "LoginViewController.h"
#import "Usuario.h"
#import "ProblemasTableViewController.h"
#import "CadastroViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

CGPoint pontoScroll;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    pontoScroll = self.scrollLogin.contentOffset;
    // Do any additional setup after loading the view.
    
    self.labelCadastroNaoExistente.hidden = true;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.txtEmail resignFirstResponder];
    [self.txtSenha resignFirstResponder];
    [self.scrollLogin setContentOffset:pontoScroll animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)txtEditBegin:(id)sender {
    CGPoint p = pontoScroll;
    p.y += 100;
    [self.scrollLogin setContentOffset:p animated:YES];
    
}




- (IBAction)eventEntrar:(id)sender {
    Usuario *u = [[Usuario alloc] init];
    u.email = self.txtEmail.text;
    u.senha = self.txtSenha.text;
    
    if([u verificaLogin:u])
    {
        UIStoryboard * tela = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController * view = [tela instantiateViewControllerWithIdentifier:@"viewMenuPrincipal"];
        view.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:view animated:YES completion:nil];
    }else{
        self.labelCadastroNaoExistente.hidden = false;
        
        NSLog(@"Usuario nao encontrado");
    }
}

- (IBAction)eventClick_NaoTenhoCadastro:(id)sender {
    NSLog(@"fuck");
    UIStoryboard * tela = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController * view = [tela instantiateViewControllerWithIdentifier:@"idNavCadastroViewController"];
    view.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:view animated:YES completion:nil];
}
@end
