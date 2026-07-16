---
name: nestjs
description: "Use when building scalable server apps with NestJS, TypeScript, modules, and decorators. Use ONLY when the task is about NestJS, not Express."
---

# NestJS

Desenvolver aplicações backend escaláveis com NestJS, incluindo
módulos, controllers, services, pipes e guards.

## Objetivo

Criar aplicações backend robustas com arquitetura modular,
dependency injection e TypeScript.

## Fluxo de Trabalho

1. Criar módulo com decorator
2. Implementar controller com rotas
3. Criar service para lógica de negócio
4. Configurar pipes e guards
5. Implementar filters para erros
6. Configurar middlewares

## Critérios de Qualidade

- [ ] Módulos são organizados por domínio
- [ ] Controllers são finos e delegam para services
- [ ] Services são testáveis com dependency injection
- [ ] Validação é feita com pipes
- [ ] Autenticação usa guards
- [ ] Erros são tratados com filters

## Limitações

- Não faz frontend (usar `@react` ou `@nextjs`)
- Não gerencia banco de dados diretamente (usar TypeORM/Prisma)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar API REST complexa
- Implementar microserviços
- Criar aplicação com WebSocket
- Integrar com GraphQL

## Casos onde NÃO utilizar

- Para APIs simples (usar `@express`)
- Para protótipos rápidos (usar `@nodejs`)
- Para SPAs (usar `@react`)

## Exemplos

### Exemplo 1: Controller básico

**Entrada:**
```
Criar controller para usuários
```

**Saída Esperada:**
```typescript
@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}
  
  @Get()
  findAll(): Promise<User[]> {
    return this.usersService.findAll();
  }
  
  @Get(':id')
  findOne(@Param('id') id: string): Promise<User> {
    return this.usersService.findOne(id);
  }
  
  @Post()
  create(@Body() createUserDto: CreateUserDto): Promise<User> {
    return this.usersService.create(createUserDto);
  }
}
```

### Exemplo 2: Pipe de validação

**Entrada:**
```
Criar pipe para validar DTO
```

**Saída Esperada:**
```typescript
export class ValidationPipe implements PipeTransform {
  transform(value: any, metadata: ArgumentMetadata) {
    const object = plainToInstance(metadata.metatype, value);
    const errors = validate(object);
    
    if (errors.length > 0) {
      throw new BadRequestException(errors);
    }
    
    return value;
  }
}
```
