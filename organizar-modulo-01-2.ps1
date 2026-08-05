$ErrorActionPreference = "Stop"

# Execute este script na raiz do repositório:
# .\organizar-modulo-01-2.ps1

$ProjectRoot = (Get-Location).Path
$ModulePath = Join-Path $ProjectRoot "modules\01-Fundamentos\01.2-Modelo-Mental-do-Arquiteto"

if (-not (Test-Path -LiteralPath $ModulePath)) {
    throw "Módulo não encontrado: $ModulePath`nExecute o script na raiz do repositório."
}

function Write-Utf8File {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Content
    )

    # UTF-8 com BOM é compatível com Windows PowerShell 5.1 e renderiza corretamente no GitHub.
    Set-Content -LiteralPath $Path -Value $Content -Encoding UTF8
    Write-Host "[ATUALIZADO] $Path" -ForegroundColor Green
}

# Backup do README antigo
$ReadmePath = Join-Path $ModulePath "README.md"
$BackupPath = Join-Path $ModulePath "README-backup-v2.md"

if ((Test-Path -LiteralPath $ReadmePath) -and (-not (Test-Path -LiteralPath $BackupPath))) {
    Copy-Item -LiteralPath $ReadmePath -Destination $BackupPath
    Write-Host "[BACKUP] $BackupPath" -ForegroundColor Yellow
}

$Readme = @'
# 01.2 — Modelo Mental do Arquiteto de Segurança

> **Status:** Concluído  
> **Domínio:** Fundamentos  
> **Nível:** Foundation  
> **Tempo estimado:** 4 horas

## Objetivo

Desenvolver o raciocínio necessário para correlacionar ativos, ameaças, vulnerabilidades, riscos, impactos e controles antes de selecionar tecnologias.

## Ordem de estudo

1. [Conceitos fundamentais](01-Conceitos.md)
2. [Ativos](02-Ativos.md)
3. [Ameaças](03-Ameacas.md)
4. [Vulnerabilidades](04-Vulnerabilidades.md)
5. [Riscos e impactos](05-Riscos-e-Impactos.md)
6. [Controles de segurança](06-Controles.md)
7. [Fluxo arquitetural](07-Fluxo-Arquitetural.md)
8. [Como um arquiteto pensa](08-Como-um-Arquiteto-Pensa.md)
9. [Exercício prático resolvido](09-Exercicio-Pratico.md)
10. [Resumo executivo](10-Resumo-Executivo.md)

## Artefatos do módulo

- [Architecture Canvas](architecture-canvas.md)
- [ADR — Proteção de identidades em camadas](adr/ADR-0001-Protecao-de-Identidades-em-Camadas.md)
- [Diagrama do modelo mental](diagramas/01-Fluxo-Modelo-Mental.md)
- [Flashcards para Anki](flashcards/anki.csv)

## Modelo central

```mermaid
flowchart LR
    A[Ativo] --> B[Ameaça]
    B --> C[Vulnerabilidade]
    C --> D[Risco]
    D --> E[Impacto]
    E --> F[Controle]
```

## Próximo módulo

**01.3 — Risco, Ameaça e Controle**
'@

$Conceitos = @'
# 01 — Conceitos Fundamentais

## Visão geral

Um arquiteto de segurança não começa pela ferramenta. Ele começa entendendo o problema de negócio e estabelecendo a relação entre:

```text
Ativo → Ameaça → Vulnerabilidade → Risco → Impacto → Controle
```

## Ativo

Qualquer elemento que possua valor para a organização.

Exemplos:

- pessoas;
- dados;
- sistemas;
- infraestrutura;
- processos de negócio;
- reputação;
- propriedade intelectual.

## Ameaça

Evento, agente ou condição com potencial de causar dano a um ativo.

Exemplos:

- atacante externo;
- funcionário mal-intencionado;
- ransomware;
- InfoStealer;
- falha de fornecedor;
- erro humano.

## Vulnerabilidade

Fraqueza que pode ser explorada por uma ameaça.

Exemplos:

- senha fraca;
- ausência de MFA;
- software desatualizado;
- excesso de privilégios;
- contas compartilhadas;
- configuração insegura.

## Risco

Possibilidade de uma ameaça explorar uma vulnerabilidade e provocar impacto.

## Impacto

Consequência da materialização do risco.

Pode ser:

- técnico;
- operacional;
- financeiro;
- regulatório;
- reputacional;
- estratégico.

## Controle

Medida utilizada para prevenir, detectar, responder ou recuperar-se de um evento de segurança.

