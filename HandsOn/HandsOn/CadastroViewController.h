//
//  CadastroViewController.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CadastroViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtUsuario;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtSenha;
@property (strong, nonatomic) IBOutlet UITextField *txtCurso;
@property (strong, nonatomic) IBOutlet UITextField *txtHabilidades;
@property (strong, nonatomic) IBOutlet UILabel *txtStatus;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewForm;

- (bool) verificaValido:(NSString *)str;
- (IBAction)eventCadastrar:(id)sender;

@end
