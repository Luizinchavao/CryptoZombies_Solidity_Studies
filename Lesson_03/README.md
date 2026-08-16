[← Voltar ao README Principal](../README.md)

# 🧠 Lição 3: Conceitos Avançados de Solidity

---

## 📌 Tópicos & Capítulos

### 🔹 Capítulo 1: Imutabilidade dos Contratos & Dependências Externas
* **Conceito:** Compreensão do caráter imutável dos contratos em blockchain e técnicas para evitar acoplamento rígido de endereços (*hardcoding*).
* **Objetivo:** Remover o endereço fixo do CryptoKitties e criar a função `setKittyContractAddress` para permitir atualizações dinâmicas da interface do contrato externo.

---

### 🔹 Capítulo 2: Propriedade de Contratos & Padrão OpenZeppelin (`Ownable`)
* **Conceito:** Aplicação do padrão *Ownable* para gerenciamento de privilégios de controle e propriedade de smart contracts.
* **Objetivo:** Herdar o contrato `Ownable` no `ZombieFactory` e aplicar o modificador `onlyOwner` na função `setKittyContractAddress`, garantindo que apenas o criador do contrato possa atualizar o endereço da interface externa.

---

### 🔹 Capítulo 3: Modificador de Função `onlyOwner`
* **Conceito:** Aplicação do modificador `onlyOwner` obtido via herança encadeada (`ZombieFeeding` -> `ZombieFactory` -> `Ownable`) para proteção e controle de acesso a funções administrativas sensíveis.
* **Objetivo:** Adicionar o modificador `onlyOwner` na função `setKittyContractAddress`, corrigindo a vulnerabilidade de acesso público e garantindo que apenas o proprietário do contrato possa atualizar o endereço do contrato externo do CryptoKitties.

---

### 🔹 Capítulo 4: Gas e Otimização via *Struct Packing*
* **Conceito:** Compreensão de como a EVM (Ethereum Virtual Machine) gerencia armazenamento em palavras de 256 bits e como o agrupamento de variáveis menores (*Struct Packing*) reduz significativamente os custos das operações de gravação permanente (`SSTORE` — a instrução de baixo nível da EVM para gravar dados no *storage*).
* **Objetivo:** Adicionar os atributos contíguos `uint32 level` e `uint32 readyTime` na `struct Zombie` do contrato `ZombieFactory`, permitindo que o compilador empacote ambos os dados no mesmo *slot* de memória para economizar gas na criação e atualização de zumbis.

---

### 🔹 Capítulo 5: Unidades de Tempo e Cooldowns
* **Conceito:** Manipulação de tempo nativa no Solidity utilizando unidades temporais (`days`, `hours`, `seconds`) e a variável global `now` (Unix Timestamp atual do bloco).
* **Objetivo:** Declarar a variável `cooldownTime = 1 days` e atualizar a chamada de instanciação da struct na função `_createZombie` para incluir o nível inicial (`1`) e o tempo de recarga (`uint32(now + cooldownTime)`).

```solidity
uint cooldownTime = 1 days;

// Criação da struct Zombie atualizada com os 4 parâmetros:
uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime))) - 1;