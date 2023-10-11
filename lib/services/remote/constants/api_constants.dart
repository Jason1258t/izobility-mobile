import 'package:izobility_mobile/services/crypto/contracts.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';

const int siteId = 2;

const String urlTikTOk =
    "https://www.tiktok.com/@emerald.verse?_t=8gEaWcOx2wM&_r=1";

const String urlTelegram = "https://t.me/emaraldverse_ru";

const String urlInstagram = "";

const String techWalletAddress = "0x96D5f5f85019bB53fDc0D0688b9dd9C9De483b3E";

Map<String, CoinTransferModel> coinsTransferData = {
  "21": CoinTransferModel(
      abiName: "emerald_abi",
      contract: Contracts.emerald,
      codename: "EMRLD",
      description: "",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcF4yF1AvmnftmrM6-j4kR9C3s1ltEI1KblTdbWAy5b6BQ7iwQ1VWt666FsHnt5TbQ8hU&usqp=CAU",
      name: "Emerald Token",
      rubleExchangeRate: "0"),
  "17": CoinTransferModel(
      abiName: "bcs-usd_abi",
      contract: Contracts.bsc,
      codename: "BSC-USD Token",
      description: "",
      imageUrl: "https://api.z-boom.ru/media/" +
          "moneta/82c4ba6cf8f75b0c30961bf817400ecf.jpg",
      name: "BSC-USD Token",
      rubleExchangeRate: "0"),
  "27": CoinTransferModel(
      abiName: "busd_abi",
      contract: Contracts.busd,
      codename: "BUSD",
      description: "",
      imageUrl: "https://api.z-boom.ru/media/" +
          "moneta/84986bfa3932e5f7a29730f5cea3e79a.jpg",
      name: "BUSD Token",
      rubleExchangeRate: "0"),
  "29": CoinTransferModel(
      abiName: "tidex_abi",
      contract: Contracts.tidex,
      codename: "TDX",
      description: "",
      imageUrl: "https://api.z-boom.ru/media/" +
          "moneta/0185ad603f8283bada84f8e63e616b5b.jpg",
      name: "Tidex Token",
      rubleExchangeRate: "0"),
  "36": CoinTransferModel(
      abiName: "most_abi",
      contract: Contracts.most,
      codename: "MOST",
      description: "",
      imageUrl: "https://api.z-boom.ru/media/" +
          "moneta/fcc5ac35a6a7e4650e22ed18ce9de54a.jpg",
      name: "MOST Token",
      rubleExchangeRate: "0")
};

class CoinTransferModel {
  final String contract;

  final String abiName;

  final String name;

  final String codename;

  final String imageUrl;

  final String rubleExchangeRate;

  final String description;

  CoinTransferModel(
      {required this.contract,
      required this.abiName,
      required this.name,
      required this.codename,
      required this.imageUrl,
      required this.rubleExchangeRate,
      required this.description});
}
