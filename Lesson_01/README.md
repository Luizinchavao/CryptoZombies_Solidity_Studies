[← Voltar ao README Principal](../README.md)

# 🧟 Lição 1: Criando a Fábrica de Zumbis

---

## 📌 Tópicos & Capítulos

### 🔹 Capítulo 1: Visão Geral & Introdução
* **Conceito:** Arquitetura básica de contratos inteligentes executados na Ethereum Virtual Machine (EVM).
* **Objetivo:** Compreender o funcionamento do jogo interativo e a estrutura fundamental dos contratos em Solidity.

---

### 🔹 Capítulo 2: `pragma solidity` & Declaração de Contrato
* **Conceito:** Versionamento de compilador e encapsulamento de código via `contract`.
* **Objetivo:** Definir a versão do compilador Solidity (`pragma`) e declarar a estrutura base do contrato `ZombieFactory`.

---

### 🔹 Capítulo 3: Variáveis de Estado & Inteiros (`uint`)
* **Conceito:** Armazenamento persistente de dados na blockchain (*Storage*) e tipos numéricos não assinados.
* **Objetivo:** Definir a variável de estado `dnaDigits` para estabelecer a precisão numérica de 16 dígitos do DNA dos zumbis.

---

### 🔹 Capítulo 4: Operações Matemáticas
* **Conceito:** Aritmética de precisão em Solidity (`+`, `-`, `*`, `/`, `%`) e exponenciação (`**`).
* **Objetivo:** Calcular o `dnaModulus` ($10^{16}$) para limitar e manipular matematicamente os valores do DNA.

---

### 🔹 Capítulo 5: Estruturas de Dados (`struct`)
* **Conceito:** Criação de tipos de dados personalizados complexos.
* **Objetivo:** Modelar a estrutura `Zombie` composta por atributos de nome (`string`) e DNA (`uint`).

---

### 🔹 Capítulo 6: Arrays Dinâmicos e Públicos (`arrays`)
* **Conceito:** Coleções de dados dinâmicas e geração automática de funções getter de leitura com o modificador `public`.
* **Objetivo:** Criar o array dinâmico e público `zombies` para armazenar a lista global de zumbis do jogo.

---

### 🔹 Capítulo 7: Declarações de Funções & Escopo de Memória
* **Conceito:** Assinatura de funções, passagem de parâmetros e especificação de localização de dados (`memory`).
* **Objetivo:** Declarar a função `createZombie` com parâmetros de entrada para nome e DNA.

---

### 🔹 Capítulo 8: Manipulação de Arrays Dinâmicos (`push`)
* **Conceito:** Inserção de novos elementos em arrays e gerenciamento de estado em structs.
* **Objetivo:** Instanciar novos objetos `Zombie` e adicioná-los ao array `zombies` via `.push()`.

---

### 🔹 Capítulo 9: Visibilidade de Funções (`private`) & Convenções de Código
* **Conceito:** Restrição do controle de acesso interno e padronização de nomenclatura com o prefixo underline (`_`).
* **Objetivo:** Converter `createZombie` para a função privada `_createZombie`, impedindo chamadas externas não autorizadas.

---

### 🔹 Capítulo 10: Retorno de Valores & Modificadores de Leitura (`view` / `pure`)
* **Conceito:** Declarações de retorno (`returns`) e otimização de execução sem alteração de estado na rede via `view`.
* **Objetivo:** Entender a diferença entre funções que alteram o estado da blockchain e funções de simples consulta sem custo de gás.

---

### 🔹 Capítulo 11: Hashes & Conversão de Tipos (`keccak256` & Typecasting)
* **Conceito:** Geração de identificadores pseudo-aleatórios via Keccak256 e casting de tipos primitivos.
* **Objetivo:** Criar a função `_generateRandomDna` para transformar dados de entrada em números de 16 dígitos usando `keccak256` e o operador `%`.

---

### 🔹 Capítulo 12: Abstração de Interfaces Públicas & Composição
* **Conceito:** Padrão de Fachada (*Facade Pattern*) e isolamento de fluxos de execução internos.
* **Objetivo:** Criar a interface pública `createRandomZombie` para unificar a geração de DNA e a criação do zumbi em uma única chamada.

---

### 🔹 Capítulo 13: Eventos (`events`) & Logs da EVM
* **Conceito:** Comunicação assíncrona off-chain sem necessidade de polling constante via `emit`.
* **Objetivo:** Declarar e emitir o evento `NewZombie` para notificar aplicações externas quando um novo zumbi for criado.

---

### 🔹 Capítulo 14: Integração Web3.js & Frontend
* **Conceito:** Conexão entre o Smart Contract e a camada de interface do usuário via JavaScript.
* **Objetivo:** Escutar eventos disparados pela blockchain para capturar dados em tempo real e renderizar o zumbi dinamicamente na tela.