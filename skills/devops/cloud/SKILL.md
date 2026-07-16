---
name: cloud
description: "Use when working with AWS, GCP, or Azure for infrastructure. Use ONLY when the task is about cloud infrastructure, not deployment."
---

# Cloud

Trabalhar com plataformas cloud como AWS, GCP e Azure para
infraestrutura e serviços gerenciados.

## Objetivo

Projetar e gerenciar infraestrutura cloud escalável e custo-eficiente.

## Fluxo de Trabalho

1. Selecionar serviços apropriados
2. Configurar IAM e seguranças
3. Implementar infraestrutura como código
4. Configurar monitoring e alerts
5. Otimizar custos
6. Configurar backup e restore

## Critérios de Qualidade

- [ ] IAM segue princípio do menor privilégio
- [ ] Serviços são adequados ao caso de uso
- [ ] Custos estão monitorados
- [ ] Backup está configurado
- [ ] Monitoring está ativo
- [ ] Infraestrutura é versionada

## Limitações

- Não faz deploy de aplicação (usar `@deploy`)
- Não faz CI/CD (usar `@ci-cd`)
- Não faz containerização (usar `@docker`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Configurar EC2/ECS
- Configurar RDS/DocumentDB
- Configurar S3 para assets
- Configurar CloudFront CDN

## Casos onde NÃO utilizar

- Para deploy de app (usar `@deploy`)
- Para CI/CD (usar `@ci-cd`)
- Para containerização (usar `@docker`)

## Exemplos

### Exemplo 1: EC2 com Terraform

**Entrada:**
```
Criar EC2 para aplicação Node.js
```

**Saída Esperada:**
```hcl
resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  
  vpc_security_group_ids = [aws_security_group.app.id]
  subnet_id              = aws_subnet.public.id
  
  tags = {
    Name = "app-server"
  }
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              systemctl start docker
              docker run -d -p 80:3000 myapp:latest
              EOF
}
```

### Exemplo 2: S3 bucket

**Entrada:**
```
Criar S3 para assets estáticos
```

**Saída Esperada:**
```hcl
resource "aws_s3_bucket" "assets" {
  bucket = "myapp-assets"
}

resource "aws_s3_bucket_policy" "assets" {
  bucket = aws_s3_bucket.assets.id
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.assets.arn}/*"
      }
    ]
  })
}
```
