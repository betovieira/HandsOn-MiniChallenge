//
//  Solucao.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Solucao : NSObject

@property (nonatomic) int id_solucao;
@property (nonatomic) int id_problema;
@property (nonatomic) NSString *descricaoSolucao;
@property (nonatomic) NSString *caminhoAnexoSolucao;
@property (nonatomic) NSString *interesses;
@property (nonatomic) int curtidasSolucao;

@end
