//
//  LoginViewController.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtSenha;
@property (strong, nonatomic) IBOutlet UIButton *btnEntrar;
@property (strong, nonatomic) IBOutlet UILabel *labelCadastroNaoExistente;


- (IBAction)eventEntrar:(id)sender;

- (IBAction)eventClick_NaoTenhoCadastro:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollLogin;

@end
