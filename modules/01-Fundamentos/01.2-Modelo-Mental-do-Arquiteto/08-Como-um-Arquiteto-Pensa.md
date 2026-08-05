# 08 â€” Como um Arquiteto Pensa

## DiferenÃ§as de perspectiva

### Administrador

> Como configuro a soluÃ§Ã£o?

### Analista SOC

> O que aconteceu e como investigar?

### Engenheiro

> Como implementar e integrar?

### Consultor

> Como entregar a soluÃ§Ã£o ao cliente?

### Arquiteto

> Qual risco deve ser reduzido, quais controles sÃ£o necessÃ¡rios, como eles se integram e quais trade-offs serÃ£o aceitos?

### CISO

> Qual impacto para o negÃ³cio, qual prioridade e qual investimento Ã© justificÃ¡vel?

## Exemplo: credencial comprometida

O administrador troca a senha.

O analista investiga os logs.

O engenheiro habilita MFA.

O arquiteto projeta uma arquitetura em que:

- MFA seja resistente a phishing;
- dispositivo e contexto sejam avaliados;
- privilÃ©gios sejam temporÃ¡rios;
- sessÃµes sejam monitoradas;
- eventos sejam correlacionados;
- respostas sejam automatizadas;
- o impacto seja limitado por segmentaÃ§Ã£o e menor privilÃ©gio.

## Perguntas do arquiteto

1. Qual problema de negÃ³cio estamos resolvendo?
2. Quais ativos sÃ£o afetados?
3. Como o ataque acontece?
4. Quais controles quebram a cadeia?
5. Quais integraÃ§Ãµes sÃ£o necessÃ¡rias?
6. Quais dependÃªncias serÃ£o criadas?
7. Quais riscos permanecem?
8. Como medir o resultado?
9. Como explicar a decisÃ£o a um CISO?
