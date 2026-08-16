// SPDX-License-Identifier: MIT
// Define a licença do código-fonte como MIT (padrão para código aberto).
pragma solidity >=0.5.0 <0.6.0;

// Importa o arquivo externo 'ownable.sol', permitindo reutilizar o contrato Ownable que gerencia permissões de proprietário do contrato.
import "./ownable.sol";

// Declaração do contrato 'ZombieFactory' que herda ('is') todas as variáveis, funções e modificadores do contrato 'Ownable'.
contract ZombieFactory is Ownable {

    // Evento emitido sempre que um novo zumbi é criado na blockchain.
    // Permite que aplicativos externos (front-end) escutem a criação do zumbi.
    event NewZombie(uint zombiId, string name, uint dna);

    // Define a quantidade de dígitos do DNA do zumbi (16 dígitos).
    uint dnaDigits = 16;

    // Modulador usado para garantir que o DNA tenha exatamente 16 dígitos (10^16).
    uint dnaModulus = 10 ** dnaDigits;

    // Tempo de recarga base para as ações e ataques dos zumbis (1 dia em segundos).
    uint cooldownTime = 1 days;

    // Estrutura de dados que define o que é um Zumbi (nome, DNA, nível e tempo de recarga).
    // 💡 OTIMIZADO: Struct Packing para economia de gas no storage
    // Ao declarar uint32 para level e readyTime lado a lado, a EVM empacota
    // ambos os dados no mesmo slot de memória (32 bytes), reduzindo custos de SSTORE.
    struct Zombie {
        string name;
        uint dna;
        uint32 level;     // Nível do zumbi (32 bits)
        uint32 readyTime; // Timestamp para o tempo de recarga / cooldown (32 bits)
    }

    // Array público que armazena a lista de todos os zumbis criados no contrato.
    Zombie[] public zombies;

    // Mapeamento que vincula o ID do zumbi (uint) ao endereço da carteira do seu dono (address).
    mapping(uint => address) public zombieToOwner;

    // Mapeamento que armazena a quantidade de zumbis que cada endereço de carteira possui.
    mapping(address => uint) ownerZombieCount;

    // Função interna que cria um zumbi e o registra na blockchain.
    function _createZombie(string memory _name, uint _dna) internal {        
        // Adiciona o novo zumbi ao array 'zombies' informando name, dna, level (1) e readyTime (uint32(now + cooldownTime)), e obtém o seu ID.
        uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime))) - 1;

        // Atribui a posse do zumbi (pelo ID) para a carteira que chamou a transação (msg.sender).
        zombieToOwner[id] = msg.sender;

        // Incrementa em +1 o contador de zumbis pertencentes à carteira que chamou a função.
        ownerZombieCount[msg.sender]++;

        // Dispara o evento alertando a criação do novo zumbi com ID, nome e DNA.
        emit NewZombie(id, _name, _dna);
    }

    // Função privada e de leitura ('view') que gera um DNA pseudo-aleatório com base em um texto informado.
    function _generateRandomDna(string memory _str) private view returns (uint) {
        // Gera um hash SHA3 (keccak256) da string de entrada e o converte para um número inteiro (uint).
        uint rand = uint(keccak256(abi.encodePacked(_str)));

        // Utiliza o resto da divisão (%) pelo modulador para garantir um número de até 16 dígitos.
        return rand % dnaModulus;
    }

    // Função pública que permite criar um zumbi aleatório informando apenas o nome.
    function createRandomZombie(string memory _name) public {
        // Exige que a carteira que está chamando a função não possua nenhum zumbi (somente 1 zumbi inicial por conta).
        require(ownerZombieCount[msg.sender] == 0);

        // Gera o DNA aleatório com base no nome informado.
        uint randDna = _generateRandomDna(_name);

        // Chama a função interna para registrar o zumbi no contrato.
        _createZombie(_name, randDna);
    }
}