## Regra mental

> Uma tecnologia só deve ser recomendada depois de demonstrarmos qual risco ela reduz e como se integra aos demais controles.
'@

$Ativos = @'
# 02 — Ativos

## Definição

Ativo é qualquer elemento que tenha valor para a organização e cuja perda, alteração, exposição ou indisponibilidade possa afetar o negócio.

## Categorias

### Pessoas

- funcionários;
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

### Sistemas e serviços

- Microsoft 365;
- ERP;
- sistema financeiro;
- VPN;
- Active Directory;
- bancos de dados.

### Infraestrutura

- AWS;
- rede corporativa;
- servidores;
- firewalls;
- DNS;
- endpoints.

### Processos de negócio

- folha de pagamento;
- compras;
- produção;
- desenvolvimento de software;
- atendimento ao cliente.

## Como identificar ativos críticos

Pergunte:

1. O que gera receita?
2. O que sustenta a operação?
3. Quais dados possuem obrigações legais?
4. Quais sistemas concentram privilégios?
5. O que causaria maior impacto se ficasse indisponível?
6. Quais dependências não possuem alternativa?

## Perspectiva arquitetural

O servidor não é necessariamente o ativo mais importante. Ele pode apenas hospedar um processo ou conjunto de dados muito mais valioso para o negócio.
'@

$Ameacas = @'
# 03 — Ameaças

## Definição

Ameaça é qualquer agente, evento ou condição com potencial de causar dano.

## Categorias

### Ameaças externas

- cibercriminosos;
- grupos de ransomware;
- espionagem;
- ataques de negação de serviço;
- comprometimento da cadeia de fornecedores.

### Ameaças internas

- funcionário mal-intencionado;
- abuso de privilégios;
- erro operacional;
- compartilhamento de credenciais;
- negligência.

### Ameaças tecnológicas

- falha de hardware;
- falha de software;
- configuração incorreta;
- indisponibilidade de Cloud;
- perda de conectividade.

### Ameaças físicas e ambientais

- incêndio;
- enchente;
- falha elétrica;
- furto;
- desastre natural.

## Exemplos do cenário

| Ativo | Ameaças relevantes |
|---|---|
| Funcionários | Phishing e engenharia social |
| VPN | Credential stuffing e credenciais roubadas |
| Banco de Dados | Ransomware e insider |
| Folha de Pagamento | Fraude interna e conta comprometida |
| Credenciais | InfoStealer e phishing AiTM |

## Como o atacante pensa

O atacante procura o caminho de menor resistência:

1. obter acesso inicial;
2. capturar identidade ou sessão;
3. elevar privilégios;
4. movimentar-se lateralmente;
5. alcançar ativos críticos;
6. exfiltrar, alterar ou criptografar dados.
'@

$Vulnerabilidades = @'
# 04 — Vulnerabilidades

## Definição

Vulnerabilidade é uma fraqueza técnica, processual ou humana que pode ser explorada por uma ameaça.

## Categorias

### Técnicas

- software desatualizado;
- serviço exposto;
- configuração insegura;
- ausência de criptografia;
- logs insuficientes.

### Identidade e acesso

- senha fraca;
- ausência de MFA resistente a phishing;
- excesso de privilégios;
- contas órfãs;
- contas compartilhadas;
- ausência de segregação de funções.

### Humanas

- baixa conscientização;
- reutilização de senha;
- aprovação indevida;
- engenharia social bem-sucedida.

### Processuais

- desligamento manual;
- revisão de acesso inexistente;
- ausência de gestão de patches;
- resposta a incidentes não testada;
- backup sem teste de restauração.

## Diferença essencial

- **Ameaça:** aquilo que pode causar dano.
- **Vulnerabilidade:** a fraqueza que permite o dano.
- **Risco:** a possibilidade de essa relação gerar impacto.

## Exemplo

```text
Ativo: VPN
Ameaça: atacante com credencial roubada
Vulnerabilidade: ausência de MFA
Risco: acesso remoto não autorizado
```
'@

$Riscos = @'
# 05 — Riscos e Impactos

## Risco

Risco é a possibilidade de uma ameaça explorar uma vulnerabilidade e causar impacto a um ativo ou processo de negócio.

## Estrutura de uma declaração de risco

> Devido à vulnerabilidade X, a ameaça Y pode afetar o ativo Z, causando o impacto W.

## Exemplos

### VPN

Devido à ausência de MFA, um atacante com credenciais roubadas pode acessar a rede interna pela VPN, causando movimento lateral e exposição de dados.

