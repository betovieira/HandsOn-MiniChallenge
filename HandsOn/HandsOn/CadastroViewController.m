//
//  CadastroViewController.m
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "CadastroViewController.h"
#import "Usuario.h"

@interface CadastroViewController ()
- (bool) verificaValido:(NSString *)str;
@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtStatus.hidden = true;
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

- (IBAction)eventCadastrar:(id)sender {
    Usuario *u = [[Usuario alloc]init];
    u.nomeUsuario = self.txtUsuario.text;
    u.email = self.txtEmail.text;
    u.senha = self.txtSenha.text;
    u.curso = self.txtCurso.text;
    u.interesses = self.txtHabilidades.text;
    
    if(![u.nomeUsuario isEqual: @""] && ![u.email isEqual: @""] && ![u.senha isEqual: @""] &&
       ![u.curso isEqual: @""] && ![u.interesses isEqual: @""]){
        if([u cadastroUsuario:u])
        {
            self.txtStatus.hidden = false;
            self.txtStatus.text = @"Cadastrado com sucesso!";
        }else{
            self.txtStatus.hidden = false;
            self.txtStatus.text = @"Email existente no banco de dados";
        }
    }else{
        self.txtStatus.hidden = false;
        self.txtStatus.text = @"Preencha campos vazios!";
    }
}

- (bool) verificaValido:(NSString *)str {
    if([str isEqual: @""])
        return false;
    return true;
}
@end
