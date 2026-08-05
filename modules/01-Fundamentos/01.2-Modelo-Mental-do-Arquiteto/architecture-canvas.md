# Architecture Canvas â€” Modelo Mental do Arquiteto

| Campo | ConteÃºdo |
|---|---|
| Problema de negÃ³cio | Comprometimento de identidades com impacto em sistemas crÃ­ticos |
| Ativos afetados | FuncionÃ¡rios, VPN, Banco de Dados, Folha de Pagamento e Credenciais |
| AmeaÃ§as | Phishing, InfoStealer, ransomware, insider e credential stuffing |
| Vulnerabilidades | Senhas fracas, ausÃªncia de MFA resistente a phishing, software desatualizado, excesso de privilÃ©gios e contas compartilhadas |
| Riscos | Acesso nÃ£o autorizado, fraude, exfiltraÃ§Ã£o e interrupÃ§Ã£o operacional |
| Impactos | Vazamento de dados, perda financeira, indisponibilidade, LGPD e reputaÃ§Ã£o |
| Controles preventivos | FIDO2/WebAuthn, PAM, IGA, SoD, EDR, ZTNA e segmentaÃ§Ã£o |
| Controles detectivos | SIEM, UEBA e auditoria |
| Controles corretivos | SOAR, revogaÃ§Ã£o de tokens, bloqueio de contas e isolamento de endpoint |
| RecuperaÃ§Ã£o | Backups imutÃ¡veis, restauraÃ§Ã£o testada e continuidade de negÃ³cio |
| IntegraÃ§Ãµes | IAM, PAM, EDR/XDR, SIEM, SOAR, AD/Entra ID, VPN/ZTNA e AWS |
| Trade-offs | SeguranÃ§a versus usabilidade, custo, complexidade e maturidade operacional |
| DecisÃ£o arquitetural | Adotar proteÃ§Ã£o de identidade em camadas |
| BenefÃ­cios esperados | Menor superfÃ­cie de ataque, contenÃ§Ã£o rÃ¡pida e rastreabilidade |
| MÃ©tricas de sucesso | Cobertura de MFA, contas no PAM, tempo de revogaÃ§Ã£o, contas Ã³rfÃ£s, MTTD e MTTR |
