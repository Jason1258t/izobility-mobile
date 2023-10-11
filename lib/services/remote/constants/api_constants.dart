import 'package:izobility_mobile/services/crypto/contracts.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';

const int siteId = 2;

const String urlTikTOk =
    "https://www.tiktok.com/@emerald.verse?_t=8gEaWcOx2wM&_r=1";

const String urlTelegram = "https://t.me/emaraldverse_ru";

const String urlInstagram = "";

const String techWalletAddress = "0x96D5f5f85019bB53fDc0D0688b9dd9C9De483b3E";

Map<String, CoinTransferModel> coinsTransferData = {
  "21": CoinTransferModel(abiName: "emerald_abi", contract: Contracts.emerald),
  "17": CoinTransferModel(abiName: "bcs-usd_abi", contract: Contracts.bsc),
  "27": CoinTransferModel(abiName: "busd_abi", contract: Contracts.busd),
  "29": CoinTransferModel(abiName: "tidex_abi", contract: Contracts.tidex),
  "36": CoinTransferModel(abiName: "most_abi", contract: Contracts.most)
};

class CoinTransferModel {
  final String contract;

  final String abiName;

  CoinTransferModel({required this.contract, required this.abiName});
}