### Banco de Dados

Devido a contas administrativas compartilhadas e patches atrasados, ransomware ou um insider pode alterar, exfiltrar ou criptografar dados, causando paralisação e exposição regulatória.

### Folha de Pagamento

Devido ao excesso de privilégios e à ausência de segregação de funções, uma conta comprometida pode alterar pagamentos, causando prejuízo financeiro e dano reputacional.

## Categorias de impacto

| Categoria | Exemplos |
|---|---|
| Técnico | perda de confidencialidade, integridade ou disponibilidade |
| Operacional | interrupção de processos |
| Financeiro | fraude, perda de receita e custos de recuperação |
| Regulatório | LGPD, auditorias e sanções |
| Reputacional | perda de confiança |
| Estratégico | perda de competitividade |

## Pensamento arquitetural

O arquiteto prioriza riscos conforme criticidade, dependências, impacto para o negócio e capacidade de tratamento.
'@

$Controles = @'
# 06 — Controles de Segurança

## Definição

Controle é uma medida técnica, administrativa, física ou processual destinada a modificar o risco.

## Classificação por função

### Preventivos

Buscam impedir o evento.

- MFA resistente a phishing;
- PAM;
- menor privilégio;
- segmentação;
- hardening;
- criptografia.

### Detectivos

Buscam identificar comportamento indevido.

- SIEM;
- UEBA;
- EDR/XDR;
- auditoria de sessões;
- monitoramento de banco de dados.

### Corretivos

Buscam conter ou corrigir o evento.

- bloqueio de conta;
- revogação de sessão;
- isolamento de endpoint;
- atualização emergencial;
- automação por SOAR.

### Recuperação

Buscam restaurar a operação.

- backups imutáveis;
- testes de restauração;
- recuperação de identidade;
- plano de continuidade.

### Governança

Buscam manter controle contínuo.

- IGA;
- revisão periódica de acessos;
- segregação de funções;
- políticas;
- gestão de riscos.

## Defesa em profundidade

Um controle isolado pode falhar. A arquitetura combina controles preventivos, detectivos, corretivos e de recuperação.

## Exemplo em identidade

```text
FIDO2/WebAuthn
        ↓
Conditional Access
        ↓
Device Trust
        ↓
PAM e menor privilégio
        ↓
SIEM e UEBA
        ↓
SOAR e revogação de sessões
```
'@

$Fluxo = @'
# 07 — Fluxo Arquitetural

## Fluxo principal

```mermaid
flowchart LR
    A[Ativo] --> B[Ameaça]
    B --> C[Vulnerabilidade]
    C --> D[Risco]
    D --> E[Impacto]
    E --> F[Controle preventivo]
    F --> G[Detecção]
    G --> H[Resposta]
    H --> I[Recuperação]
    I --> J[Lições aprendidas]
```

## Aplicação no cenário de credenciais

```mermaid
flowchart LR
    A[Credencial corporativa] --> B[InfoStealer ou phishing]
    B --> C[Senha fraca ou MFA vulnerável]
    C --> D[Sequestro de conta ou sessão]
    D --> E[Acesso a M365, ERP ou VPN]
    E --> F[FIDO2 e Conditional Access]
    F --> G[SIEM e UEBA]
    G --> H[SOAR revoga sessão]
    H --> I[EDR isola endpoint]
```

## Leitura do fluxo

1. Identifique o ativo.
2. Determine as ameaças relevantes.
3. Localize as vulnerabilidades.
4. Declare o risco de forma objetiva.
5. Traduza o impacto técnico para o negócio.
6. Selecione controles complementares.
7. Defina monitoramento, resposta e recuperação.
8. Registre riscos residuais e trade-offs.
'@

$Arquiteto = @'
# 08 — Como um Arquiteto Pensa

## Diferenças de perspectiva

### Administrador

> Como configuro a solução?

### Analista SOC

> O que aconteceu e como investigar?

### Engenheiro

> Como implementar e integrar?

### Consultor

> Como entregar a solução ao cliente?

### Arquiteto

> Qual risco deve ser reduzido, quais controles são necessários, como eles se integram e quais trade-offs serão aceitos?

### CISO

> Qual impacto para o negócio, qual prioridade e qual investimento é justificável?

## Exemplo: credencial comprometida

O administrador troca a senha.

O analista investiga os logs.

O engenheiro habilita MFA.

O arquiteto projeta uma arquitetura em que:

