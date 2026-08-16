[← Voltar ao README Principal](../README.md)

# ⚔️ Lição 2: Zumbis Atacam Suas Vítimas

---

## 📌 Tópicos & Capítulos

### 🔹 Capítulo 1: Arquitetura Multiplayer & Propriedade de Ativos
* **Conceito:** Visão geral sobre gerenciamento de estado distribuído para suporte a múltiplos usuários concorrentes.
* **Objetivo:** Estruturar a lógica do jogo para atribuir a posse individual de cada ativo (zumbi) à carteira do seu criador.

---

### 🔹 Capítulo 2: Mapeamentos (`mapping`) e Endereços (`address`)
* **Conceito:** Associação de posse de ativos através de endereços da Ethereum (160 bits) e busca performática via chave-valor.
* **Objetivo:** Mapear qual carteira é dona de qual zumbi (`zombieToOwner`) e quantos zumbis um endereço possui (`ownerZombieCount`).

---

### 🔹 Capítulo 3: Remetente da Mensagem (`msg.sender`) & Registro de Propriedade
* **Conceito:** Identificação criptográfica do remetente da transação através da variável global `msg.sender`.
* **Objetivo:** Vincular a propriedade do zumbi recém-criado à carteira do chamador (`zombieToOwner[id] = msg.sender`) e incrementar seu saldo (`ownerZombieCount[msg.sender]++`).

---

### 🔹 Capítulo 4: Validações de Estado & Trava de Execução (`require`)
* **Conceito:** Interrupção de fluxo de execução e reversão de transação (*revert*) para validação de regras de negócio.
* **Objetivo:** Garantir que cada jogador só possa criar 1 zumbi inicial limitando a execução da função `createRandomZombie` via `require(ownerZombieCount[msg.sender] == 0)`.

---

### 🔹 Capítulo 5: Herança de Contratos (`is`)
* **Conceito:** Modularização do código através da relação de herança entre contratos inteligentes.
* **Objetivo:** Criar o contrato `ZombieFeeding` herdando todas as estruturas, variáveis e funções de `ZombieFactory` utilizando a palavra-chave `is`.

---

### 🔹 Capítulo 6: Importação de Arquivos (`import`)
* **Conceito:** Modularização do projeto através da separação de contratos em múltiplos arquivos `.sol`.
* **Objetivo:** Criar o arquivo `zombiefeeding.sol`, importar a base do `zombiefactory.sol` via `import "./zombiefactory.sol";` e definir a herança `ZombieFeeding is ZombieFactory`.

---

### 🔹 Capítulo 7: Storage vs Memory e Controle de Acesso
* **Conceito:** Compreensão da diferença entre alocação de memória permanente (`storage`) e temporária (`memory`), além da implementação de travas de propriedade via `require`.
* **Objetivo:** Criar a estrutura da função `feedAndMultiply`, garantindo que apenas o proprietário legítimo de um zumbi possa executá-la e instanciar um ponteiro `storage` para o zumbi selecionado.

---

### 🔹 Capítulo 8: DNA Zumbi e fusão de atributos
* **Conceito:** Aplicação de operações aritméticas e do operador de módulo (`%`) para truncamento de limites numéricos, além do cálculo de média ponderada de atributos e reaproveitamento de métodos herdados.
* **Objetivo:** Truncar o `_targetDna` com `dnaModulus`, calcular a média entre `myZombie.dna` e `_targetDna` para gerar o `newDna`, e invocar a função `_createZombie("NoName", newDna)`.

---

### 🔹 Capítulo 9: Mais sobre visibilidade de funções (`internal` & `external`)
* **Conceito:** Compreensão dos modificadores de acesso na EVM; liberação de herança com `internal` e restrição de chamadas fora do contrato via `external`.
* **Objetivo:** Alterar a visibilidade de `_createZombie` de `private` para `internal` em `ZombieFactory`, permitindo que o contrato filho (`ZombieFeeding`) acesse a função.

---

### 🔹 Capítulo 10: Comunicação Inter-Contratos & Interfaces (`KittyInterface`)
* **Conceito:** Abstração de contratos terceiros via Interfaces; assinatura de funções externas sem corpo de execução e suporte a múltiplos retornos em Solidity.
* **Objetivo:** Declarar a interface `KittyInterface` com a assinatura da função `getKitty` para permitir a leitura do genoma dos CryptoKitties na blockchain sem alterar o contrato de origem.

---

### 🔹 Capítulo 11: Instanciação de Interfaces (`KittyInterface(ckAddress)`)
* **Conceito:** Associação do contrato-interface ao endereço físico (`address`) de um smart contract na rede Ethereum.
* **Objetivo:** Instanciar o objeto `kittyContract` passando a variável `ckAddress`, estabelecendo o ponteiro necessário para chamar métodos dos CryptoKitties.

---

### 🔹 Capítulo 12: Lidando com Múltiplos Valores de Retorno
* **Conceito:** Manipulação e desestruturação de múltiplos valores retornados por uma função externa (tuplas), utilizando a sintaxe de vírgulas `(,,,,,,,,,val)`.
* **Objetivo:** Criar a função `feedOnKitty` para consultar os genes do CryptoKitty via `kittyContract.getKitty()` e repassar o resultado para `feedAndMultiply`.

---

### 🔹 Capítulo 13: Bônus: Genes de Gatinho (Estruturas Condicionais & String Hashing)
* **Conceito:** Controle de fluxo com `if`, comparação de strings via hash Keccak-256 (`keccak256(abi.encodePacked(...))`) e manipulação aritmética de DNA com módulo (`%`).
* **Objetivo:** Atualizar a função `feedAndMultiply` para aceitar a string `_species`, verificar se a vítima é da espécie `"kitty"` e alterar os últimos 2 dígitos do DNA para `99`.