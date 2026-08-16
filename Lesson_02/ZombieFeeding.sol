// Função interna que calcula a combinação de DNAs e gera o novo zumbi.
  // Alterada para 'internal' para impedir chamadas externas diretas e não-autorizadas.
  function feedAndMultiply(uint _zombieId, uint _targetDna, string memory _species) internal {
    // Cria uma referência temporária do tipo 'storage' apontando diretamente para o zumbi armazenado no array.
    Zombie storage myZombie = zombies[_zombieId];

    // Trava temporal: Garante que o zumbi cumpriu o tempo de recarga antes de se alimentar novamente.
    require(_isReady(myZombie));

    // Garante que o DNA do alvo recebido tenha no máximo 16 dígitos através do resto da divisão (% 10^16).
    _targetDna = _targetDna % dnaModulus;

    // Calcula a média aritmética entre o DNA do zumbi e o DNA do alvo para gerar o código genético do novo zumbi.
    uint newDna = (myZombie.dna + _targetDna) / 2;

    // Verifica se a espécie informada é equivalente ao texto "kitty".
    if (keccak256(abi.encodePacked(_species)) == keccak256(abi.encodePacked("kitty"))) {
      // Se a espécie for "kitty", substitui os 2 últimos dígitos do novo DNA pelo número 99 (marcação visual de zumbi-gato).
      newDna = newDna - (newDna % 100) + 99;
    }

    // Executa a função interna herdada do ZombieFactory para registrar o novo zumbi na blockchain com o nome "NoName".
    _createZombie("NoName", newDna);

    // Reseta e ativa o tempo de recarga (1 dia) do zumbi que acabou de se alimentar.
    _triggerCooldown(myZombie);
  }

  // Função pública dedicada para alimentar um zumbi utilizando o DNA extraído de um CryptoKitty.
  function feedOnKitty(uint _zombieId, uint _kittyId) public {
    // Declara a variável local que receberá o DNA (genes) do gatinho.
    uint kittyDna;

    // Trava de segurança: Garante que a carteira executando a transação (msg.sender) é a proprietária do zumbi informado.
    require(msg.sender == zombieToOwner[_zombieId]);

    // Faz a chamada ao contrato externo do CryptoKitties através da interface.
    // Utiliza 9 vírgulas vazias para ignorar as 9 primeiras variáveis de retorno e armazena apenas o último valor (genes) em kittyDna.
    (,,,,,,,,,kittyDna) = kittyContract.getKitty(_kittyId);

    // Executa a função de alimentação e multiplicação passando o ID do zumbi, o DNA extraído do gatinho e a espécie "kitty".
    feedAndMultiply(_zombieId, kittyDna, "kitty");
  }