# 06 â€” Controles de SeguranÃ§a

## DefiniÃ§Ã£o

Controle Ã© uma medida tÃ©cnica, administrativa, fÃ­sica ou processual destinada a modificar o risco.

## ClassificaÃ§Ã£o por funÃ§Ã£o

### Preventivos

Buscam impedir o evento.

- MFA resistente a phishing;
- PAM;
- menor privilÃ©gio;
- segmentaÃ§Ã£o;
- hardening;
- criptografia.

### Detectivos

Buscam identificar comportamento indevido.

- SIEM;
- UEBA;
- EDR/XDR;
- auditoria de sessÃµes;
- monitoramento de banco de dados.

### Corretivos

Buscam conter ou corrigir o evento.

- bloqueio de conta;
- revogaÃ§Ã£o de sessÃ£o;
- isolamento de endpoint;
- atualizaÃ§Ã£o emergencial;
- automaÃ§Ã£o por SOAR.

### RecuperaÃ§Ã£o

Buscam restaurar a operaÃ§Ã£o.

- backups imutÃ¡veis;
- testes de restauraÃ§Ã£o;
- recuperaÃ§Ã£o de identidade;
- plano de continuidade.

### GovernanÃ§a

Buscam manter controle contÃ­nuo.

- IGA;
- revisÃ£o periÃ³dica de acessos;
- segregaÃ§Ã£o de funÃ§Ãµes;
- polÃ­ticas;
- gestÃ£o de riscos.

## Defesa em profundidade

Um controle isolado pode falhar. A arquitetura combina controles preventivos, detectivos, corretivos e de recuperaÃ§Ã£o.

## Exemplo em identidade

```text
FIDO2/WebAuthn
        â†“
Conditional Access
        â†“
Device Trust
        â†“
PAM e menor privilÃ©gio
        â†“
SIEM e UEBA
        â†“
SOAR e revogaÃ§Ã£o de sessÃµes
```
