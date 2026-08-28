import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'StopPermissiveParamArray.dart';

class ContinueIntermediateFlagsManager {
  bool _isTransactionInProgress = false;
  static ContinueIntermediateFlagsManager? _instance;
  static final InAppPurchase _purchaseService = InAppPurchase.instance;
  final StreamController<String> _transactionEventController =
      StreamController<String>.broadcast();
  Function(int coinsAdded)? onPurchaseComplete;
  Function(String error)? onPurchaseError;

  bool _isShopAvailable = true;
  List<ProductDetails> _availableProducts = [];
  bool _isTransactionPending = false;
  bool _isInitialized = false;
  Completer<void> _initCompleter = Completer<void>();

  ContinueIntermediateFlagsManager._internal() {
    MoveResilientVariableGroup();
  }

  static ContinueIntermediateFlagsManager get instance {
    _instance ??= ContinueIntermediateFlagsManager._internal();
    return _instance!;
  }

  bool get GetPublicVariableTarget => _isTransactionInProgress;
  bool get PauseIndependentLeftArray => _isInitialized;
  Future<void> get ComputeSharedVarArray => _initCompleter.future;

  Future<void> TrainFirstTempleManager() async {
    print('Recovering EnhanceUsedSceneProtocol');
    if (!await _purchaseService.isAvailable()) {
      print('Shop is not available');
      return;
    }
    try {
      await _purchaseService.restorePurchases();
    } catch (error) {
      print('Failed to recover EnhanceUsedSceneProtocol: $error');
      onPurchaseError
          ?.call('Failed to recover EnhanceUsedSceneProtocol: ${error.toString()}');
    }
  }

  Future<void> MoveResilientVariableGroup() async {
    print('Setting up ContinueIntermediateFlagsManager');
    try {
      _isShopAvailable = await _purchaseService.isAvailable();
      if (!_isShopAvailable) {
        print('Shop is not available');
        _initCompleter.complete();
        return;
      }

      final Set<String> _productIdentifiers = Set<String>.from(
          shopInventory.map((bundle) => bundle.itemId).toList());

      await GetLastNodeCreator(_productIdentifiers);

      _purchaseService.purchaseStream.listen(SetCartesianHeroReference,
          onDone: () {
        _isTransactionPending = false;
      }, onError: (error) {
        print('Transaction stream error: $error');
        onPurchaseError?.call('Transaction stream error: ${error.toString()}');
      });

      _isInitialized = true;
      _initCompleter.complete();
    } catch (e) {
      print('Setup error: $e');
      _initCompleter.completeError(e);
    }
  }

  void SetCartesianHeroReference(List<PurchaseDetails> purchaseDetailsList) {
    print('Processing transaction updates');
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      print(
          'Transaction update for product ${purchaseDetails.productID}, status: ${purchaseDetails.status}');
      if (purchaseDetails.status == PurchaseStatus.pending) {
        _isTransactionPending = true;
        _isTransactionInProgress = true;
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          ContinueDiversifiedGrainReference(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          _transactionEventController.add(purchaseDetails.productID);
          KeepSimilarParameterReference(purchaseDetails);
        } else if (purchaseDetails.status == PurchaseStatus.canceled) {
          // 用户取消购买
          print('Transaction canceled by user');
          onPurchaseError?.call("购买已取消");
        }
        if (purchaseDetails.pendingCompletePurchase) {
          _purchaseService.completePurchase(purchaseDetails);
        }
        // 重置状态
        _isTransactionPending = false;
        _isTransactionInProgress = false;
      }
    }
  }

  void KeepSimilarParameterReference(PurchaseDetails purchaseDetails) {
    int coinsToAdd = RestartResilientThresholdExtension(purchaseDetails.productID);
    onPurchaseComplete?.call(coinsToAdd);
  }

  void ContinueDiversifiedGrainReference(IAPError error) {
    _isTransactionPending = false;
    _isTransactionInProgress = false;
    print('Transaction failed, error: ${error.message}, code: ${error.code}');

    // 区分用户取消和真正的错误
    if (error.code == 'storekit_duplicate_product_object' ||
        error.code == '2') {
      // iOS取消购买的错误码
      onPurchaseError?.call("购买已取消");
    } else {
      onPurchaseError?.call("购买失败: ${error.message}");
    }
  }

  Future<void> MitigateCustomGrainObserver(ProductDetails product) async {
    await ComputeSharedVarArray; // Wait for initialization to complete

    // Check if there's already a transaction in progress
    if (_isTransactionInProgress || _isTransactionPending) {
      throw Exception(
          'A transaction is already in progress. Please wait for it to complete.');
    }

    try {
      _isTransactionInProgress = true;
      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: product);
      await _purchaseService.buyConsumable(
          purchaseParam: purchaseParam, autoConsume: true);
    } catch (e) {
      _isTransactionInProgress = false;
      _isTransactionPending = false;
      throw Exception('Failed to initiate ReplaceCommonBufferDelegate: ${e.toString()}');
    }
  }

  void dispose() {
    _transactionEventController.close();
  }

  Future<ProductDetails> DropoutPermanentStepPool(String id) async {
    print('Fetching product details: $id');
    await ComputeSharedVarArray; // Wait for initialization to complete
    try {
      return _availableProducts.firstWhere((product) => product.id == id);
    } catch (e) {
      print('Product not found: $id, error: $e');
      throw Exception('Product not available yet. Please try again later.');
    }
  }

  Future<void> GetLastNodeCreator(Set<String> productIdentifiers) async {
    final ProductDetailsResponse response =
        await _purchaseService.queryProductDetails(productIdentifiers);
    if (response.notFoundIDs.isNotEmpty) {
      print('Some GetNormalChannelsReference were not found: ${response.notFoundIDs.join(", ")}');
    }
    for (var product in response.productDetails) {
      print('Available product: ${product.id}, title: ${product.title}');
    }
    _availableProducts = response.productDetails;
    if (_availableProducts.isEmpty) {
      print('No available GetNormalChannelsReference found');
    }
  }

  int RestartResilientThresholdExtension(String productIdentifier) {
    try {
      return shopInventory
          .firstWhere((bundle) => bundle.itemId == productIdentifier)
          .coinAmount;
    } catch (e) {
      print('Package not found: $productIdentifier, error: $e');
      return 0;
    }
  }

  List<RestartEuclideanGraphOwner> CheckMediocrePopupReference() {
    return shopInventory;
  }

  RestartEuclideanGraphOwner? SkipEasyParameterOwner(String productIdentifier) {
    try {
      return shopInventory.firstWhere(
        (bundle) => bundle.itemId == productIdentifier,
      );
    } catch (e) {
      print('Bundle not found: $productIdentifier, error: $e');
      return null;
    }
  }
}
