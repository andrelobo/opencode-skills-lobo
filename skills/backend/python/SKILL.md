---
name: python
description: "Use when working with Python for backend dev, scripts, data processing, and automation. Use ONLY when the task is about Python, not Django or FastAPI."
---

# Python

Desenvolver aplicações backend, scripts e automações com Python,
incluindo processamento de dados e integração com APIs.

## Objetivo

Criar código Python limpo, eficiente e maintainável para
diversos propósitos.

## Fluxo de Trabalho

1. Definir estrutura do projeto
2. Configurar virtualenv
3. Implementar lógica principal
4. Adicionar tratamento de erros
5. Criar testes unitários
6. Documentar com docstrings

## Critérios de Qualidade

- [ ] Código segue PEP 8
- [ ] Virtualenv está configurado
- [ ] Dependências estão no requirements.txt
- [ ] Tratamento de erros está presente
- [ ] Código tem docstrings
- [ ] Testes estão escritos

## Limitações

- Não faz framework web específico (usar Django/FastAPI)
- Não processa dados em larga escala (usar Spark)
- Não faz deploy (usar `@deploy`)
- Não depende de plugins ou MCP servers

## Casos de Uso

- Criar script de automação
- Processar dados com pandas
- Integrar com APIs REST
- Criar web scraper

## Casos onde NÃO utilizar

- Para web framework (usar Django/FastAPI)
- Para machine learning (usar scikit-learn/PyTorch)
- Para frontend (usar `@react`)

## Exemplos

### Exemplo 1: Script de automação

**Entrada:**
```
Criar script para renomear arquivos
```

**Saída Esperada:**
```python
import os
from pathlib import Path

def rename_files(directory: str, old_pattern: str, new_pattern: str):
    """Rename files in directory matching pattern."""
    path = Path(directory)
    
    for file in path.glob(f"*{old_pattern}*"):
        new_name = file.name.replace(old_pattern, new_pattern)
        file.rename(file.parent / new_name)
        print(f"Renamed: {file.name} -> {new_name}")

if __name__ == "__main__":
    rename_files("./downloads", "old", "new")
```

### Exemplo 2: API client

**Entrada:**
```
Criar cliente para API de clima
```

**Saída Esperada:**
```python
import requests
from dataclasses import dataclass

@dataclass
class Weather:
    temperature: float
    description: str
    humidity: int

def get_weather(city: str, api_key: str) -> Weather:
    """Fetch weather data from API."""
    response = requests.get(
        f"https://api.weather.com/v1/current",
        params={"city": city, "apikey": api_key}
    )
    response.raise_for_status()
    
    data = response.json()
    return Weather(
        temperature=data["temp"],
        description=data["desc"],
        humidity=data["humidity"]
    )
```
