class FireBaseErrors {
  static String verifyErroCode(String code) {
    switch (code) {
      case 'app-deleted':
        return 'O banco de dados não foi localizado.';
      case 'expired-action-code':
        return 'O código da ação o ou link expirou.';
      case 'invalid-action-code':
        return 'O código da ação é inválido. Isso pode acontecer se o código estiver malformado ou já tiver sido usado.';
      case 'user-disabled':
        return 'O usuário correspondente à credencial fornecida foi desativado.';
      case 'user-not-found':
        return 'O usuário não correponde à nenhuma credencial.';
      case 'weak-password':
        return 'A senha é muito fraca.';
      case 'email-already-in-use':
        return 'Já existi uma conta com o endereço de email fornecido.';
      case 'invalid-email':
        return 'O endereço de e-mail não é válido.';
      case 'operation-not-allowed':
        return 'O tipo de conta correspondente à esta credencial, ainda não encontra-se ativada.';
      case 'account-exists-with-different-credential':
        return 'E-mail já associado a outra conta.';
      case 'auth-domain-config-required':
        return 'A configuração para autenticação não foi fornecida.';
      case 'credential-already-in-use':
        return 'Já existe uma conta para esta credencial.';
      case 'operation-not-supported-in-this-environment':
        return 'Esta operação não é suportada no ambiente que está sendo executada. Verifique se deve ser http ou https.';
      case 'timeout':
        return 'Excedido o tempo de resposta. O domínio pode não estar autorizado para realizar operações.';
      case 'missing-android-pkg-name':
        return 'Deve ser fornecido um nome de pacote para instalação do aplicativo Android.';
      case 'missing-continue-uri':
        return 'A próxima URL deve ser fornecida na solicitação.';
      case 'missing-ios-bundle-id':
        return 'Deve ser fornecido um nome de pacote para instalação do aplicativo iOS.';
      case 'invalid-continue-uri':
        return 'A próxima URL fornecida na solicitação é inválida.';
      case 'unauthorized-continue-uri':
        return 'O domínio da próxima URL não está na lista de autorizações.';
      case 'invalid-dynamic-link-domain':
        return 'O domínio de link dinâmico fornecido, não está autorizado ou configurado no projeto atual.';
      case 'argument-error':
        return 'Verifique a configuração de link para o aplicativo.';
      case 'invalid-persistence-type':
        return 'O tipo especificado para a persistência dos dados é inválido.';
      case 'unsupported-persistence-type':
        return 'O ambiente atual não suportar o tipo especificado para persistência dos dados.';
      case 'invalid-credential':
        return 'A credencial expirou ou está mal formada.';
      case 'wrong-password':
        return 'Senha incorreta.';
      case 'invalid-verification-code':
        return 'O código de verificação da credencial não é válido.';
      case 'invalid-verification-id':
        return 'O ID de verificação da credencial não é válido.';
      case 'custom-token-mismatch':
        return 'O token está diferente do padrão solicitado.';
      case 'invalid-custom-token':
        return 'O token fornecido não é válido.';
      case 'captcha-check-failed':
        return 'O token de resposta do reCAPTCHA não é válido, expirou ou o domínio não é permitido.';
      case 'invalid-phone-number':
        return 'O número de telefone está em um formato inválido (padrão E.164).';
      case 'missing-phone-number':
        return 'O número de telefone é requerido.';
      case 'quota-exceeded':
        return 'A cota de SMS foi excedida.';
      case 'cancelled-popup-request':
        return 'Somente uma solicitação de janela pop-up é permitida de uma só vez.';
      case 'popup-blocked':
        return 'A janela pop-up foi bloqueado pelo navegador.';
      case 'popup-closed-by-user':
        return 'A janela pop-up foi fechada pelo usuário sem concluir o login no provedor.';
      case 'unauthorized-domain':
        return 'O domínio do aplicativo não está autorizado para realizar operações.';
      case 'invalid-user-token':
        return 'O usuário atual não foi identificado.';
      case 'user-token-expired':
        return 'O token do usuário atual expirou.';
      case 'null-user':
        return 'O usuário atual é nulo.';
      case 'app-not-authorized':
        return 'Aplicação não autorizada para autenticar com a chave informada.';
      case 'invalid-api-key':
        return 'A chave da API fornecida é inválida.';
      case 'network-request-failed':
        return 'Falha de conexão com a rede.';
      case 'requires-recent-login':
        return 'O último horário de acesso do usuário não atende ao limite de segurança.';
      case 'too-many-requests':
        return 'As solicitações foram bloqueadas devido a atividades incomuns. Tente novamente depois que algum tempo.';
      case 'web-storage-unsupported':
        return 'O navegador não suporta armazenamento ou se o usuário desativou este recurso.';
      case 'invalid-claims':
        return 'Os atributos de cadastro personalizado são inválidos.';
      case 'claims-too-large':
        return 'O tamanho da requisição excede o tamanho máximo permitido de 1 Megabyte.';
      case 'id-token-expired':
        return 'O token informado expirou.';
      case 'id-token-revoked':
        return 'O token informado perdeu a validade.';
      case 'invalid-argument':
        return 'Um argumento inválido foi fornecido a um método.';
      case 'invalid-creation-time':
        return 'O horário da criação precisa ser uma data UTC válida.';
      case 'invalid-disabled-field':
        return 'A propriedade para usuário desabilitado é inválida.';
      case 'invalid-display-name':
        return 'O nome do usuário é inválido.';
      case 'invalid-email-verified':
        return 'O e-mail é inválido.';
      case 'invalid-hash-algorithm':
        return 'O algoritmo de HASH não é uma criptografia compatível.';
      case 'invalid-hash-block-size':
        return 'O tamanho do bloco de HASH não é válido.';
      case 'invalid-hash-derived-key-length':
        return 'O tamanho da chave derivada do HASH não é válido.';
      case 'invalid-hash-key':
        return 'A chave de HASH precisa ter um buffer de byte válido.';
      case 'invalid-hash-memory-cost':
        return 'O custo da memória HASH não é válido.';
      case 'invalid-hash-parallelization':
        return 'O carregamento em paralelo do HASH não é válido.';
      case 'invalid-hash-rounds':
        return 'O arredondamento de HASH não é válido.';
      case 'invalid-hash-salt-separator':
        return 'O campo do separador de SALT do algoritmo de geração de HASH precisa ser um buffer de byte válido.';
      case 'invalid-id-token':
        return 'O código do token informado não é válido.';
      case 'invalid-last-sign-in-time':
        return 'O último horário de login precisa ser uma data UTC válida.';
      case 'invalid-page-token':
        return 'A próxima URL fornecida na solicitação é inválida.';
      case 'invalid-password':
        return 'A senha é inválida, precisa ter pelo menos 6 caracteres.';
      case 'invalid-password-hash':
        return 'O HASH da senha não é válida.';
      case 'invalid-password-salt':
        return 'O SALT da senha não é válido.';
      case 'invalid-photo-url':
        return 'A URL da foto de usuário é inválido.';
      case 'invalid-provider-id':
        return 'O identificador de provedor não é compatível.';
      case 'invalid-session-cookie-duration':
        return 'A duração do COOKIE da sessão precisa ser um número válido em milissegundos, entre 5 minutos e 2 semanas.';
      case 'invalid-uid':
        return 'O identificador fornecido deve ter no máximo 128 caracteres.';
      case 'invalid-user-import':
        return 'O registro do usuário a ser importado não é válido.';
      case 'invalid-provider-data':
        return 'O provedor de dados não é válido.';
      case 'maximum-user-count-exceeded':
        return 'O número máximo permitido de usuários a serem importados foi excedido.';
      case 'missing-hash-algorithm':
        return 'É necessário fornecer o algoritmo de geração de HASH e seus parâmetros para importar usuários.';
      case 'missing-uid':
        return 'Um identificador é necessário para a operação atual.';
      case 'reserved-claims':
        return 'Uma ou mais propriedades personalizadas fornecidas usaram palavras reservadas.';
      case 'session-cookie-revoked':
        return 'O COOKIE da sessão perdeu a validade.';
      case 'uid-alread-exists':
        return 'O indentificador fornecido já está em uso.';
      case 'email-already-exists':
        return 'O e-mail fornecido já está em uso.';
      case 'phone-number-already-exists':
        return 'O telefone fornecido já está em uso.';
      case 'project-not-found':
        return 'Nenhum projeto foi encontrado.';
      case 'insufficient-permission':
        return 'A credencial utilizada não tem permissão para acessar o recurso solicitado.';
      case 'internal-error':
        return 'O servidor de autenticação encontrou um erro inesperado ao tentar processar a solicitação.';
      default:
        return '';
    }
  }
}
