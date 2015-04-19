//
//  Problema.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Area.h"
#import "Solucao.h"

@interface Problema : NSObject

@property (nonatomic) int id_problema;
@property (nonatomic) int id_usuario;
@property (nonatomic) int id_area;
@property (nonatomic) NSString *descricaoProblema;
@property (nonatomic) int curtidasProblema;

- (NSMutableArray *) retornaProblemasTodos;
- (NSMutableArray *) retornaProblemasTodosAreaUltimos: (NSString *)strArea;
- (int) retornaQuantidadeDeSolucoes: (int) id_problema;

- (NSMutableArray *) retornaProblemasArea: (Area *)a;
- (NSMutableArray *) retornaProblemasCurtidos;
- (NSMutableArray *) retornaSolucoesPorProblema: (Problema *)r;

@end
