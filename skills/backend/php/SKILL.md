---
name: php
description: "Use when working with PHP for server-side dev, web apps, and CMS integration. Use ONLY when the task is about PHP, not Laravel or Symfony."
---

# PHP

Desenvolver aplicações server-side com PHP, incluindo APIs,
web applications e integração com bancos de dados.

## Objetivo

Criar código PHP moderno, seguro e performático para
web applications.

## Fluxo de Trabalho

1. Configurar projeto com Composer
2. Definir estrutura de pastas
3. Implementar rotas e controllers
4. Configurar autoloading
5. Adicionar tratamento de erros
6. Criar testes com PHPUnit

## Critérios de Qualidade

- [ ] Código usa PHP 8+ features
- [ ] Composer é usado para dependências
- [ ] Autoloading está configurado
- [ ] Prepared statements são usados
- [ ] Tratamento de erros está presente
- [ ] Código tem PHPDoc

## Limitações

- Não faz framework específico (usar Laravel/Symfony)
- Não faz frontend (usar `@react`)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar API REST
- Integrar com WordPress/Drupal
- Criar script de migração
- Processar formulários

## Casos onde NÃO utilizar

- Para framework completo (usar Laravel)
- Para protótipos rápidos (usar `@python`)
- Para apps real-time (usar `@nodejs`)

## Exemplos

### Exemplo 1: API REST básica

**Entrada:**
```
Criar endpoint para listar usuários
```

**Saída Esperada:**
```php
<?php
header('Content-Type: application/json');

$pdo = new PDO('mysql:host=localhost;dbname=app', 'user', 'pass');

$stmt = $pdo->query('SELECT id, name, email FROM users');
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($users);
```

### Exemplo 2: Prepared statement

**Entrada:**
```
Criar query segura para buscar usuário
```

**Saída Esperada:**
```php
<?php
function getUserByEmail(PDO $pdo, string $email): ?array
{
    $stmt = $pdo->prepare('SELECT * FROM users WHERE email = :email');
    $stmt->execute(['email' => $email]);
    
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    return $user ?: null;
}
```
