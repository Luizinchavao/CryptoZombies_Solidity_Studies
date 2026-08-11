# 🧟‍♂️ CryptoZombies - Estudos de Solidity & Web3

Repositório dedicado aos meus estudos práticos da linguagem **Solidity** e desenvolvimento de **DApps (Decentralized Applications)** na blockchain Ethereum.

Acompanhando o curso interativo **CryptoZombies** juntamente com as aulas e lives do canal **queroser.ninja** (Fernando Daciuk).

---

## 📌 Status do Projeto

- **Fase Atual:** Lição 2 - Capítulo 10 concluído 🏁
- **Status:** 🟡 Em andamento / Transição para o Capítulo 11
- **Foco Atual:** Comunicação inter-contratos, criação de interfaces (`interface` / `contract`), assinaturas de funções externas e retorno de múltiplos valores.

---

## 📸 Registro de Progresso

### 🧟 Lição 1: Criando a Fábrica de Zumbis
- **Tópicos:** 
  - **Capítulo 1:** Visão Geral & Introdução
    - **Conceito:** Arquitetura básica de contratos inteligentes executados na Ethereum Virtual Machine (EVM).
    - **Objetivo:** Compreender o funcionamento do jogo interativo e a estrutura fundamental dos contratos em Solidity.
  - **Capítulo 2:** `pragma solidity` & Declaração de Contrato
    - **Conceito:** Versionamento de compilador e encapsulamento de código via `contract`.
    - **Objetivo:** Definir a versão do compilador Solidity (`pragma`) e declarar a estrutura base do contrato `ZombieFactory`.
  - **Capítulo 3:** Variáveis de Estado & Inteiros (`uint`)
    - **Conceito:** Armazenamento persistente de dados na blockchain (*Storage*) e tipos numéricos não assinados.
    - **Objetivo:** Definir a variável de estado `dnaDigits` para estabelecer a precisão numérica de 16 dígitos do DNA dos zumbis.
  - **Capítulo 4:** Operações Matemáticas
    - **Conceito:** Aritmética de precisão em Solidity (`+`, `-`, `*`, `/`, `%`) e exponenciação (`**`).
    - **Objetivo:** Calcular o `dnaModulus` ($10^{16}$) para limitar e manipular matematicamente os valores do DNA.
  - **Capítulo 5:** Estruturas de Dados (`struct`)
    - **Conceito:** Criação de tipos de dados personalizados complexos.
    - **Objetivo:** Modelar a estrutura `Zombie` composta por atributos de nome (`string`) e DNA (`uint`).
  - **Capítulo 6:** Arrays Dynamicos e Públicos (`arrays`)
    - **Conceito:** Coleções de dados dinâmicas e geração automática de funções getter de leitura com o modificador `public`.
    - **Objetivo:** Criar o array dinâmico e público `zombies` para armazenar a lista global de zumbis do jogo.
  - **Capítulo 7:** Declarações de Funções & Escopo de Memória
    - **Conceito:** Assinatura de funções, passagem de parâmetros e especificação de localização de dados (`memory`).
    - **Objetivo:** Declarar a função `createZombie` com parâmetros de entrada para nome e DNA.
  - **Capítulo 8:** Manipulação de Arrays Dinâmicos (`push`)
    - **Conceito:** Inserção de novos elementos em arrays e gerenciamento de estado em structs.
    - **Objetivo:** Instanciar novos objetos `Zombie` e adicioná-los ao array `zombies` via `.push()`.
  - **Capítulo 9:** Visibilidade de Funções (`private`) & Convenções de Código
    - **Conceito:** Restrição do controle de acesso interno e padronização de nomenclatura com o prefixo underline (`_`).
    - **Objetivo:** Converter `createZombie` para a função privada `_createZombie`, impedindo chamadas externas não autorizadas.
  - **Capítulo 10:** Retorno de Valores & Modificadores de Leitura (`view` / `pure`)
    - **Conceito:** Declarações de retorno (`returns`) e otimização de execução sem alteração de estado na rede via `view`.
    - **Objetivo:** Entender a diferença entre funções que alteram o estado da blockchain e funções de simples consulta sem custo de gás.
  - **Capítulo 11:** Hashes & Conversão de Tipos (`keccak256` & Typecasting)
    - **Conceito:** Geração de identificadores pseudo-aleatórios via Keccak256 e casting de tipos primitivos.
    - **Objetivo:** Criar a função `_generateRandomDna` para transformar dados de entrada em números de 16 dígitos usando `keccak256` e o operador `%`.
  - **Capítulo 12:** Abstração de Interfaces Públicas & Composição
    - **Conceito:** Padrão de Fachada (*Facade Pattern*) e isolamento de fluxos de execução internos.
    - **Objetivo:** Criar a interface pública `createRandomZombie` para unificar a geração de DNA e a criação do zumbi em uma única chamada.
  - **Capítulo 13:** Eventos (`events`) & Logs da EVM
    - **Conceito:** Comunicação assíncrona off-chain sem necessidade de polling constante via `emit`.
    - **Objetivo:** Declarar e emitir o evento `NewZombie` para notificar aplicações externas quando um novo zumbi for criado.
  - **Capítulo 14:** Integração Web3.js & Frontend
    - **Conceito:** Conexão entre o Smart Contract e a camada de interface do usuário via JavaScript.
    - **Objetivo:** Escutar eventos disparados pela blockchain para capturar dados em tempo real e renderizar o zumbi dinamicamente na tela.

