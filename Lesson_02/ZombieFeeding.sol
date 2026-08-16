// SPDX-License-Identifier: MIT
// Define a licença do código-fonte como MIT (padrão para projetos de código aberto).
pragma solidity >=0.5.0 <0.6.0;

// Importa todas as definições, variáveis e funções do contrato pai (ZombieFactory.sol).
import "./ZombieFactory.sol";

// Declaração da interface para comunicação com o contrato externo do CryptoKitties na blockchain.
contract KittyInterface {
  // Assinatura da função externa do CryptoKitties para consultar os dados de um gatinho pelo ID.
  function getKitty(uint256 _id) external view returns (
    bool isGestating,    // Indica se a gatinha está grávida.
    bool isReady,        // Indica se o gatinho está pronto para cruzar.
    uint256 cooldownIndex, // Tempo de espera entre cruzamentos.
    uint256 nextActionAt,  // Próximo momento em que poderá agir.
    uint256 siringWithId,  // ID do parceiro de cruzamento.
    uint256 birthTime,     // Timestamp de nascimento.
    uint256 matronId,      // ID da mãe do gatinho.
    uint256 sireId,        // ID do pai do gatinho.
    uint256 generation,    // Geração do gatinho.
    uint256 genes          // O DNA / código genético do gatinho (o único dado que usaremos).
  );
}

// Declara o contrato ZombieFeeding que herda todas as variáveis e funções do ZombieFactory.
contract ZombieFeeding is ZombieFactory {

  // Declara a variável de estado que armazenará a instância da interface do CryptoKitties.
  // Fica vazia inicialmente para permitir a configuração dinâmica do endereço do contrato na rede.
  KittyInterface kittyContract;

  // Função pública e externa que permite definir ou atualizar o endereço do contrato do CryptoKitties.
  function setKittyContractAddress(address _address) external onlyOwner {
    // Converte o endereço informado (_address) em um tipo KittyInterface e o atribui à variável kittyContract.
    // Isso inicializa a ponte de comunicação apontando para o contrato real publicado na blockchain.
    kittyContract = KittyInterface(_address);
  }

  // Função principal que calcula a combinação de DNAs entre o zumbi e o alvo, gerando um novo zumbi.
  function feedAndMultiply(uint _zombieId, uint _targetDna, string memory _species) public {
    // Trava de segurança: Garante que a carteira executando a transação (msg.sender) é a proprietária do zumbi informado.
    require(msg.sender == zombieToOwner[_zombieId]);

    // Cria uma referência temporária do tipo 'storage' apontando diretamente para o zumbi armazenado no array da blockchain.
    Zombie storage myZombie = zombies[_zombieId];

    // Garante que o DNA do alvo recebido tenha no máximo 16 dígitos através do resto da divisão (% 10^16).
    _targetDna = _targetDna % dnaModulus;

    // Calcula a média aritmética entre o DNA do zumbi e o DNA do alvo para gerar o código genético do novo zumbi.
    uint newDna = (myZombie.dna + _targetDna) / 2;

    // Verifica se a espécie informada é equivalente ao texto "kitty".
    // Como Solidity não compara strings diretamente com '==', convertemos ambas para hashes keccak256 antes da comparação.
    if (keccak256(abi.encodePacked(_species)) == keccak256(abi.encodePacked("kitty"))) {
      // Se a espécie for "kitty", substitui os 2 últimos dígitos do novo DNA pelo número 99 (marcação visual de zumbi-gato).
      newDna = newDna - (newDna % 100) + 99;
    }

    // Executa a função interna herdada do ZombieFactory para registrar o novo zumbi na blockchain com o nome "NoName".
    _createZombie("NoName", newDna);
  }

  // Função pública dedicada para alimentar um zumbi utilizando o DNA extraído de um CryptoKitty.
  function feedOnKitty(uint _zombieId, uint _kittyId) public {
    // Declara a variável local que receberá o DNA (genes) do gatinho.
    uint kittyDna;

    // Faz a chamada ao contrato externo do CryptoKitties através da interface.
    // Utiliza 9 vírgulas vazias para ignorar as 9 primeiras variáveis de retorno e armazena apenas o último valor (genes) na variável kittyDna.
    (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId);

    // Executa a função de alimentação e multiplicação passando o ID do zumbi, o DNA extraído do gatinho e a espécie "kitty".
    feedAndMultiply(_zombieId, kittyDna, "kitty");
  }
}