- MFA seja resistente a phishing;
- dispositivo e contexto sejam avaliados;
- privilégios sejam temporários;
- sessões sejam monitoradas;
- eventos sejam correlacionados;
- respostas sejam automatizadas;
- o impacto seja limitado por segmentação e menor privilégio.

## Perguntas do arquiteto

1. Qual problema de negócio estamos resolvendo?
2. Quais ativos são afetados?
3. Como o ataque acontece?
4. Quais controles quebram a cadeia?
5. Quais integrações são necessárias?
6. Quais dependências serão criadas?
7. Quais riscos permanecem?
8. Como medir o resultado?
9. Como explicar a decisão a um CISO?
'@

$Exercicio = @'
# 09 — Exercício Prático Resolvido

## Cenário

Empresa com:

- 2.000 funcionários;
- Microsoft 365;
- Active Directory;
- AWS;
- ERP;
- VPN;
- desenvolvedores;
- equipe financeira.

## Ativos identificados

### Pessoas

- funcionários;
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

### Sistemas e serviços

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
- produção;
- desenvolvimento de software;
- atendimento ao cliente.

## Matriz de correlação arquitetural

### 1. Funcionários

| Campo | Análise |
|---|---|
| Ameaças | Phishing e engenharia social |
| Vulnerabilidades | Baixa conscientização e reutilização de senhas |
| Risco | Comprometimento da identidade do usuário |
| Impactos | Fraude, vazamento de dados e perda de produtividade |
| Controles | Treinamento contínuo, MFA resistente a phishing, Conditional Access e EDR |

### 2. VPN

| Campo | Análise |
|---|---|
| Ameaças | Credential stuffing e uso de credenciais roubadas |
| Vulnerabilidades | Ausência de MFA e software desatualizado |
| Risco | Acesso remoto não autorizado |
| Impactos | Movimento lateral, indisponibilidade e exposição de dados |
| Controles | MFA, Device Trust, ZTNA, segmentação, atualização e SIEM |

### 3. Banco de Dados

| Campo | Análise |
|---|---|
| Ameaças | Ransomware e insider mal-intencionado |
| Vulnerabilidades | Contas administrativas compartilhadas e patches atrasados |
| Risco | Exfiltração, alteração ou criptografia de dados |
| Impactos | Paralisação operacional, LGPD e prejuízo financeiro |
| Controles | PAM, criptografia, segregação, auditoria, backup imutável e segmentação |

### 4. Folha de Pagamento

| Campo | Análise |
|---|---|
| Ameaças | Fraude interna e comprometimento de conta |
| Vulnerabilidades | Excesso de privilégios e ausência de segregação de funções |
| Risco | Alteração indevida de pagamentos ou dados bancários |
| Impactos | Perda financeira, impacto trabalhista e dano reputacional |
| Controles | IGA, SoD, múltipla aprovação, MFA, auditoria e revisão de acessos |

### 5. Credenciais

| Campo | Análise |
|---|---|
| Ameaças | InfoStealer e phishing AiTM |
| Vulnerabilidades | Senhas fracas e MFA não resistente a phishing |
| Risco | Sequestro de conta ou sessão |
| Impactos | Acesso indevido a Microsoft 365, ERP, VPN e dados sensíveis |
| Controles | FIDO2/WebAuthn, Conditional Access, revogação de sessões, SIEM/UEBA, EDR e SOAR |

## Estratégia arquitetural

### Identidade

- MFA resistente a phishing;
- Conditional Access;
- menor privilégio;
- revisão periódica de acessos;
- desativação automática no desligamento.

### Privilégios

- PAM;
- credenciais em cofre;
- sessões auditadas;
- elevação Just-in-Time;
- eliminação de contas compartilhadas.

### Endpoint

- EDR/XDR;
- hardening;
- atualização contínua;
- controle de aplicações.

### Rede

- ZTNA;
- Device Trust;
- segmentação;
- restrição de acessos administrativos.

### Detecção e resposta

- SIEM;
- UEBA;
- SOAR;
- revogação de tokens;
- bloqueio de conta;
- isolamento de endpoint.

### Recuperação

- backups imutáveis;
- testes de restauração;
- continuidade de negócio;
- recuperação de identidade.

## Trade-offs

| Decisão | Benefício | Trade-off |
|---|---|---|
| MFA resistente a phishing | Reduz ataques de credenciais | Custo e mudança de experiência |
| PAM | Controla privilégios | Complexidade e custo |
| SIEM | Centraliza visibilidade | Exige logs de qualidade e operação especializada |
| SOAR | Acelera resposta | Automação exige governança |
| ZTNA | Reduz confiança implícita | Exige integração com identidade e dispositivo |
| Revisões periódicas | Reduz acessos acumulados | Demanda participação dos gestores |
'@

