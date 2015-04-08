//
//  Usuario.h
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject

@property (nonatomic) int id_usuario;
@property (nonatomic) NSString *nomeUsuario;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *senha;
@property (nonatomic) NSString *curso;
@property (nonatomic) NSString *interesse;


@end
