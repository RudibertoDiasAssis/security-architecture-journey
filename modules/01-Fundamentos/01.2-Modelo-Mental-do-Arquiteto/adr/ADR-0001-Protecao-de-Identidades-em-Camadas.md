# ADR-0001 â€” ProteÃ§Ã£o de Identidades em Camadas

- **Status:** Aceito
- **Data:** 2026-08-05

## Contexto

A empresa depende de Microsoft 365, Active Directory, AWS, ERP, VPN e processos financeiros. Uma identidade comprometida pode permitir acesso a vÃ¡rios ativos crÃ­ticos.

## Problema

Senha e MFA convencional podem nÃ£o impedir InfoStealer, phishing AiTM, roubo de token ou abuso de privilÃ©gios.

## OpÃ§Ãµes consideradas

### OpÃ§Ã£o 1 â€” Apenas MFA convencional

Baixo esforÃ§o, mas proteÃ§Ã£o limitada contra ataques modernos.

### OpÃ§Ã£o 2 â€” MFA e SIEM

Melhora prevenÃ§Ã£o e visibilidade, mas nÃ£o controla adequadamente privilÃ©gios e resposta.

### OpÃ§Ã£o 3 â€” ProteÃ§Ã£o de identidade em camadas

Combina MFA resistente a phishing, Conditional Access, PAM, IGA, EDR, SIEM, SOAR, Device Trust e segmentaÃ§Ã£o.

## DecisÃ£o

Adotar a opÃ§Ã£o 3.

## Justificativa

A estratÃ©gia reduz a probabilidade de comprometimento, limita privilÃ©gios e movimento lateral, aumenta detecÃ§Ã£o e acelera resposta.

## ConsequÃªncias positivas

- menor risco de sequestro de conta;
- melhor governanÃ§a;
- maior rastreabilidade;
- contenÃ§Ã£o automatizada;
- alinhamento com Zero Trust.

## ConsequÃªncias negativas

- maior custo;
- integraÃ§Ã£o mais complexa;
- necessidade de maturidade operacional;
- possÃ­vel atrito inicial para usuÃ¡rios.

## Riscos residuais

- roubo de sessÃ£o;
- falhas de integraÃ§Ã£o;
- automaÃ§Ãµes mal configuradas;
- exceÃ§Ãµes permanentes.

## MÃ©tricas

- usuÃ¡rios protegidos por MFA resistente a phishing;
- contas privilegiadas no PAM;
- tempo de revogaÃ§Ã£o de sessÃ£o;
- contas Ã³rfÃ£s;
- MTTD e MTTR.
