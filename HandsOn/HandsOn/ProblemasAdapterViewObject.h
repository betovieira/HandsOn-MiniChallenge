//
//  ProblemasAdapterViewObject.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/16/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProblemasAdapterViewObject : NSObject

@property (nonatomic) int id_problema;
@property (nonatomic) int id_area;
@property (nonatomic) NSString *nomeArea;
@property (nonatomic) NSString *descricaoProblema;
@property (nonatomic) NSString *nome_usuario;
@property (nonatomic) NSString *descricaoTotalProblema;
@property (nonatomic) NSString *caminhoLink;
@property (nonatomic) int curtidasProblema;
@property (nonatomic) int quantidadeSolucoes;


//-(NSString*) makeRestAPICall : (NSString*) reqURLStr;
- (NSMutableArray *) retornaTodosProblemasAdaptadosAreaUltimos: (NSString *)strArea;
- (NSMutableArray *) retornaProblemasAdaptadosTodos;
- (NSMutableArray *) retornaTodosProblemasAdaptadosAreaCurtida: (NSString *)strArea;
- (NSMutableArray *) retornaProblemasAdaptadosTodosPorCurtida;

@end
