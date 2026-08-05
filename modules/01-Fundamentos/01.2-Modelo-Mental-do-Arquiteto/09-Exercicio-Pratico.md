# 09 â€” ExercÃ­cio PrÃ¡tico Resolvido

## CenÃ¡rio

Empresa com:

- 2.000 funcionÃ¡rios;
- Microsoft 365;
- Active Directory;
- AWS;
- ERP;
- VPN;
- desenvolvedores;
- equipe financeira.

## Ativos identificados

### Pessoas

- funcionÃ¡rios;
- terceiros;
- parceiros;
- desenvolvedores;
- equipe financeira;
- administradores.

### Dados

- dados de clientes;
- dados financeiros;
- propriedade intelectual;
- credenciais;
- logs;
- dados da folha de pagamento.

### Sistemas e serviÃ§os

- Microsoft 365;
- ERP;
- sistema financeiro;
- VPN;
- Active Directory;
- Banco de Dados.

### Infraestrutura

- AWS;
- rede corporativa;
- servidores;
- firewalls;
- DNS;
- endpoints.

### Processos

- folha de pagamento;
- compras;
- produÃ§Ã£o;
- desenvolvimento de software;
- atendimento ao cliente.

## Matriz de correlaÃ§Ã£o arquitetural

### 1. FuncionÃ¡rios

| Campo | AnÃ¡lise |
|---|---|
| AmeaÃ§as | Phishing e engenharia social |
| Vulnerabilidades | Baixa conscientizaÃ§Ã£o e reutilizaÃ§Ã£o de senhas |
| Risco | Comprometimento da identidade do usuÃ¡rio |
| Impactos | Fraude, vazamento de dados e perda de produtividade |
| Controles | Treinamento contÃ­nuo, MFA resistente a phishing, Conditional Access e EDR |

### 2. VPN

| Campo | AnÃ¡lise |
|---|---|
| AmeaÃ§as | Credential stuffing e uso de credenciais roubadas |
| Vulnerabilidades | AusÃªncia de MFA e software desatualizado |
| Risco | Acesso remoto nÃ£o autorizado |
| Impactos | Movimento lateral, indisponibilidade e exposiÃ§Ã£o de dados |
| Controles | MFA, Device Trust, ZTNA, segmentaÃ§Ã£o, atualizaÃ§Ã£o e SIEM |

### 3. Banco de Dados

| Campo | AnÃ¡lise |
|---|---|
| AmeaÃ§as | Ransomware e insider mal-intencionado |
| Vulnerabilidades | Contas administrativas compartilhadas e patches atrasados |
| Risco | ExfiltraÃ§Ã£o, alteraÃ§Ã£o ou criptografia de dados |
| Impactos | ParalisaÃ§Ã£o operacional, LGPD e prejuÃ­zo financeiro |
| Controles | PAM, criptografia, segregaÃ§Ã£o, auditoria, backup imutÃ¡vel e segmentaÃ§Ã£o |

### 4. Folha de Pagamento

| Campo | AnÃ¡lise |
|---|---|
| AmeaÃ§as | Fraude interna e comprometimento de conta |
| Vulnerabilidades | Excesso de privilÃ©gios e ausÃªncia de segregaÃ§Ã£o de funÃ§Ãµes |
| Risco | AlteraÃ§Ã£o indevida de pagamentos ou dados bancÃ¡rios |
| Impactos | Perda financeira, impacto trabalhista e dano reputacional |
| Controles | IGA, SoD, mÃºltipla aprovaÃ§Ã£o, MFA, auditoria e revisÃ£o de acessos |

### 5. Credenciais

| Campo | AnÃ¡lise |
|---|---|
| AmeaÃ§as | InfoStealer e phishing AiTM |
| Vulnerabilidades | Senhas fracas e MFA nÃ£o resistente a phishing |
| Risco | Sequestro de conta ou sessÃ£o |
| Impactos | Acesso indevido a Microsoft 365, ERP, VPN e dados sensÃ­veis |
| Controles | FIDO2/WebAuthn, Conditional Access, revogaÃ§Ã£o de sessÃµes, SIEM/UEBA, EDR e SOAR |

## EstratÃ©gia arquitetural

### Identidade

- MFA resistente a phishing;
- Conditional Access;
- menor privilÃ©gio;
- revisÃ£o periÃ³dica de acessos;
- desativaÃ§Ã£o automÃ¡tica no desligamento.

### PrivilÃ©gios

- PAM;
- credenciais em cofre;
- sessÃµes auditadas;
- elevaÃ§Ã£o Just-in-Time;
- eliminaÃ§Ã£o de contas compartilhadas.

### Endpoint

- EDR/XDR;
- hardening;
- atualizaÃ§Ã£o contÃ­nua;
- controle de aplicaÃ§Ãµes.

### Rede

- ZTNA;
- Device Trust;
- segmentaÃ§Ã£o;
- restriÃ§Ã£o de acessos administrativos.

### DetecÃ§Ã£o e resposta

- SIEM;
- UEBA;
- SOAR;
- revogaÃ§Ã£o de tokens;
- bloqueio de conta;
- isolamento de endpoint.

### RecuperaÃ§Ã£o

- backups imutÃ¡veis;
- testes de restauraÃ§Ã£o;
- continuidade de negÃ³cio;
- recuperaÃ§Ã£o de identidade.

## Trade-offs

| DecisÃ£o | BenefÃ­cio | Trade-off |
|---|---|---|
| MFA resistente a phishing | Reduz ataques de credenciais | Custo e mudanÃ§a de experiÃªncia |
| PAM | Controla privilÃ©gios | Complexidade e custo |
| SIEM | Centraliza visibilidade | Exige logs de qualidade e operaÃ§Ã£o especializada |
| SOAR | Acelera resposta | AutomaÃ§Ã£o exige governanÃ§a |
| ZTNA | Reduz confianÃ§a implÃ­cita | Exige integraÃ§Ã£o com identidade e dispositivo |
| RevisÃµes periÃ³dicas | Reduz acessos acumulados | Demanda participaÃ§Ã£o dos gestores |