- **Status:** Lição 1 Concluída! 🎉

---

#### Capítulo 2
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 2 Código](./assets/Chapter_2.png) | ![Capítulo 2 Concluído](./assets/Chapter_2_Contracts_Ok.png) |

#### Capítulo 3
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 3 Código](./assets/Chapter_3.png) | ![Capítulo 3 Concluído](./assets/Chapter_3_State_Variables_&_Integers_Ok.png) |

#### Capítulo 4
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 4 Código](./assets/Chapter_4.png) | ![Capítulo 4 Concluído](./assets/Chapter_4_Math_Operations_Ok.png) |

#### Capítulo 5
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 5 Código](./assets/Chapter_5.png) | ![Capítulo 5 Concluído](./assets/Chapter_5_Structs_Ok.png) |

#### Capítulo 6
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 6 Código](./assets/Chapter_6.png) | ![Capítulo 6 Concluído](./assets/Chapter_6_Arrays_Ok.png) |

#### Capítulo 7
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 7 Código](./assets/Chapter_7.png) | ![Capítulo 7 Concluído](./assets/Chapter_7_Function_Declarations_Ok.png) |

#### Capítulo 8
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 8 Código](./assets/Chapter_8.png) | ![Capítulo 8 Concluído](./assets/Chapter_8_Working_With_Structs_And_Arrays_Ok.png) |

#### Capítulo 9
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 9 Código](./assets/Chapter_9.png) | ![Capítulo 9 Concluído](./assets/Chapter_9_Privete_Public_Funtions_Ok.png) |

#### Capítulo 10
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 10 Código](./assets/Chapter_10.png) | ![Capítulo 10 Concluído](./assets/Chapter_10_More_On_Functions_Ok.png) |

#### Capítulo 11
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 11 Código](./assets/Chapter_11.png) | ![Capítulo 11 Concluído](./assets/Chapter_11_Keccak256_And_Typecasting_Ok.png) |

#### Capítulo 12
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 12 Código](./assets/Chapter_12.png) | ![Capítulo 12 Concluído](./assets/Chapter_12_Putting_It_Together_Ok.png) |

#### Capítulo 13
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 13 Código](./assets/Chapter_13.png) | ![Capítulo 13 Concluído](./assets/Chapter_13_Events_Ok.png) |

#### Capítulo 14
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 14 Código](./assets/Chapter_14.png) | ![Capítulo 14 Concluído](./assets/Chapter_14_Web3_Js_Ok.png) |