$Resumo = @'
# 10 — Resumo Executivo

## Modelo mental

```text
Ativo → Ameaça → Vulnerabilidade → Risco → Impacto → Controle
```

## Princípios

- O negócio vem antes da tecnologia.
- Ativos não são apenas servidores.
- Ameaça e vulnerabilidade são conceitos diferentes.
- O risco deve ser declarado com causa e efeito.
- Impactos técnicos devem ser traduzidos para o negócio.
- Controles devem trabalhar em camadas.
- A arquitetura deve incluir prevenção, detecção, resposta e recuperação.
- Toda decisão possui trade-offs e riscos residuais.

## Checklist do arquiteto

- [ ] Identifiquei os ativos críticos?
- [ ] Relacionei ameaças específicas aos ativos?
- [ ] Identifiquei vulnerabilidades reais?
- [ ] Declarei o risco de forma clara?
- [ ] Traduzi o impacto para o negócio?
- [ ] Selecionei controles complementares?
- [ ] Considerei IAM, SIEM, SOAR, EDR, Cloud e rede?
- [ ] Registrei dependências e trade-offs?
- [ ] Defini métricas de sucesso?
- [ ] Consigo explicar a decisão para um CISO?

## Frase-chave

> Um arquiteto não começa perguntando qual produto comprar. Ele começa perguntando qual risco precisa ser reduzido.
'@

$Canvas = @'
# Architecture Canvas — Modelo Mental do Arquiteto

| Campo | Conteúdo |
|---|---|
| Problema de negócio | Comprometimento de identidades com impacto em sistemas críticos |
| Ativos afetados | Funcionários, VPN, Banco de Dados, Folha de Pagamento e Credenciais |
| Ameaças | Phishing, InfoStealer, ransomware, insider e credential stuffing |
| Vulnerabilidades | Senhas fracas, ausência de MFA resistente a phishing, software desatualizado, excesso de privilégios e contas compartilhadas |
| Riscos | Acesso não autorizado, fraude, exfiltração e interrupção operacional |
| Impactos | Vazamento de dados, perda financeira, indisponibilidade, LGPD e reputação |
| Controles preventivos | FIDO2/WebAuthn, PAM, IGA, SoD, EDR, ZTNA e segmentação |
| Controles detectivos | SIEM, UEBA e auditoria |
| Controles corretivos | SOAR, revogação de tokens, bloqueio de contas e isolamento de endpoint |
| Recuperação | Backups imutáveis, restauração testada e continuidade de negócio |
| Integrações | IAM, PAM, EDR/XDR, SIEM, SOAR, AD/Entra ID, VPN/ZTNA e AWS |
| Trade-offs | Segurança versus usabilidade, custo, complexidade e maturidade operacional |
| Decisão arquitetural | Adotar proteção de identidade em camadas |
| Benefícios esperados | Menor superfície de ataque, contenção rápida e rastreabilidade |
| Métricas de sucesso | Cobertura de MFA, contas no PAM, tempo de revogação, contas órfãs, MTTD e MTTR |
'@

$Adr = @'
# ADR-0001 — Proteção de Identidades em Camadas

- **Status:** Aceito
- **Data:** 2026-08-05

## Contexto

A empresa depende de Microsoft 365, Active Directory, AWS, ERP, VPN e processos financeiros. Uma identidade comprometida pode permitir acesso a vários ativos críticos.

## Problema

Senha e MFA convencional podem não impedir InfoStealer, phishing AiTM, roubo de token ou abuso de privilégios.

## Opções consideradas

### Opção 1 — Apenas MFA convencional

Baixo esforço, mas proteção limitada contra ataques modernos.

### Opção 2 — MFA e SIEM

Melhora prevenção e visibilidade, mas não controla adequadamente privilégios e resposta.

### Opção 3 — Proteção de identidade em camadas

Combina MFA resistente a phishing, Conditional Access, PAM, IGA, EDR, SIEM, SOAR, Device Trust e segmentação.

## Decisão

Adotar a opção 3.

## Justificativa

A estratégia reduz a probabilidade de comprometimento, limita privilégios e movimento lateral, aumenta detecção e acelera resposta.

## Consequências positivas

- menor risco de sequestro de conta;
- melhor governança;
- maior rastreabilidade;
- contenção automatizada;
- alinhamento com Zero Trust.

