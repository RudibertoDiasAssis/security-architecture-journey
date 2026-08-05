# 07 â€” Fluxo Arquitetural

## Fluxo principal

```mermaid
flowchart LR
    A[Ativo] --> B[AmeaÃ§a]
    B --> C[Vulnerabilidade]
    C --> D[Risco]
    D --> E[Impacto]
    E --> F[Controle preventivo]
    F --> G[DetecÃ§Ã£o]
    G --> H[Resposta]
    H --> I[RecuperaÃ§Ã£o]
    I --> J[LiÃ§Ãµes aprendidas]
```

## AplicaÃ§Ã£o no cenÃ¡rio de credenciais

```mermaid
flowchart LR
    A[Credencial corporativa] --> B[InfoStealer ou phishing]
    B --> C[Senha fraca ou MFA vulnerÃ¡vel]
    C --> D[Sequestro de conta ou sessÃ£o]
    D --> E[Acesso a M365, ERP ou VPN]
    E --> F[FIDO2 e Conditional Access]
    F --> G[SIEM e UEBA]
    G --> H[SOAR revoga sessÃ£o]
    H --> I[EDR isola endpoint]
```

## Leitura do fluxo

1. Identifique o ativo.
2. Determine as ameaÃ§as relevantes.
3. Localize as vulnerabilidades.
4. Declare o risco de forma objetiva.
5. Traduza o impacto tÃ©cnico para o negÃ³cio.
6. Selecione controles complementares.
7. Defina monitoramento, resposta e recuperaÃ§Ã£o.
8. Registre riscos residuais e trade-offs.