---

### ⚔️ Lição 2: Zumbis Atacam Suas Vítimas
- **Tópicos:**
  - **Capítulo 1:** Arquitetura Multiplayer & Propriedade de Ativos
    - **Conceito:** Visão geral sobre gerenciamento de estado distribuído para suporte a múltiplos usuários concorrentes.
    - **Objetivo:** Estruturar a lógica do jogo para atribuir a posse individual de cada ativo (zumbi) à carteira do seu criador.
  - **Capítulo 2:** Mapeamentos (`mapping`) e Endereços (`address`)
    - **Conceito:** Associação de posse de ativos através de endereços da Ethereum (160 bits) e busca performática via chave-valor.
    - **Objetivo:** Mapear qual carteira é dona de qual zumbi (`zombieToOwner`) e quantos zumbis um endereço possui (`ownerZombieCount`).
  - **Capítulo 3:** Remetente da Mensagem (`msg.sender`) & Registro de Propriedade
    - **Conceito:** Identificação criptográfica do remetente da transação através da variável global `msg.sender`.
    - **Objetivo:** Vincular a propriedade do zumbi recém-criado à carteira do chamador (`zombieToOwner[id] = msg.sender`) e incrementar seu saldo (`ownerZombieCount[msg.sender]++`).
  - **Capítulo 4:** Validações de Estado & Trava de Execução (`require`)
    - **Conceito:** Interrupção de fluxo de execução e reversão de transação (*revert*) para validação de regras de negócio.
    - **Objetivo:** Garantir que cada jogador só possa criar 1 zumbi inicial limitando a execução da função `createRandomZombie` via `require(ownerZombieCount[msg.sender] == 0)`.
  - **Capítulo 5:** Herança de Contratos (`is`)
    - **Conceito:** Modularização do código através da relação de herança entre contratos inteligentes.
    - **Objetivo:** Criar o contrato `ZombieFeeding` herdando todas as estruturas, variáveis e funções de `ZombieFactory` utilizando a palavra-chave `is`. 
  - **Capítulo 6:** Importação de Arquivos (`import`)
    - **Conceito:** Modularização do projeto através da separação de contratos em múltiplos arquivos `.sol`.
    - **Objetivo:** Criar o arquivo `zombiefeeding.sol`, importar a base do `zombiefactory.sol` via `import "./zombiefactory.sol";` e definir a herança `ZombieFeeding is ZombieFactory`.
  - **Capítulo 7:** Storage vs Memory e Controle de Acesso
    - **Conceito:** Compreensão da diferença entre alocação de memória permanente (`storage` - ponteiro    direto para o estado global da blockchain) e temporária (`memory` - memória descartável durante a execução da transação), além da implementação de travas de propriedade via `require`.
    -  **Objetivo:** Criar a estrutura da função `feedAndMultiply`, garantindo que apenas o proprietário legítimo de um zumbi possa executá-la (`require(msg.sender == zombieToOwner[_zombieId])`) e instanciar um ponteiro `storage` para o zumbi selecionado.
  - **Capítulo 8:** DNA Zumbi e fusão de atributos
    - **Conceito:** Aplicação de operações aritméticas e do operador de módulo (`%`) para truncamento de limites numéricos (garantindo 16 dígitos), além do cálculo de média ponderada de atributos e reaproveitamento de métodos herdados.
    - **Objetivo:** Truncar o `_targetDna` com `dnaModulus`, calcular a média entre `myZombie.dna` e `_targetDna` para gerar o `newDna`, e invocar a função `_createZombie("NoName", newDna)` para gerar o novo zumbi.
  - **Capítulo 9:** Mais sobre visibilidade de funções (`internal` & `external`)  
    - **Conceito:** Compreensão dos modificadores de acesso na EVM; liberação de herança com `internal` e restrição de chamadas fora do contrato via `external`.
    - **Objetivo:** Alterar a visibilidade de `_creatZombie` de `private` para `internal` em `ZombieFactory`, permitindo que o contrato filho (`ZombieFeeding`) acesse a função para criar novos zumbis após a fusão de DNA.
    - **Capítulo 10:** Comunicação Inter-Contratos & Interfaces (`KittyInterface`)
    - **Conceito:** Abstração de contratos terceiros via Interfaces; assinatura de funções externas sem corpo de execução e suporte a múltiplos retornos em Solidity.
    - **Objetivo:** Declarar a interface `KittyInterface` com a assinatura da função `getKitty` para permitir a leitura do genoma dos CryptoKitties na blockchain sem alterar o contrato de origem.

