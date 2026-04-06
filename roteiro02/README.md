# Roteiro 01 - Navegacao Flutter

## Perguntas e Respostas

### Exercicio 2

Pergunta: Por que usamos construtor?
Resposta: Porque e a forma mais direta e segura de passar dados para outra tela no momento da criacao do widget, sem depender de variavel global.

Pergunta: Por que Tela2 pode ser Stateless?
Resposta: Porque o valor recebido (nome) ja chega pronto pelo construtor e nao precisa mudar durante a vida da tela.

Pergunta: O dado pode mudar depois que a tela e criada?
Resposta: Nao por conta propria. O valor passado no construtor nao muda dentro da mesma instancia da tela. Para mudar, seria necessario reconstruir a tela com novo valor ou usar gerenciamento de estado.

### Exercicio 3

Pergunta: O que acontece se remover o await?
Resposta: A navegacao ainda acontece, mas Tela1 nao espera o retorno. O valor nao chega no momento certo e a atualizacao pode ficar errada ou nem ocorrer como esperado.

Pergunta: O que acontece se remover async?
Resposta: Nao da para usar await no metodo. O codigo nao compila se await continuar ali.

Pergunta: O que e Future?
Resposta: Future representa um resultado que sera entregue no futuro (assincrono), como o valor retornado quando uma tela fecha.

Pergunta: Quando o valor realmente e recebido?
Resposta: Quando Tela2 executa Navigator.pop(context, valor). Nesse momento o Future do Navigator.push em Tela1 e concluido.
