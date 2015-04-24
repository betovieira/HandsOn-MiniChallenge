//
//  SolucoesAdapterViewObject.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/17/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolucoesAdapterViewObject : NSObject

@property (nonatomic) NSInteger id_solucao;
@property (nonatomic) int id_usuario;
@property (nonatomic) NSString *nomeArea;
@property (nonatomic) NSString *descricaoSolucao;
@property (nonatomic) NSString *interesse;
@property (nonatomic) int curtidasSolucao;

@property (nonatomic) NSString *caminhoAnexoSolucao;

@property (nonatomic) NSString *descricaoTotalSolucao;
@property (nonatomic) NSString *caminhoLink;


- (NSMutableArray *) retornaTodosSolucoesAdaptadosAreaUltimos: (NSString *)strArea;
- (NSMutableArray *) retornaSolucaoAdaptadosTodos;
- (NSMutableArray *) retornaTodosSolucoesAdaptadosAreaCurtida: (NSString *)strArea;
- (NSMutableArray *) retornaSolucoesAdaptadosTodosPorCurtida;
- (NSMutableArray *) retornaTodosSolucoesPorProblema: (int) id_problema;


@end