- **Status:** Lição 2 Em Andamento ⏳


#### Capítulo 2
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 2 Código](./assets/2_Chapter_2.png) | ![Capítulo 2 Concluído](./assets/2_Chapter_2_Mappings_And_Addresses_Ok.png) |

#### Capítulo 3
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 3 Código](./assets/2_Chapter_3.png) | ![Capítulo 3 Concluído](./assets/2_Chapter_3_Msg_Sender_Ok.png) |

#### Capítulo 4
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 4 Código](./assets/2_Chapter_4.png) | ![Capítulo 4 Concluído](./assets/2_Chapter_4_Require_Ok.png) |

#### Capítulo 5
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 5 Código](./assets/2_Chapter_5.png) | ![Capítulo 5 Concluído](./assets/2_Chapter_5_Inheritance_Ok.png) |

#### Capítulo 6
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 6 Código](./assets/2_Chapter_6.png) | ![Capítulo 6 Concluído](./assets/2_Chapter_6_Import_Ok.png) |

#### Capítulo 7
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 7 Código](./assets/2_Chapter_7.png) | ![Capítulo 7 Concluído](./assets/2_Chapter_7_Storage_Vs_Memory_Data_Location_Ok.png) |

#### Capítulo 8 
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 8 Código](./assets/2_Chapter_8.png) | ![Capítulo 8 Concluído](./assets/2_Chapter_8_Zombie_DNA.png) |

#### Capítulo 9
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 9 Código](./assets/2_Chapter_9.png) | ![Capítulo 9 Concluído](./assets/2_Chapter_9_More_On_Function_Visibility_Ok.png) |

#### Capítulo 10
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 10 Código](./assets/2_Chapter_10.png) | ![Capítulo 10 Concluído](./assets/2_Chapter_10_What_Do_Zombies_Eat_Ok.png) |

---

## 🛡️ Notas de Auditoria & Segurança

> **Relatório de Análise — Lição 1 (Capítulos 8, 9, 11, 12 e 13) e Lição 2 (Capítulos 3 e 4)** 

### 1. Vulnerabilidade de Controle de Acesso (Capítulo 8) — ⚠️ IDENTIFICADO
* **Falha:** Ausência de Controle de Acesso e Limitação de Frequência (*Unprotected Public Function / Lack of Rate Limiting*).
* **Risco/Cenário de Ataque:** Como a função era declarada como `public` sem nenhuma trava, qualquer carteira ou contrato externo podia executá-la milhares de vezes seguidas, inflando o array `zombies` no *Storage* da rede e podendo causar um ataque de Negação de Serviço (DoS) por excesso de estado.

```solidity
// ⚠️ VULNERÁVEL (Capítulo 8): Função pública sem restrição de acesso
function createZombie(string memory _name, uint _dna) public {
    zombies.push(Zombie(_name, _dna));
}
```

### 2. Correção & Mitigação de Controle de Acesso (Capítulo 9) — 🟢 RESOLVIDO
* **Status:** **Mitigado / Resolvido**
* **Ação Corretiva:** 
  - Restrição da visibilidade da função de `public` para `private`, impedindo chamadas externas diretas por carteiras ou contratos não autorizados.
  - Aplicação do padrão de boas práticas de nomenclatura em Solidity, adicionando o *prefixo underline* (`_`) na função `_createZombie`.

