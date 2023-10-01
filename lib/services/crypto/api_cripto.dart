import 'package:izobility_mobile/services/crypto/contracts.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_ffi.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_lib.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class ApiCripto {
  static final clientBSC = Web3Client(
    'https://bsc-dataseed.binance.org/',
    Client(),
  );
  static const chainIdBSC = 56;

  Future<dynamic> getUserEmeraldBill(
    HDWallet wallet,
  ) async {
    final abi = ContractAbi.fromJson(
      await rootBundle.loadString('assets/abi/emerald_abi.json'),
      'count',
    );

    DeployedContract contract = DeployedContract(
      abi,
      EthereumAddress.fromHex(Contracts.emerald),
    );

    Token token = Token(contract, clientBSC, chainIdBSC);

    final res = await token.read(
      contract.function('balanceOf'),
      [
        EthereumAddress.fromHex(
            wallet.getAddressForCoin(TWCoinType.TWCoinTypeSmartChain)),
      ],
      null,
    );
    print('-' * 10);
    print(res);
    print('-' * 10);
    return res[0].toInt();
  }

  Future<dynamic> sendEmeraldTo() async {}

  Future<dynamic> somethingElse() async {}
}

class Token extends GeneratedContract {
  Token(
    DeployedContract self,
    Web3Client client,
    int? chainId,
  ) : super(self, client, chainId);
}
