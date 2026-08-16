// SPDX-License-Identifier: MIT
// Define a licença do código-fonte como MIT (padrão para projetos open-source).
pragma solidity >=0.5.0 <0.6.0;

/**
 * @title Ownable
 * @dev O contrato Ownable possui um endereço proprietário (owner) e fornece funções básicas de
 * controle de autorização. Isso simplifica a implementação de "permissões de usuário".
 */
contract Ownable {
  
  // Variável de estado privada que armazena o endereço do proprietário do contrato.
  // Por ser 'private', ela só é acessível diretamente dentro deste próprio contrato.
  address private _owner;

  // Evento emitido sempre que a posse do contrato é transferida ou renunciada.
  // A palavra-chave 'indexed' nos parâmetros permite que o DApp/front-end filtre buscas por esses endereços.
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /**
   * @dev O construtor do Ownable define o `owner` original do contrato como a conta
   * do remetente (msg.sender) no momento em que o contrato é implantado (deploy).
   * É definido como 'internal' porque este contrato é projetado para ser herdado por outros.
   */
  constructor() internal {
    // Grava o endereço da carteira que executou o deploy na variável privada _owner.
    _owner = msg.sender;

    // Dispara o evento de transferência registrando a criação inicial (do endereço zero para o criador).
    emit OwnershipTransferred(address(0), _owner);
  }

  /**
   * @dev Função pública de leitura que retorna o endereço do proprietário atual.
   * @return O endereço armazenado na variável _owner.
   */
  function owner() public view returns(address) {
    // Retorna o endereço do dono.
    return _owner;
  }

  /**
   * @dev Modificador que impede a execução de uma função caso quem a chamou não seja o dono.
   */
  modifier onlyOwner() {
    // Executa a verificação: se a função isOwner() retornar 'false', a transação é revertida imediatamente.
    require(isOwner());

    // O símbolo '_;' instrui o Solidity a executar o código da função original a partir deste ponto.
    _;
  }

  /**
   * @dev Função pública de leitura que verifica se o remetente da transação (msg.sender) é o proprietário.
   * @return 'true' se msg.sender for igual a _owner, caso contrário 'false'.
   */
  function isOwner() public view returns(bool) {
    // Compara o endereço de quem envia a transação com o endereço salvo na variável _owner.
    return msg.sender == _owner;
  }

  /**
   * @dev Permite que o proprietário atual renuncie ao controle do contrato.
   * @notice Renunciar à propriedade deixará o contrato sem um proprietário.
   * Não será mais possível chamar funções restritas com o modificador `onlyOwner`.
   */
  function renounceOwnership() public onlyOwner {
    // Emite o evento notificando que a posse foi enviada para o endereço nulo/zero.
    emit OwnershipTransferred(_owner, address(0));

    // Reseta a variável _owner para o endereço zero (0x0000000000000000000000000000000000000000).
    _owner = address(0);
  }

  /**
   * @dev Permite que o proprietário atual transfira o controle do contrato para um novo proprietário.
   * @param newOwner O endereço da carteira para a qual a propriedade será transferida.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    // Repassa a validação e atualização para a função interna _transferOwnership.
    _transferOwnership(newOwner);
  }

  /**
   * @dev Transfere o controle do contrato para um novo proprietário (newOwner).
   * Função de escopo interno para reuso e segurança dentro da classe.
   * @param newOwner O endereço para o qual a propriedade será transferida.
   */
  function _transferOwnership(address newOwner) internal {
    // Trava de segurança: impede transferir a propriedade por engano para um endereço inválido/zero.
    require(newOwner != address(0));

    // Emite o evento registrando a troca do dono antigo pelo novo.
    emit OwnershipTransferred(_owner, newOwner);

    // Atualiza a variável de estado _owner com o novo endereço fornecido.
    _owner = newOwner;
  }
}