```solidity
// 🔒 CORRIGIDO (Capítulo 9): Acesso restrito apenas ao próprio contrato
function _createZombie(string memory _name, uint _dna) private {
    zombies.push(Zombie(_name, _dna));
}
```

### 3. Vulnerabilidade de Aleatoriedade Insegura (Capítulo 11) — ⚠️ IDENTIFICADO
* **Falha:** Aleatoriedade Insegura baseada em Hash On-Chain (*Bad Randomness / Weak PRNG*).
* **Risco/Cenário de Ataque:** O uso de `keccak256(abi.encodePacked(_str))` é 100% determinístico e previsível. Como os dados da transação ficam visíveis na *mempool* antes de serem minerados, um atacante ou *bot* pode calcular antecipadamente o DNA gerado. Se o resultado não for vantajoso, ele cancela a transação ou só envia quando souber que gerará um zumbi raro.
* **Mitigação Recomendada:** Para ambientes de produção (Mainnet), nunca utilizar variáveis de estado locais ou hashes simples para aleatoriedade. A boa prática de mercado é utilizar oráculos descentralizados, como o **Chainlink VRF (Verifiable Random Function)**, que provê números aleatórios comprováveis *off-chain*.

```solidity
// ⚠️ INSEGURO (Capítulo 11): Algoritmo determinístico e previsível por bots
function _generateRandomDna(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % dnaModulus;
}
```

### 4. Arquitetura, Abstração e Proteção de Fluxo (Capítulo 12) — 🟢 BOA PRÁTICA APLICADA
* **Padrão Utilizado:** Camada de Abstração Pública (*Public Interface / Facade Pattern*).
* **Análise Técnica:** No Capítulo 12, a função `createRandomZombie` é criada como o único ponto de entrada público (`public`) para a criação de zumbis.
* **Ganho de Segurança & Integridade:**
  - Ao encapsular `_generateRandomDna` e `_createZombie` como funções privadas, o contrato impede que usuários externos enviem valores arbitrários de DNA (evitando a injeção manual de parâmetros).
  - O contrato impõe um fluxo de execução rígido e controlado: **Nome digitado ➡️ Geração Interna de DNA ➡️ Armazenamento no Estado**.

```solidity
// 🏛️ ARQUITETURA SEGURA (Capítulo 12): Interface pública controlando o fluxo interno
function createRandomZombie(string memory _name) public {
    uint randDna = _generateRandomDna(_name);
    _createZombie(_name, randDna);
}
```

### 5. Comunicação Off-Chain & Otimização de Gas via Eventos (Capítulo 13) — 🟢 BOA PRÁTICA APLICADA
* **Padrão Utilizado:** Emissão de Logs via `event` (`NewZombie`).
* **Análise Técnica:** No Capítulo 13, declarou-se o evento `NewZombie` e adicionou-se a instrução `emit` na criação de zumbis para notificar a interface do usuário (Frontend/Web3.js).
* **Ganho de Arquitetura & Economia:**
  - **Otimização de Gas:** Emitir um evento grava os dados nos logs de transação da EVM, o que custa substancialmente menos *gas* do que armazenar informações redundantes no *Storage* do contrato.
  - **Assincronismo:** Permite que a aplicação Web3 reaja em tempo real à criação de novos zumbis ("escutando" o evento) sem precisar fazer consultas repetitivas e dispendiosas (*polling*) na blockchain.

