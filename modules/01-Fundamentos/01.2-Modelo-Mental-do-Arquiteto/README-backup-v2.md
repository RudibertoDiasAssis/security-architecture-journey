# 01.2 â€” Modelo Mental do Arquiteto de SeguranÃ§a

> **Status:** âœ… ConteÃºdo inicial concluÃ­do  
> **DomÃ­nio:** Fundamentos  
> **NÃ­vel:** Foundation

## Objetivo do mÃ³dulo

Desenvolver a capacidade de correlacionar ativos, ameaÃ§as, vulnerabilidades, riscos, impactos e controles arquiteturais.

## Conceitos fundamentais

### Ativo

Qualquer elemento que possua valor para a organizaÃ§Ã£o.

### AmeaÃ§a

Evento, agente ou condiÃ§Ã£o com potencial de causar dano a um ativo.

### Vulnerabilidade

Fraqueza que pode ser explorada por uma ameaÃ§a.

### Risco

Possibilidade de uma ameaÃ§a explorar uma vulnerabilidade e causar impacto.

## Fluxo mental

```mermaid
flowchart LR
    A[Ativo] --> B[AmeaÃ§a]
    B --> C[Vulnerabilidade]
    C --> D[Risco]
    D --> E[Impacto]
    E --> F[Controle]
```

## ExercÃ­cio prÃ¡tico revisado

### Ativos identificados

**Pessoas**
- FuncionÃ¡rios
- Terceiros
- Parceiros
- Desenvolvedores
- Equipe Financeira
- Administradores

**Dados**
- Dados de clientes
- Dados financeiros
- Propriedade intelectual
- Credenciais
- Logs
- Dados da folha de pagamento

**Sistemas e serviÃ§os**
- Microsoft 365
- ERP
- Sistema financeiro
- VPN
- Active Directory
- Banco de Dados

**Infraestrutura**
- AWS
- Rede corporativa
- Servidores
- Firewalls
- DNS
- Endpoints

**Processos**
- Folha de pagamento
- Compras
- ProduÃ§Ã£o
- Desenvolvimento de software
- Atendimento ao cliente

## Matriz de correlaÃ§Ã£o arquitetural

| Ativo | AmeaÃ§as | Vulnerabilidades | Risco | Impactos para o negÃ³cio | Controles arquiteturais |
|---|---|---|---|---|---|
| FuncionÃ¡rios | Phishing; engenharia social | Baixa conscientizaÃ§Ã£o; reutilizaÃ§Ã£o de senhas | Comprometimento da identidade | Fraude, vazamento e perda de produtividade | Treinamento, MFA resistente a phishing, Conditional Access e EDR |
| VPN | Credential stuffing; credenciais roubadas | AusÃªncia de MFA; software desatualizado | Acesso remoto nÃ£o autorizado | Movimento lateral e exposiÃ§Ã£o de dados | MFA, Device Trust, ZTNA, segmentaÃ§Ã£o e SIEM |
| Banco de Dados | Ransomware; insider | Contas compartilhadas; patches atrasados | ExfiltraÃ§Ã£o, alteraÃ§Ã£o ou criptografia | ParalisaÃ§Ã£o, LGPD e prejuÃ­zo financeiro | PAM, criptografia, auditoria, backup imutÃ¡vel e segmentaÃ§Ã£o |
| Folha de Pagamento | Fraude interna; conta comprometida | Excesso de privilÃ©gios; ausÃªncia de SoD | AlteraÃ§Ã£o indevida de pagamentos | Perda financeira e dano reputacional | IGA, SoD, mÃºltipla aprovaÃ§Ã£o, MFA e revisÃ£o de acessos |
| Credenciais | InfoStealer; phishing/AiTM | Senhas fracas; MFA nÃ£o resistente a phishing | Sequestro de conta ou sessÃ£o | Acesso indevido a M365, ERP e VPN | FIDO2/WebAuthn, Conditional Access, SIEM/UEBA, EDR e SOAR |

## EstratÃ©gia arquitetural

- MFA resistente a phishing
- PAM para contas privilegiadas
- Conditional Access
- RevisÃµes periÃ³dicas de acesso
- IGA e segregaÃ§Ã£o de funÃ§Ãµes
- EDR/XDR
- SIEM para correlaÃ§Ã£o
- SOAR para resposta automÃ¡tica
- ZTNA e Device Trust
- SegmentaÃ§Ã£o de rede
- Backups imutÃ¡veis

## Como um arquiteto pensa

O arquiteto nÃ£o trata apenas a credencial comprometida. Ele projeta controles em camadas para prevenir, detectar, limitar e responder ao ataque.

## Resumo executivo

O modelo mental do arquiteto conecta ativo, ameaÃ§a, vulnerabilidade, risco, impacto e controle para justificar decisÃµes tÃ©cnicas e de negÃ³cio.
