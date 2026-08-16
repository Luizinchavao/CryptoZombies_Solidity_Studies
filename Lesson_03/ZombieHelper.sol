pragma solidity >=0.5.0 <0.6.0;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {

  // Modificador personalizado que recebe argumentos para validar o nível mínimo do zumbi
  modifier aboveLevel(uint _level, uint _zombieId) {
    // Valida se o nível atual do zumbi no storage atende ou supera o requisito exigido
    require(zombies[_zombieId].level >= _level);
    // Transfere o fluxo de execução para a função original onde o modificador foi aplicado
    _;
  }

}