```solidity
// 📢 EVENTOS & LOGS (Capítulo 13): Comunicação otimizada com o Frontend
event NewZombie(uint zombieId, string name, uint dna);

function _createZombie(string memory _name, uint _dna) private {
    uint id = zombies.push(Zombie(_name, _dna)) - 1;
    emit NewZombie(id, _name, _dna);
}
```
### 6. Autenticidade de Identidade & Ausência de Trava por Carteira (Lição 2 - Capítulo 3) — 🟢 BOA PRÁTICA / ⚠️ PONTO DE ATENÇÃO
* **Padrão Utilizado:** Identificação Imutável via `` `msg.sender` ``.
* **Análise Técnica:** O uso de `` `msg.sender` `` no registro de posse (`zombieToOwner[id] = msg.sender`) garante a autenticidade da transação. Criptograficamente, é impossível uma carteira se passar por outra sem possuir a chave privada correspondente.
* **Ponto de Atenção Identificado (Regra de Negócio / Rate Limiting):** A função pública `createRandomZombie` ainda não possui verificação (`require`) de zumbis existentes por carteira. Um mesmo `` `msg.sender` `` pode invocar a criação de zumbis ilimitadas vezes, inflando o estado `ownerZombieCount` e acumulando zumbis sem restrição.

```solidity
// 🔒 AUTÊNTICO (Capítulo 3): Atribuição segura ao remetente da transação
zombieToOwner[id] = msg.sender;
ownerZombieCount[msg.sender]++;

```

### 7. Validação de Execução & Mitigação por Carteira (Lição 2 - Capítulo 4) — 🟢 RESOLVIDO
* **Status:** **Mitigado / Resolvido**
* **Padrão Utilizado:** Trava de Validação com `require`.
* **Análise Técnica:** No Capítulo 4, resolveu-se o ponto de atenção identificado no Capítulo 3 através da instrução `require(ownerZombieCount[msg.sender] == 0)`.
* **Ganho de Segurança & Regra de Negócio:**
  - Se um usuário tentar invocar a criação do zumbi inicial uma segunda vez, a condição do `require` retornará `false`, interrompendo e revertendo a transação imediatamente, protegendo o contrato de spam e acúmulo desordenado de estado.

```solidity
 //🔒 SEGURANÇA & VALIDAÇÃO (Capítulo 4): Garantia de Zumbi Único por Jogador
  
 function createRandomZombie(string memory _name) public {
     require(ownerZombieCount[msg.sender] == 0);
     uint randDna = _generateRandomDna(_name);
     _createZombie(_name, randDna);
 }
 ```

### 8. Arquitetura Modular e Superfície de Ataque por Herança

* **Vulnerabilidade / Risco:** ⚠️ Contratos extensos e monolíticos (*God Contracts*) dificultam a leitura e ocultam falhas críticas. Ao utilizar herança (`is`), o contrato filho passa a herdar todas as funções e variáveis do pai (`public` e `internal`), expandindo a superfície de ataque se a herança não for intencional ou bem mapeada.
* **Mitigação / Boa Prática:** 🛡️ Modularizar o projeto dividindo a lógica em arquivos `.sol` independentes e realizar a importação via `import "./arquivo.sol";`. Isso isola responsabilidades, facilita a realização de testes unitários e simplifica o processo de auditoria.

```solidity
pragma solidity >=0.5.0 <0.6.0;

// Importação do contrato pai mantendo o escopo modular
import "./zombiefactory.sol";

// Herança explícita para reuso seguro de código
contract ZombieFeeding is ZombieFactory {

}
```

### 9. Controle de Acesso & Risco de Mutações Indesejadas via Ponteiro Storage (Capítulo 7)

* **Vulnerabilidade / Risco:** ⚠️ **Controle de Acesso Quebrado e Mutações Indesejadas de Estado:** Executar ações em zumbis de terceiros por falta de validação, ou alterar dados permanentemente por engano. Ao declarar uma variável como `storage`, cria-se um ponteiro direto para o estado da blockchain; qualquer alteração nela sobrescreve o banco de dados da EVM e consome alto valor em gás.
* **Mitigação / Boa Prática:** 🛡️ Validar a posse do ativo no início da função via `require(msg.sender == zombieToOwner[_zombieId])`. Usar `storage` estritamente quando a intenção for modificar o estado permanente (como na função `feedAndMultiply`, que alterará o DNA no próximo capítulo). Caso a operação seja apenas de leitura ou cálculo temporário, deve-se utilizar `memory`.

