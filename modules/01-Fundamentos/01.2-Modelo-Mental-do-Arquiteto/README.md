# 01.2 â€” Modelo Mental do Arquiteto de SeguranÃ§a

> **Status:** ConcluÃ­do  
> **DomÃ­nio:** Fundamentos  
> **NÃ­vel:** Foundation  
> **Tempo estimado:** 4 horas

## Objetivo

Desenvolver o raciocÃ­nio necessÃ¡rio para correlacionar ativos, ameaÃ§as, vulnerabilidades, riscos, impactos e controles antes de selecionar tecnologias.

## Ordem de estudo

1. [Conceitos fundamentais](01-Conceitos.md)
2. [Ativos](02-Ativos.md)
3. [AmeaÃ§as](03-Ameacas.md)
4. [Vulnerabilidades](04-Vulnerabilidades.md)
5. [Riscos e impactos](05-Riscos-e-Impactos.md)
6. [Controles de seguranÃ§a](06-Controles.md)
7. [Fluxo arquitetural](07-Fluxo-Arquitetural.md)
8. [Como um arquiteto pensa](08-Como-um-Arquiteto-Pensa.md)
9. [ExercÃ­cio prÃ¡tico resolvido](09-Exercicio-Pratico.md)
10. [Resumo executivo](10-Resumo-Executivo.md)

## Artefatos do mÃ³dulo

- [Architecture Canvas](architecture-canvas.md)
- [ADR â€” ProteÃ§Ã£o de identidades em camadas](adr/ADR-0001-Protecao-de-Identidades-em-Camadas.md)
- [Diagrama do modelo mental](diagramas/01-Fluxo-Modelo-Mental.md)
- [Flashcards para Anki](flashcards/anki.csv)

## Modelo central

```mermaid
flowchart LR
    A[Ativo] --> B[AmeaÃ§a]
    B --> C[Vulnerabilidade]
    C --> D[Risco]
    D --> E[Impacto]
    E --> F[Controle]
```

## PrÃ³ximo mÃ³dulo

**01.3 â€” Risco, AmeaÃ§a e Controle**
