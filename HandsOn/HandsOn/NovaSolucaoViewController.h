//
//  NovaSolucaoViewController.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NovaSolucaoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UITextField *txtTitulo;
@property (strong, nonatomic) IBOutlet UITextField *txtLinkVideo;
@property (strong, nonatomic) IBOutlet UITextField *txtAnexo;
@property (strong, nonatomic) IBOutlet UITextField *txtHabilidades;
@property (weak, nonatomic) IBOutlet UITextView *txtDescricao;
@property (strong, nonatomic) IBOutlet UILabel *txtStatusCadastro;

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (IBAction)eventCadastrar:(id)sender;

//- (IBAction) txtEditBegi:(id)sender;
//- (IBAction) txtEditEnd: (id)sender;

@end