```solidity
function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    // 🔒 Trava de segurança: Valida se o chamador é o dono legítimo do zumbi
    require(msg.sender == zombieToOwner[_zombieId]);
    
    // 📌 Ponteiro de estado direto no Storage (preparando para alteração de DNA no Cap. 8)
    Zombie storage myZombie = zombies[_zombieId];
}

```

### 10. Restrição Incômoda de Visibilidade por Herança (`private` vs `internal`) (Capítulo 8)

* **Vulnerabilidade / Falha de Arquitetura:** ⚠️ **Encapsulamento Excessivo / Herança Bloqueada:** Tentar invocar funções privadas (`private`) da classe pai a partir de um contrato filho herdado. A função `_createZombie` foi definida como `private` em `ZombieFactory`, impedindo que o contrato `ZombieFeeding` crie novos zumbis durante a fusão de DNA, o que gera erro de compilação.
* **Mitigação / Boa Prática:** 🛡️ Reavaliar os modificadores de visibilidade na arquitetura modular. Quando uma função precisa ser protegida contra chamadas externas de usuários, mas precisa ser herdada e executada por contratos filhos, deve-se utilizar a visibilidade `internal` no lugar de `private`.

```solidity
function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
    
    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myZombie.dna + _targetDna) / 2;
    
    // ⚠️ Requer que _createZombie seja 'internal' na classe pai para compilar
    _createZombie("NoName", newDna);
}
```

* **Ação Corretiva & Mitigação (Capítulo 9):** 🟢 **Ajuste para Visibilidade Internal:** A visibilidade de `_createZombie` foi alterada de `private` para `internal` no contrato pai (`ZombieFactory`). Isso manteve a função protegida contra chamadas públicas diretas de carteiras externas, enquanto liberou o acesso para que contratos filhos (como `ZombieFeeding`) executem a criação de zumbis após a fusão de DNA.

```solidity
// 🔒 CORRIGIDO NO CAPÍTULO 9 (em zombiefactory.sol): Visibilidade internal liberando a herança
function _createZombie(string memory _name, uint _dna) internal {
    uint id = zombies.push(Zombie(_name, _dna)) - 1;
    zombieToOwner[id] = msg.sender;
    ownerZombieCount[msg.sender]++;
    emit NewZombie(id, _name, _dna);
}
```

### 11. Integração com Contratos Externos via Interfaces (Capítulo 10) — 🟢 BOA PRÁTICA APLICADA

* **Padrão Utilizado:** Definição de Interfaces para Contratos Terceiros (*Interface Abstraction Pattern*).
* **Análise Técnica:** No Capítulo 10, criou-se a `KittyInterface` para permitir que o contrato `ZombieFeeding` consulte a função `getKitty` de um contrato externo (CryptoKitties). Ao declarar apenas a assinatura da função (encerrando com `;`), o compilador entende como instanciar a comunicação em tempo de execução.
* **Ganho de Arquitetura & Interoperabilidade:**
  * **Interoperabilidade Web3:** Permite ler e manipular dados de contratos que não nos pertencem e que já estão publicados na rede Ethereum (como os CryptoKitties).
  * **Economia de Estado:** Não é necessário copiar o código completo do contrato externo para o nosso projeto, mantendo a compilação leve e focada apenas nos métodos de interesse.

```solidity
// 🐱 INTERFACE (Capítulo 10): Esqueleto de comunicação com o contrato CryptoKitties
contract KittyInterface {
    function getKitty(uint256 _id) external view returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    );
}
```

## 🛠️ Tecnologias & Ferramentas Utilizadas

* **Solidity** (Linguagem de programação para Smart Contracts)
* **CryptoZombies** (Plataforma interativa de aprendizagem Web3)
* **VS Code** (Editor de código para desenvolvimento local)
* **Git & GitHub** (Controle de versão e documentação de portfólio)
