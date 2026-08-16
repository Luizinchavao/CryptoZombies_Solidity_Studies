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