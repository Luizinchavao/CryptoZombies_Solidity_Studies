// SPDX-License-Identifier: MIT
// Define a licença do código-fonte como MIT (padrão para projetos open-source).
pragma solidity >=0.5.0 <0.6.0;

/**
 * @title Ownable
 * @dev O contrato Ownable armazena o endereço do proprietário (owner) e fornece um mecanismo
 * reutilizável de controle de acesso e restrição de privilégios para funções administrativas.
 */
contract Ownable {
  
  // Variável de estado privada que armazena o endereço de 20 bytes do proprietário atual do contrato.
  // Por ser 'private', o acesso direto e modificação ficam restritos estritamente ao contrato Ownable,
  // impedindo alterações acidentais ou não autorizadas por contratos que herdarem desta classe.
  address private _owner;

  // Evento disparado na blockchain para notificação off-chain (front-ends, oráculos e indexadores).
  // A palavra-chave 'indexed' nos parâmetros cria tópicos de busca nos logs da transação,
  // permitindo filtrar e auditar facilmente transferências de posse históricas.
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /**
   * @dev O construtor é executado uma única vez no momento do deploy do contrato na rede.
   * Ele define a carteira que iniciou a criação do contrato (msg.sender) como o `_owner` inicial.
   * O visibilidade 'internal' garante que o construtor só possa ser acionado durante a
   * instanciação de contratos derivados (ex: ZombieFactory e ZombieFeeding).
   */
  constructor() internal {
    // Captura a conta/carteira responsável pelo deploy e a registra como dona do contrato.
    _owner = msg.sender;

    // Dispara o evento de criação de posse inicial, registrando a transição do endereço zero (address(0))
    // para a carteira do criador.
    emit OwnershipTransferred(address(0), _owner);
  }

  /**
   * @dev Função de leitura (view) que expõe o endereço do proprietário atual de forma pública.
   * @return O endereço armazenado na variável privada _owner.
   */
  function owner() public view returns(address) {
    return _owner;
  }

  /**
   * @dev MODIFICADOR DE FUNÇÃO: Mecanismo de guarda/filtro de segurança.
   * 
   * Como funciona por baixo dos panos:
   * 1. Quando uma função decorada com 'onlyOwner' é chamada, a execução da função é pausada
   *    e o controle é redirecionado para este bloco de código do modificador.
   * 2. A instrução 'require(isOwner())' é avaliada:
   *    - Se 'isOwner()' retornar 'true' (ou seja, msg.sender == _owner), a verificação é bem-sucedida.
   *    - Se retornar 'false', a transação sofre um REVERT imediato, desfazendo todas as alterações de estado
   *      e cancelando o processamento da chamada para economizar gas.
   * 3. Símbolo Especial '_;' (Merge Point): Representa o ponto exato de interpolação do código.
   *    Uma vez superada a trava do 'require', o Solidity insere e executa o corpo da função original
   *    que utilizou o modificador 'onlyOwner'.
   */
  modifier onlyOwner() {
    // Passo 1: Intercepta a chamada e valida se quem enviou a transação é o proprietário legítimo.
    require(isOwner());

    // Passo 2: Libera o fluxo de execução para prosseguir com o código da função que foi decorada.
    _;
  }

  /**
   * @dev Função utilitária de checagem que compara o remetente atual da transação (msg.sender)
   * com o endereço registrado na variável privada `_owner`.
   * @return 'true' se quem chamou a função for o dono, 'false' para qualquer outra conta.
   */
  function isOwner() public view returns(bool) {
    return msg.sender == _owner;
  }

  /**
   * @dev Permite que o proprietário renuncie voluntariamente ao controle do contrato.
   * 
   * ⚠️ ATENÇÃO E NOTAS DE SEGURANÇA:
   * - Esta ação é IRREVERSÍVEL.
   * - Ao zerar a propriedade (`_owner = address(0)`), todas as funções protegidas pelo
   *   modificador `onlyOwner` ficarão permanentemente inacessíveis e bloqueadas para sempre.
   */
  function renounceOwnership() public onlyOwner {
    // Notifica a rede que o contrato foi desassociado de qualquer proprietário ativo.
    emit OwnershipTransferred(_owner, address(0));

    // Desvincula o endereço do proprietário atribuindo o endereço nulo (0x0000000000000000000000000000000000000000).
    _owner = address(0);
  }

  /**
   * @dev Permite a transferência de controle do contrato para uma nova carteira/endereço.
   * Protegida pelo modificador 'onlyOwner' para impedir que terceiros transfiram a posse.
   * @param newOwner O endereço da nova carteira que assumirá a propriedade do contrato.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    // Encaminha a operação para a rotina interna parametrizada de transferência de posse.
    _transferOwnership(newOwner);
  }

  /**
   * @dev Função interna de suporte que executa a alteração do estado de propriedade.
   * Por ser 'internal', não pode ser chamada de fora da blockchain, funcionando como uma rotina protegida.
   * @param newOwner O endereço do novo proprietário a ser cadastrado.
   */
  function _transferOwnership(address newOwner) internal {
    // Trava de Segurança Crítica: Impede a transferência acidental para o endereço nulo/invalidado.
    // Garante que o novo proprietário seja um endereço válido antes de efetivar a troca.
    require(newOwner != address(0));

    // Emite o evento registrando formalmente a substituição do proprietário anterior pelo novo.
    emit OwnershipTransferred(_owner, newOwner);

    // Atualiza o estado gravando o novo endereço na variável de estado privada _owner.
    _owner = newOwner;
  }
}