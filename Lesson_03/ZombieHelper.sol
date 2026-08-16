// Define a versão do compilador Solidity compatível (maior ou igual a 0.5.0 e menor que 0.6.0).
pragma solidity >=0.5.0 <0.6.0;

// Importa o contrato 'zombiefeeding.sol' para herdar suas variáveis de estado, structs, mapeamentos e funções.
import "./zombiefeeding.sol";

// Declara o contrato 'ZombieHelper', que herda diretamente de 'ZombieFeeding' (e por extensão, de 'ZombieFactory' e 'Ownable').
contract ZombieHelper is ZombieFeeding {

  // Declaração do modificador de função 'aboveLevel', que recebe dois parâmetros para validação de nível mínimo.
  modifier aboveLevel(uint _level, uint _zombieId) {
    // Trava de segurança/negócio: Acessa o array 'zombies' no storage pelo ID fornecido e verifica se o seu atributo 'level' é maior ou igual ao nível exigido ('_level').
    require(zombies[_zombieId].level >= _level);
    // Instrução especial do Solidity que indica à EVM para mesclar e executar o corpo da função original que utiliza este modificador.
    _;
  }

  // Declara a função pública/externa 'changeName', permitindo alterar o nome do zumbi caso ele tenha atingido o nível 2 ou superior.
  function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
    // Trava de propriedade: Consulta o mapeamento 'zombieToOwner' para garantir que a carteira executando a transação ('msg.sender') é a dona do zumbi informado.
    require(msg.sender == zombieToOwner[_zombieId]);
    // Acessa a struct do zumbi correspondente dentro do array 'zombies' e atualiza o seu atributo 'name' com o novo nome fornecido.
    zombies[_zombieId].name = _newName;
  }

  // Declara a função pública/externa 'changeDna', permitindo alterar o DNA (aparência) do zumbi caso ele tenha atingido o nível 20 ou superior.
  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    // Trava de propriedade: Consulta o mapeamento 'zombieToOwner' para garantir que a carteira executando a transação ('msg.sender') é a dona do zumbi informado.
    require(msg.sender == zombieToOwner[_zombieId]);
    // Acessa a struct do zumbi correspondente dentro do array 'zombies' e atualiza o seu atributo 'dna' com o novo código genético fornecido.
    zombies[_zombieId].dna = _newDna;
  }

 
  // Declara a função de consulta 'getZombiesByOwner' para retornar todos os IDs de zumbis pertencentes ao endereço informado.
  // Usa o modificador 'view' (sem custo de gas em chamadas externas) e aloca dinamicamente na memória ('memory') um array temporário com o tamanho exato indicado por 'ownerZombieCount[_owner]'.
  function getZombiesByOwner(address _owner) external view returns (uint[] memory) {

  }

}