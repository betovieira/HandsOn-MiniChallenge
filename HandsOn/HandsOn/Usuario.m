//
//  Usuario.m
//  HandsOn
//
//  Created by Humberto Vieira de Castro on 4/8/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "Usuario.h"
#import "BancoDadosHelper.h"

@implementation Usuario

-(bool) verificaLogin:(Usuario *)u
{
    @try {
        NSString *string = [NSString stringWithFormat:@"http://betovieira.com.br/handson/retornadados.php?tipo_operacao=1&email=%@&senha=%@", u.email, u.senha];

        NSArray *separaObjetos = [BancoDadosHelper retornaDados:string];
    
        NSDictionary *separaAtributos = [separaObjetos objectAtIndex:0];

        int retorno = [[separaAtributos objectForKey:@"id_usuario"] intValue];
        
        [[NSUserDefaults standardUserDefaults] setInteger:retorno forKey:@"id_usuario"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        if(retorno < 0)
            return false;
        
        return true;
    }@catch (NSException *e){
        return false;
    }
}

-(bool) cadastroUsuario :(Usuario *)u
{
    
    @try {
        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://betovieira.com.br/handson/inseredados.php"]];

        [urlRequest setHTTPMethod:@"POST"];

        NSString *postString = [NSString stringWithFormat:@"tipo_operacao=1&nomeUsuario=%@&email=%@&senha=%@&curso=%@&interesses=%@", u.nomeUsuario ,  u.email,  u.senha, u.curso, u.interesses];

        [urlRequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long) [postString length]] forHTTPHeaderField:@"Content-length"];

        [urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];

        NSURLConnection *c = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        NSData *response = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
        NSArray *separaObjetos = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
        NSDictionary *separaAtributos = [separaObjetos objectAtIndex:0];
        
        NSString *retorno = [separaAtributos objectForKey:@"retorno"];
        
        NSLog(@"D: %@", retorno);
        
        return [[separaAtributos objectForKey:@"retorno"] boolValue];
        
    }
    @catch(NSException *e)
    {
        return false;
    }
    
}

/*USANDO*/

@end
