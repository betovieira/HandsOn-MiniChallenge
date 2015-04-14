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


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.labelCadastroNaoExistente.hidden = true;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)eventNaoTenhoCadastro:(id)sender {

    
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
@end
