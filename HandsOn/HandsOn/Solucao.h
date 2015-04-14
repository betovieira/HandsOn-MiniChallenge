//
//  Solucao.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Area.h"

@interface Solucao : NSObject

@property (nonatomic) int id_solucao;
@property (nonatomic) int id_problema;
@property (nonatomic) int id_area;
@property (nonatomic) NSString *descricaoSolucao;
@property (nonatomic) NSString *caminhoAnexoSolucao;
@property (nonatomic) NSString *interesses;
@property (nonatomic) int curtidasSolucao;

-(NSMutableArray *) retornaSolucoes;
-(NSMutableArray *) retornaSolucoesPorID: (Solucao *)s;
-(NSMutableArray *) retornaSolucoesPorArea: (Area *)a;
-(NSMutableArray *) retornaSolucoesCurtidas;
-(NSInteger *) retornaQuantidadeImplementacoes: (Solucao *)s;
-(NSMutableArray *) retornaImplementacoesPorSolucao: (Solucao *)s;

@end
