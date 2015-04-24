//
//  DetalheProblemaViewController.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/24/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemasAdapterViewObject.h"


@interface DetalheProblemaViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *containerDetalheProblema;

@property (strong, nonatomic) IBOutlet UIView *containerSolucoesProblema;
- (id)initWithProblema:(ProblemasAdapterViewObject *) temp;
@end
