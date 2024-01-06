class UnityWallet {
  double bnbInGame;
  double tdxInGame;
  double busdInGame;

  UnityWallet({this.bnbInGame = 0, this.busdInGame = 0, this.tdxInGame = 0});

  Map<String, dynamic> toJson(double emerald) => {
    "zboom_ingame": emerald,
    "tdx_ingame": tdxInGame,
    "bnb_ingame": bnbInGame,
    "busd_ingame": busdInGame
  };
}