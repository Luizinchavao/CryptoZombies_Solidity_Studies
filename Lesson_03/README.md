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

```

---

### 🔹 Capítulo 6: Passando Structs como Argumentos e Funções de Cooldown
* **Conceito:** Passagem de referências de estruturas (`Zombie storage _zombie`) em funções `internal`, permitindo tanto a mutação do estado no *storage* quanto a verificação de condições temporais (`now`).
* **Objetivo:** Criar a função `_triggerCooldown` para atualizar o `readyTime` do zumbi e a função de checagem `_isReady` para validar se o tempo de espera de recarga já expirou.

```solidity
// Função interna que reseta e aplica o tempo de recarga (1 dia) ao zumbi
function _triggerCooldown(Zombie storage _zombie) internal {
  _zombie.readyTime = uint32(now + cooldownTime);
}

// Função interna de leitura que verifica se o tempo de recarga do zumbi já passou
function _isReady(Zombie storage _zombie) internal view returns (bool) {
  return (_zombie.readyTime <= now);
}
```

---

### 🔹 Capítulo 7: Integração de Cooldowns na Alimentação
* **Conceito:** Aplicação de travas temporais em funções de ação usando `require` combinado com funções internas de checagem (`_isReady`) e atualização de estado (`_triggerCooldown`).
* **Objetivo:** Atualizar a função `feedAndMultiply` para exigir que o zumbi esteja pronto para agir (`require(_isReady(myZombie))`) e disparar o tempo de recarga (`_triggerCooldown(myZombie)`) ao finalizar o processo.

```solidity
// Adição da checagem e disparo de cooldown na função feedAndMultiply:
require(_isReady(myZombie));

// ... cálculo de DNA e criação do novo zumbi ...

_triggerCooldown(myZombie);

```

---

### 🔹 Capítulo 8: Modificadores de Função com Argumentos (`modifier`)
* **Conceito:** Criação de modificadores reutilizáveis que aceitam parâmetros dinâmicos para aplicar travas e pré-condições (*gatekeeping*) antes da execução de funções.
* **Objetivo:** Criar o contrato `ZombieHelper` (herdeiro de `ZombieFeeding`) e definir o modificador `aboveLevel(uint _level, uint _zombieId)` para validar se o zumbi possui o nível mínimo necessário para executar ações avançadas.

```solidity
// Modificador com argumentos herdando acesso ao storage do contrato pai
modifier aboveLevel(uint _level, uint _zombieId) {
  require(zombies[_zombieId].level >= _level);
  _;
}
```

---

### 🔹 Capítulo 9: Aplicação de Modificadores em Funções Externas
* **Conceito:** Utilização de modificadores de função parametrizados para condicionar a execução de funcionalidades externas (`external`) ao cumprimento de requisitos de estado (nível do zumbi).
* **Objetivo:** Implementar as funções `changeName` (nível mínimo 2) e `changeDna` (nível mínimo 20) no contrato `ZombieHelper`, aplicando o modificador `aboveLevel` e a verificação de propriedade do zumbi.

```solidity
// Função externa que exige nível 2 para trocar nome
function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
  require(msg.sender == zombieToOwner[_zombieId]);
  zombies[_zombieId].name = _newName;
}

// Função externa que exige nível 20 para alterar DNA
function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
  require(msg.sender == zombieToOwner[_zombieId]);
  zombies[_zombieId].dna = _newDna;
}
```

---

### 🔹 Capítulo 10: Economizando Gas com Funções de Leitura (`view`) e Arrays em Memória
* **Conceito:** Utilização do modificador `view` para garantir execução sem custo de gas em chamadas externas e alocação dinâmica de arrays temporários em memória com a sintaxe `new uint[](tamanho)`.
* **Objetivo:** Declarar o cabeçalho da função `getZombiesByOwner(address _owner)` no contrato `ZombieHelper` e alocar o array `result` na memória com o tamanho exato de `ownerZombieCount[_owner]`.

```solidity
// Alocação de array em memória e retorno de consulta 'view'
function getZombiesByOwner(address _owner) external view returns (uint[] memory) {
  uint[] memory result = new uint[](ownerZombieCount[_owner]);
  return result;
}
```

---
