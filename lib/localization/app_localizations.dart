import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh')
  ];

  /// No description provided for @objects.
  ///
  /// In en, this message translates to:
  /// **'- objects'**
  String get objects;

  /// No description provided for @incorrect_code.
  ///
  /// In en, this message translates to:
  /// **'* Incorrect code'**
  String get incorrect_code;

  /// No description provided for @incorrect_email.
  ///
  /// In en, this message translates to:
  /// **'* The mail is incorrect'**
  String get incorrect_email;

  /// No description provided for @two_fa.
  ///
  /// In en, this message translates to:
  /// **'2FA two -factor authentication'**
  String get two_fa;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @promotion.
  ///
  /// In en, this message translates to:
  /// **'Promotion'**
  String get promotion;

  /// No description provided for @without_phone_not_more_functions.
  ///
  /// In en, this message translates to:
  /// **'Without confirming the phone number, you will not have access to many applications'**
  String get without_phone_not_more_functions;

  /// No description provided for @safety.
  ///
  /// In en, this message translates to:
  /// **'Safety'**
  String get safety;

  /// No description provided for @exchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'IN'**
  String get to;

  /// No description provided for @your_profile_indicate_id.
  ///
  /// In en, this message translates to:
  /// **'Your profile will indicate ID *user576767'**
  String get your_profile_indicate_id;

  /// No description provided for @your_balance_smaller.
  ///
  /// In en, this message translates to:
  /// **'Your balance is smaller'**
  String get your_balance_smaller;

  /// No description provided for @your_access_code.
  ///
  /// In en, this message translates to:
  /// **'Your access code'**
  String get your_access_code;

  /// No description provided for @your_promo.
  ///
  /// In en, this message translates to:
  /// **'Your promo code'**
  String get your_promo;

  /// No description provided for @your_mail.
  ///
  /// In en, this message translates to:
  /// **'Your mail'**
  String get your_mail;

  /// No description provided for @your_amount_is.
  ///
  /// In en, this message translates to:
  /// **'Your amount in'**
  String get your_amount_is;

  /// No description provided for @your_name.
  ///
  /// In en, this message translates to:
  /// **'your name'**
  String get your_name;

  /// No description provided for @your_goods_and_all_backbone.
  ///
  /// In en, this message translates to:
  /// **'Your goods and all the backbone'**
  String get your_goods_and_all_backbone;

  /// No description provided for @enter_seed.
  ///
  /// In en, this message translates to:
  /// **'Enter Seed-Phot'**
  String get enter_seed;

  /// No description provided for @turn_on_nfc_ny_attach_card.
  ///
  /// In en, this message translates to:
  /// **'Turn on nfc \n and attach the card'**
  String get turn_on_nfc_ny_attach_card;

  /// No description provided for @turn_on_nfc.
  ///
  /// In en, this message translates to:
  /// **'Turn on NFC'**
  String get turn_on_nfc;

  /// No description provided for @to_come_in.
  ///
  /// In en, this message translates to:
  /// **'To come in'**
  String get to_come_in;

  /// No description provided for @enter_seed_phrase.
  ///
  /// In en, this message translates to:
  /// **'Enter by seed-phrase'**
  String get enter_seed_phrase;

  /// No description provided for @auth_by_seed.
  ///
  /// In en, this message translates to:
  /// **'Enter the Seed-Phot'**
  String get auth_by_seed;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @entance_emerald.
  ///
  /// In en, this message translates to:
  /// **'Entrance to Emerald'**
  String get entance_emerald;

  /// No description provided for @you_cannot_change_of_empty.
  ///
  /// In en, this message translates to:
  /// **'You cannot change the name of the empty'**
  String get you_cannot_change_of_empty;

  /// No description provided for @you_send.
  ///
  /// In en, this message translates to:
  /// **'You will send'**
  String get you_send;

  /// No description provided for @you_get.
  ///
  /// In en, this message translates to:
  /// **'You\'ll get'**
  String get you_get;

  /// No description provided for @confirm_logout.
  ///
  /// In en, this message translates to:
  /// **'Do you definitely want to go out?'**
  String get confirm_logout;

  /// No description provided for @choose_from_gallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from the gallery'**
  String get choose_from_gallery;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Go out'**
  String get logout;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get main;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Further'**
  String get next;

  /// No description provided for @account_data.
  ///
  /// In en, this message translates to:
  /// **'Account data'**
  String get account_data;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get birthday;

  /// No description provided for @it_nesessary_to_get_it.
  ///
  /// In en, this message translates to:
  /// **'It is necessary to get it'**
  String get it_nesessary_to_get_it;

  /// No description provided for @have_to_get.
  ///
  /// In en, this message translates to:
  /// **'For receipt is not going'**
  String get have_to_get;

  /// No description provided for @welcome_to_emerald.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Emerald Verse! \n \n Abstat you can play augmented reality and find cryptocoons and nft, which can be exchanged for gifts or sell on the stock market. \nite coins from Emerald Verse and exchange \ny for amazing NFT goods with augmented reality In the souvenir store. \n \nemorald Verse, these are AR games, loyalty programs, city quests and wow effects in augmented reality. \n \njit at home, in institutions or \ngorod, find the effects of augmented reality on the packaging of goods and In supermarkets. \n \n, shake coins with each other, exchange them for gifts in a prize store and participate in competitions.'**
  String get welcome_to_emerald;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @another.
  ///
  /// In en, this message translates to:
  /// **'Another'**
  String get another;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @there_are_still_contacts.
  ///
  /// In en, this message translates to:
  /// **'There are still no contracts'**
  String get there_are_still_contacts;

  /// No description provided for @woman.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get woman;

  /// No description provided for @gaming.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get gaming;

  /// No description provided for @game.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get game;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'from'**
  String get from;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @loose_data.
  ///
  /// In en, this message translates to:
  /// **'Otherwise you will lose the changes you have made'**
  String get loose_data;

  /// No description provided for @inventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// No description provided for @use.
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get use;

  /// No description provided for @story.
  ///
  /// In en, this message translates to:
  /// **'Story'**
  String get story;

  /// No description provided for @no_enough.
  ///
  /// In en, this message translates to:
  /// **'It seems that something is missing here!'**
  String get no_enough;

  /// No description provided for @cards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cards;

  /// No description provided for @code_is_wrong.
  ///
  /// In en, this message translates to:
  /// **'The code is wrong'**
  String get code_is_wrong;

  /// No description provided for @try_wrong_code_again.
  ///
  /// In en, this message translates to:
  /// **'Try the wrong code again'**
  String get try_wrong_code_again;

  /// No description provided for @confirmation_code.
  ///
  /// In en, this message translates to:
  /// **'confirmation code'**
  String get confirmation_code;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @seto_commission.
  ///
  /// In en, this message translates to:
  /// **'Square Commission:'**
  String get seto_commission;

  /// No description provided for @currency_conversion.
  ///
  /// In en, this message translates to:
  /// **'Currency conversion'**
  String get currency_conversion;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @buy_coins.
  ///
  /// In en, this message translates to:
  /// **'Buy coins'**
  String get buy_coins;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @places.
  ///
  /// In en, this message translates to:
  /// **'Places'**
  String get places;

  /// No description provided for @my.
  ///
  /// In en, this message translates to:
  /// **'My'**
  String get my;

  /// No description provided for @my_bank_cards.
  ///
  /// In en, this message translates to:
  /// **'My bank cards'**
  String get my_bank_cards;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get my_orders;

  /// No description provided for @my_pyrchases.
  ///
  /// In en, this message translates to:
  /// **'My purchases'**
  String get my_pyrchases;

  /// No description provided for @my_referals.
  ///
  /// In en, this message translates to:
  /// **'My abstracts'**
  String get my_referals;

  /// No description provided for @my_seed.
  ///
  /// In en, this message translates to:
  /// **'My seed-phrase'**
  String get my_seed;

  /// No description provided for @man.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get man;

  /// No description provided for @we_will_automatically_collect_data.
  ///
  /// In en, this message translates to:
  /// **'We will automatically collect the data and enter it'**
  String get we_will_automatically_collect_data;

  /// No description provided for @auth_code_sended.
  ///
  /// In en, this message translates to:
  /// **'We sent the code for authorization to the application'**
  String get auth_code_sended;

  /// No description provided for @we_sent_letter_to_restore_account.
  ///
  /// In en, this message translates to:
  /// **'We sent a letter to restore your account'**
  String get we_sent_letter_to_restore_account;

  /// No description provided for @on_exchange.
  ///
  /// In en, this message translates to:
  /// **'On the exchange'**
  String get on_exchange;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setting;

  /// No description provided for @inapproprivate_seed_phrase.
  ///
  /// In en, this message translates to:
  /// **'unfaithful seed-phrase'**
  String get inapproprivate_seed_phrase;

  /// No description provided for @main_incorrectly_introduced.
  ///
  /// In en, this message translates to:
  /// **'Mail is incorrectly introduced'**
  String get main_incorrectly_introduced;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @nickname.
  ///
  /// In en, this message translates to:
  /// **'Nick'**
  String get nickname;

  /// No description provided for @card_number.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get card_number;

  /// No description provided for @number_not_confirmed.
  ///
  /// In en, this message translates to:
  /// **'The number is not confirmed, so the functions of the internal wallet do not work'**
  String get number_not_confirmed;

  /// No description provided for @about_give_back.
  ///
  /// In en, this message translates to:
  /// **'About the return'**
  String get about_give_back;

  /// No description provided for @about_company.
  ///
  /// In en, this message translates to:
  /// **'About company'**
  String get about_company;

  /// No description provided for @about_app.
  ///
  /// In en, this message translates to:
  /// **'About the appendix'**
  String get about_app;

  /// No description provided for @about_sale.
  ///
  /// In en, this message translates to:
  /// **'About the action'**
  String get about_sale;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'Are common'**
  String get general;

  /// No description provided for @operation_with_coin.
  ///
  /// In en, this message translates to:
  /// **'Operation with a coin'**
  String get operation_with_coin;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @description_cryptocurrency.
  ///
  /// In en, this message translates to:
  /// **'The description of the cryptocurrency that supports the Binance Chain ecosystem.'**
  String get description_cryptocurrency;

  /// No description provided for @main_one.
  ///
  /// In en, this message translates to:
  /// **'The main one'**
  String get main_one;

  /// No description provided for @remain.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get remain;

  /// No description provided for @cencellation.
  ///
  /// In en, this message translates to:
  /// **'Cancellation'**
  String get cencellation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @send_again.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get send_again;

  /// No description provided for @sending_data.
  ///
  /// In en, this message translates to:
  /// **'Sending data'**
  String get sending_data;

  /// No description provided for @sending_data_for_analytics.
  ///
  /// In en, this message translates to:
  /// **'Sending data for analytics and improving the performance of the application'**
  String get sending_data_for_analytics;

  /// No description provided for @grades.
  ///
  /// In en, this message translates to:
  /// **'Assessments'**
  String get grades;

  /// No description provided for @erro.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get erro;

  /// No description provided for @translation_error.
  ///
  /// In en, this message translates to:
  /// **'translation error'**
  String get translation_error;

  /// No description provided for @error_on_server.
  ///
  /// In en, this message translates to:
  /// **'Error on the server ('**
  String get error_on_server;

  /// No description provided for @affiliate_program.
  ///
  /// In en, this message translates to:
  /// **'Affiliate program'**
  String get affiliate_program;

  /// No description provided for @personalization.
  ///
  /// In en, this message translates to:
  /// **'Personalization'**
  String get personalization;

  /// No description provided for @pincodes_not_mutch.
  ///
  /// In en, this message translates to:
  /// **'Pin codes do not match'**
  String get pincodes_not_mutch;

  /// No description provided for @repeat_access_code.
  ///
  /// In en, this message translates to:
  /// **'Repeat the access code'**
  String get repeat_access_code;

  /// No description provided for @gifts.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get gifts;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @confirm_phone.
  ///
  /// In en, this message translates to:
  /// **'Confirm the phone number'**
  String get confirm_phone;

  /// No description provided for @confim_your_identity.
  ///
  /// In en, this message translates to:
  /// **'Confirm your identity'**
  String get confim_your_identity;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmation_entrace.
  ///
  /// In en, this message translates to:
  /// **'Confirmation of the entrance or action in the application'**
  String get confirmation_entrace;

  /// No description provided for @number_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Number confirmation'**
  String get number_confirmation;

  /// No description provided for @congratulations_your_place_order.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! \n your order is placed !!'**
  String get congratulations_your_place_order;

  /// No description provided for @purchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchase;

  /// No description provided for @buying_order.
  ///
  /// In en, this message translates to:
  /// **'Buying an order'**
  String get buying_order;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get sex;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @get_money_for_invite.
  ///
  /// In en, this message translates to:
  /// **'Get money \n for invitations'**
  String get get_money_for_invite;

  /// No description provided for @get.
  ///
  /// In en, this message translates to:
  /// **'Get'**
  String get get;

  /// No description provided for @get_currency.
  ///
  /// In en, this message translates to:
  /// **'Get a %currency %'**
  String get get_currency;

  /// No description provided for @replenish.
  ///
  /// In en, this message translates to:
  /// **'Replenish'**
  String get replenish;

  /// No description provided for @try_later.
  ///
  /// In en, this message translates to:
  /// **'try later'**
  String get try_later;

  /// No description provided for @mail.
  ///
  /// In en, this message translates to:
  /// **'Mail'**
  String get mail;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @bind_new_punishment.
  ///
  /// In en, this message translates to:
  /// **'Bind a new punishment'**
  String get bind_new_punishment;

  /// No description provided for @exercise_password.
  ///
  /// In en, this message translates to:
  /// **'Exercise the password'**
  String get exercise_password;

  /// No description provided for @come_up_with_access_code.
  ///
  /// In en, this message translates to:
  /// **'Come up with an access code'**
  String get come_up_with_access_code;

  /// No description provided for @joined.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get joined;

  /// No description provided for @check_email.
  ///
  /// In en, this message translates to:
  /// **'Check the mail'**
  String get check_email;

  /// No description provided for @sale.
  ///
  /// In en, this message translates to:
  /// **'Sale'**
  String get sale;

  /// No description provided for @continue_.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

  /// No description provided for @promocode.
  ///
  /// In en, this message translates to:
  /// **'Promo code'**
  String get promocode;

  /// No description provided for @promo_codes.
  ///
  /// In en, this message translates to:
  /// **'Promo codes'**
  String get promo_codes;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @public_offer.
  ///
  /// In en, this message translates to:
  /// **'Public offer'**
  String get public_offer;

  /// No description provided for @push_notification.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get push_notification;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @placed.
  ///
  /// In en, this message translates to:
  /// **'Placed'**
  String get placed;

  /// No description provided for @profile_code.
  ///
  /// In en, this message translates to:
  /// **'Profile editing'**
  String get profile_code;

  /// No description provided for @reference_code.
  ///
  /// In en, this message translates to:
  /// **'Reference code'**
  String get reference_code;

  /// No description provided for @referrals.
  ///
  /// In en, this message translates to:
  /// **'Referrals'**
  String get referrals;

  /// No description provided for @abstract_programm.
  ///
  /// In en, this message translates to:
  /// **'Abstract program'**
  String get abstract_programm;

  /// No description provided for @referal_code.
  ///
  /// In en, this message translates to:
  /// **'Referral code'**
  String get referal_code;

  /// No description provided for @russian_ruble.
  ///
  /// In en, this message translates to:
  /// **'Russian ruble'**
  String get russian_ruble;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @swap.
  ///
  /// In en, this message translates to:
  /// **'Swap'**
  String get swap;

  /// No description provided for @to_make_photo.
  ///
  /// In en, this message translates to:
  /// **'To make a photo'**
  String get to_make_photo;

  /// No description provided for @sec.
  ///
  /// In en, this message translates to:
  /// **'sec'**
  String get sec;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @download_quantity.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get download_quantity;

  /// No description provided for @copulated.
  ///
  /// In en, this message translates to:
  /// **'Copulated!'**
  String get copulated;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @copy_code.
  ///
  /// In en, this message translates to:
  /// **'Copy the code'**
  String get copy_code;

  /// No description provided for @hide_name.
  ///
  /// In en, this message translates to:
  /// **'Hide the real name'**
  String get hide_name;

  /// No description provided for @events.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get events;

  /// No description provided for @creating_order.
  ///
  /// In en, this message translates to:
  /// **'Creating an order'**
  String get creating_order;

  /// No description provided for @create_wallet.
  ///
  /// In en, this message translates to:
  /// **'Create a wallet'**
  String get create_wallet;

  /// No description provided for @create_your_own_order.
  ///
  /// In en, this message translates to:
  /// **'Create your own order'**
  String get create_your_own_order;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @save_chages.
  ///
  /// In en, this message translates to:
  /// **'Save changes?'**
  String get save_chages;

  /// No description provided for @social_net_em.
  ///
  /// In en, this message translates to:
  /// **'Social networks Emerald'**
  String get social_net_em;

  /// No description provided for @validity.
  ///
  /// In en, this message translates to:
  /// **'Validity'**
  String get validity;

  /// No description provided for @standard_partner.
  ///
  /// In en, this message translates to:
  /// **'Standard partner'**
  String get standard_partner;

  /// No description provided for @sum.
  ///
  /// In en, this message translates to:
  /// **'Sum'**
  String get sum;

  /// No description provided for @current_balance.
  ///
  /// In en, this message translates to:
  /// **'Current balance'**
  String get current_balance;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Telephone'**
  String get phone;

  /// No description provided for @product_and_nft.
  ///
  /// In en, this message translates to:
  /// **'Products and NFT'**
  String get product_and_nft;

  /// No description provided for @tokens.
  ///
  /// In en, this message translates to:
  /// **'Tokens'**
  String get tokens;

  /// No description provided for @you_have.
  ///
  /// In en, this message translates to:
  /// **'You have'**
  String get you_have;

  /// No description provided for @you_have_no_puchases_yet.
  ///
  /// In en, this message translates to:
  /// **'You have no purchases yet! Correct :)'**
  String get you_have_no_puchases_yet;

  /// No description provided for @you_have_no_referrals.
  ///
  /// In en, this message translates to:
  /// **'You have no referrals yet :('**
  String get you_have_no_referrals;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification;

  /// No description provided for @notification_with_confidential_data.
  ///
  /// In en, this message translates to:
  /// **'Notifications with confidential data'**
  String get notification_with_confidential_data;

  /// No description provided for @smart_notification.
  ///
  /// In en, this message translates to:
  /// **'Smart notifications'**
  String get smart_notification;

  /// No description provided for @oops.
  ///
  /// In en, this message translates to:
  /// **'Oops...'**
  String get oops;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @success_verification.
  ///
  /// In en, this message translates to:
  /// **'Successful verification'**
  String get success_verification;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Successfully'**
  String get success;

  /// No description provided for @succedssfully_sent.
  ///
  /// In en, this message translates to:
  /// **'successfully sent'**
  String get succedssfully_sent;

  /// No description provided for @successfilly_we_return_to_input.
  ///
  /// In en, this message translates to:
  /// **'Successfully, we return to the input'**
  String get successfilly_we_return_to_input;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @read.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read;

  /// No description provided for @what_is_inside.
  ///
  /// In en, this message translates to:
  /// **'What is inside?'**
  String get what_is_inside;

  /// No description provided for @develop.
  ///
  /// In en, this message translates to:
  /// **'This functionality is under development! Our developers, designers and managers work 24/7 to roll out new chips!'**
  String get develop;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @apllication_languahe.
  ///
  /// In en, this message translates to:
  /// **'Application language'**
  String get apllication_languahe;

  /// No description provided for @ar_card.
  ///
  /// In en, this message translates to:
  /// **'AR card'**
  String get ar_card;

  /// No description provided for @ar_scanner.
  ///
  /// In en, this message translates to:
  /// **'Ar Scanner'**
  String get ar_scanner;

  /// No description provided for @er_qr_games.
  ///
  /// In en, this message translates to:
  /// **'AR, QR, Games, etc.'**
  String get er_qr_games;

  /// No description provided for @bsc_scan.
  ///
  /// In en, this message translates to:
  /// **'BSC Scan'**
  String get bsc_scan;

  /// No description provided for @qr_scanner.
  ///
  /// In en, this message translates to:
  /// **'QR scanner'**
  String get qr_scanner;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'ru', 'tr', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'ru': return AppLocalizationsRu();
    case 'tr': return AppLocalizationsTr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