## Consequências negativas

- maior custo;
- integração mais complexa;
- necessidade de maturidade operacional;
- possível atrito inicial para usuários.

## Riscos residuais

- roubo de sessão;
- falhas de integração;
- automações mal configuradas;
- exceções permanentes.

## Métricas

- usuários protegidos por MFA resistente a phishing;
- contas privilegiadas no PAM;
- tempo de revogação de sessão;
- contas órfãs;
- MTTD e MTTR.
'@

$Diagram = @'
# Diagrama — Fluxo do Modelo Mental

```mermaid
flowchart LR
    A[Ativo] --> B[Ameaça]
    B --> C[Vulnerabilidade]
    C --> D[Risco]
    D --> E[Impacto]
    E --> F[Controle preventivo]
    F --> G[Detecção]
    G --> H[Resposta]
    H --> I[Recuperação]
```
'@

$Flashcards = @'
Frente;Verso
O que é um ativo?;Qualquer elemento que possua valor para a organização.
O que é uma ameaça?;Evento, agente ou condição com potencial de causar dano a um ativo.
O que é uma vulnerabilidade?;Fraqueza que pode ser explorada por uma ameaça.
O que é risco?;Possibilidade de uma ameaça explorar uma vulnerabilidade e causar impacto.
Qual é a sequência do modelo mental do arquiteto?;Ativo, ameaça, vulnerabilidade, risco, impacto e controle.
Por que correlacionar os elementos?;Para demonstrar causa, efeito, prioridade e justificativa arquitetural.
Qual é o objetivo de Defense in Depth?;Combinar múltiplas camadas para evitar falha total de proteção.
Qual pergunta inicia uma análise arquitetural?;Qual problema de negócio e qual risco estamos tentando reduzir?
'@

Write-Utf8File -Path (Join-Path $ModulePath "README.md") -Content $Readme
Write-Utf8File -Path (Join-Path $ModulePath "01-Conceitos.md") -Content $Conceitos
Write-Utf8File -Path (Join-Path $ModulePath "02-Ativos.md") -Content $Ativos
Write-Utf8File -Path (Join-Path $ModulePath "03-Ameacas.md") -Content $Ameacas
Write-Utf8File -Path (Join-Path $ModulePath "04-Vulnerabilidades.md") -Content $Vulnerabilidades
Write-Utf8File -Path (Join-Path $ModulePath "05-Riscos-e-Impactos.md") -Content $Riscos
Write-Utf8File -Path (Join-Path $ModulePath "06-Controles.md") -Content $Controles
Write-Utf8File -Path (Join-Path $ModulePath "07-Fluxo-Arquitetural.md") -Content $Fluxo
Write-Utf8File -Path (Join-Path $ModulePath "08-Como-um-Arquiteto-Pensa.md") -Content $Arquiteto
Write-Utf8File -Path (Join-Path $ModulePath "09-Exercicio-Pratico.md") -Content $Exercicio
Write-Utf8File -Path (Join-Path $ModulePath "10-Resumo-Executivo.md") -Content $Resumo
Write-Utf8File -Path (Join-Path $ModulePath "architecture-canvas.md") -Content $Canvas

$AdrFolder = Join-Path $ModulePath "adr"
$DiagramFolder = Join-Path $ModulePath "diagramas"
$FlashcardFolder = Join-Path $ModulePath "flashcards"

foreach ($Folder in @($AdrFolder, $DiagramFolder, $FlashcardFolder)) {
    if (-not (Test-Path -LiteralPath $Folder)) {
        New-Item -ItemType Directory -Path $Folder | Out-Null
    }
}

Write-Utf8File `
    -Path (Join-Path $AdrFolder "ADR-0001-Protecao-de-Identidades-em-Camadas.md") `
    -Content $Adr

Write-Utf8File `
    -Path (Join-Path $DiagramFolder "01-Fluxo-Modelo-Mental.md") `
    -Content $Diagram

Write-Utf8File `
    -Path (Join-Path $FlashcardFolder "anki.csv") `
    -Content $Flashcards

Write-Host ""
Write-Host "Módulo 01.2 organizado com sucesso." -ForegroundColor Cyan
Write-Host "Backup do README anterior: README-backup-v2.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "Próximos comandos Git:" -ForegroundColor Yellow
Write-Host "git add -A"
Write-Host 'git commit -m "docs: organiza modulo 01.2 em paginas de estudo"'
Write-Host "git push origin main"
