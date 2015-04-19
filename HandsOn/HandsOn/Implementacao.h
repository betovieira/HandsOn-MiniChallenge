//
//  Implementacao.h
//  HandsOn
//
//  Created by Pedro Lopes on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Area.h"

@interface Implementacao : NSObject

@property (nonatomic) int id_implementacao;
@property (nonatomic) int id_solucao;
@property (nonatomic) int id_usuario;
@property (nonatomic) int id_area;
@property (nonatomic) NSString *descricaoImplementacao;
@property (nonatomic) NSString *caminhoAnexoImplementacao;
@property (nonatomic) NSString *tags;
@property (nonatomic) int curtidasImplementacao;


+(NSMutableArray *) retornaImplementacoes;
+(NSMutableArray *) retornaImplementacoesPorArea: (Area *)a;
+(NSMutableArray *) retornaImplementacoesCurtidas;

@end
