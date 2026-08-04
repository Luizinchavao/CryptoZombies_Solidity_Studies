# 🧟‍♂️ CryptoZombies - Estudos de Solidity & Web3

Repositório dedicado aos meus estudos práticos da linguagem **Solidity** e desenvolvimento de **DApps (Decentralized Applications)** na blockchain Ethereum.

Acompanhando o curso interativo **CryptoZombies** juntamente com as aulas e lives do canal **queroser.ninja** (Fernando Daciuk).

---

## 📌 Status do Projeto

- **Fase Atual:** Lição 1 - Capítulo 9 concluído 🏁
- **Status:** 🟡 Em andamento / Transição para o Capítulo 10
- **Foco Atual:** Consolidação de fundamentos (structs, arrays e visibilidade) com adição de análise crítica de segurança/auditoria nos contratos.

---

## 📸 Registro de Progresso

### 🧟 Lição 1: Criando a Fábrica de Zumbis
- **Tópicos:** 
  - **Capítulo 2:** `pragma solidity` (Definição de versão) e declaração do `contract ZombieFactory`.
  - **Capítulo 3:** Variáveis de estado (`uint`) e atribuição de valores (`uint dnaDigits = 16;`).
  - **Capítulo 4:** Operações matemáticas (`+`, `-`, `*`, `/`, `%`) e operador de exponenciação (`**`).
  - **Capítulo 5:** `struct` (Criação de tipos de dados personalizados complexos).
  - **Capítulo 6:** `arrays` (Criação de matrizes/listas dinâmicas e públicas).
  - **Capítulo 7:** `function` (Declarações de funções, parâmetros e especificação de memória).
  - **Capítulo 8:** `push` com `structs` (Adicionando novos elementos a arrays dinâmicos).
  - **Capítulo 9:** Funções privadas (`private`) e convenção de nomenclatura com underline (`_`).
- **Status:** Em andamento ⏳

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

---

## 🛡️ Notas de Auditoria & Segurança

> **Relatório de Análise — Lição 1 (Capítulos 8 e 9)**

### 1. Histórico de Vulnerabilidade Identificada (Capítulo 8)
* **Falha:** Ausência de Controle de Acesso e Limitação de Frequência (*Unprotected Public Function / Lack of Rate Limiting*).
* **Risco/Cenário de Ataque:** Como a função era declarada como `public` sem nenhuma trava, qualquer carteira ou contrato externo podia executá-la milhares de vezes seguidas, inflando o array `zombies` no *Storage* da rede e podendo causar um ataque de Negação de Serviço (DoS) por excesso de estado.

```solidity
// ⚠️ VULNERÁVEL (Capítulo 8): Função pública sem restrição de acesso
function createZombie(string memory _name, uint _dna) public {
    zombies.push(Zombie(_name, _dna));
}
```

### 2. Correção & Mitigação Aplicada (Capítulo 9) — 🟢 RESOLVIDO
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

---

## 🛠️ Tecnologias & Ferramentas Utilizadas

* **Solidity** (Linguagem de programação para Smart Contracts)
* **CryptoZombies** (Plataforma interativa de aprendizagem Web3)
* **VS Code** (Editor de código para desenvolvimento local)
* **Git & GitHub** (Controle de versão e documentação de portfólio)