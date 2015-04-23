//
//  ConfigViewController.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/22/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigViewController: UIViewController

@property (strong, nonatomic) IBOutlet UITextField *novoNome;
@property (strong, nonatomic) IBOutlet UITextField *novoEmail;
@property (strong, nonatomic) IBOutlet UITextField *novoCurso;
@property (strong, nonatomic) IBOutlet UITextField *novasHabilidades;
@property (strong, nonatomic) IBOutlet UITextField *novaSenha;
@property (strong, nonatomic) IBOutlet UITextField *confirmaNovaSenha;
@property (strong, nonatomic) IBOutlet UIButton *novaFoto;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewForm;


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (IBAction)txtEditBegin:(id)sender;
- (IBAction) txtEditEnd:(id)sender;
@end

