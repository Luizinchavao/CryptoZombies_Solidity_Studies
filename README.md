# 🧟‍♂️ CryptoZombies - Estudos de Solidity & Web3

Repositório dedicado aos meus estudos práticos da linguagem **Solidity** e desenvolvimento de **DApps (Decentralized Applications)** na blockchain Ethereum.

Acompanhando o curso interativo **CryptoZombies** juntamente com as aulas e lives do canal **queroser.ninja** (Fernando Daciuk).

---

## 📌 Status do Projeto

- **Fase Atual:** Lição 2 - Capítulo 3 concluído 🏁
- **Status:** 🟡 Em andamento / Transição para o Capítulo 4
- **Foco Atual:** Mapeamentos (`mapping`), variáveis globais (`msg.sender`), endereços (`address`), propriedade de ativos e lógica de combate entre zumbis.

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

- **Status:** Lição 2 Em Andamento ⏳


#### Capítulo 2
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 2 Código](./assets/2_Chapter_2.png) | ![Capítulo 2 Concluído](./assets/2_Chapter_2_Mappings_And_Addresses_Ok.png) |

#### Capítulo 3
| Código Desenvolvido | Lição Concluída |
| :---: | :---: |
| ![Capítulo 3 Código](./assets/2_Chapter_3.png) | ![Capítulo 3 Concluído](./assets/2_Chapter_3_Msg_Sender_Ok.png) |

---

## 🛡️ Notas de Auditoria & Segurança

> **Relatório de Análise — Lição 1 (Capítulos 8, 9, 11, 12 e 13)**

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
---

## 🛠️ Tecnologias & Ferramentas Utilizadas

* **Solidity** (Linguagem de programação para Smart Contracts)
* **CryptoZombies** (Plataforma interativa de aprendizagem Web3)
* **VS Code** (Editor de código para desenvolvimento local)
* **Git & GitHub** (Controle de versão e documentação de portfólio)