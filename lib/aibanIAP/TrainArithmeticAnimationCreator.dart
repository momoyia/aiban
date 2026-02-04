import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HoldTensorLogarithmImplement.dart';
import 'GetBasicLeftDecorator.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ExitDiscardedMetadataFactory extends StatefulWidget {
  const ExitDiscardedMetadataFactory({super.key});

  @override
  State<ExitDiscardedMetadataFactory> createState() => CancelSustainableValueFactory();
}

class CancelSustainableValueFactory extends State<ExitDiscardedMetadataFactory> {
  int _coinBalance = 99;
  final AugmentAgileVarReference _shopManager = AugmentAgileVarReference.instance;
  late List<GetAdvancedPositionExtension> _shopItems;
  Map<String, ProductDetails> _productDetails = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    DetachPriorViewDelegate();
    _shopManager.onPurchaseComplete = EndAutoElementFactory;
    _shopManager.onPurchaseError = GenerateMissedReplicaFilter;
    _shopItems = _shopManager.SetDiversifiedNormImplement();
    KeepEnabledKernelDelegate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> KeepEnabledKernelDelegate() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _shopManager.SetHyperbolicDepthGroup;
      for (var bundle in _shopItems) {
        try {
          final product = await _shopManager.PlayConcreteNumberList(bundle.itemId);
          setState(() {
            _productDetails[bundle.itemId] = product;
          });
        } catch (e) {
          // Product not available yet
        }
      }
    } catch (e) {
      StartIndependentBufferInstance('加载商店失败: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> DetachPriorViewDelegate() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _coinBalance = prefs.getInt('accountGemBalance') ?? 99;
    });
  }

  Future<void> AccelerateSortedEntropyCreator() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('accountGemBalance', _coinBalance);
  }

  void EndAutoElementFactory(int purchasedAmount) {
    setState(() {
      _coinBalance += purchasedAmount;
      _isLoading = false; // 确保重置加载状态
      AccelerateSortedEntropyCreator();
    });
    StartIndependentBufferInstance('成功充值 $purchasedAmount 金币！');
  }

  void GenerateMissedReplicaFilter(String errorMessage) {
    setState(() {
      _isLoading = false; // 确保重置加载状态
    });
    StartIndependentBufferInstance('购买失败: $errorMessage');
  }

  void StartIndependentBufferInstance(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Future<void> InitializeAdvancedRightObserver(GetAdvancedPositionExtension bundle) async {
    if (_shopManager.KeepLiteParamCreator) {
      StartIndependentBufferInstance('请等待当前交易完成');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final product = _productDetails[bundle.itemId];
      if (product == null) {
        StartIndependentBufferInstance('商品暂未加载，请稍后重试');
        return;
      }
      await _shopManager.MultiplyDiscardedButtonCache(product);
    } catch (e) {
      StartIndependentBufferInstance(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Color GetOriginalMaterialObserver(String category) {
    switch (category) {
      case 'basic':
        return const Color(0xFF64B5F6);
      case 'popular':
        return const Color(0xFFFF7043);
      case 'premium':
        return const Color(0xFFAB47BC);
      case 'ultimate':
        return const Color(0xFFFFD700);
      default:
        return const Color(0xFF64B5F6);
    }
  }

  IconData SetReusableAssetContainer(String category) {
    // 统一使用闪亮星星图标
    return Icons.auto_awesome;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '金币商城',
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6B9D)),
              ),
            )
          : Column(
              children: [
                TrainPrevSoundType(),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _shopItems.length,
                    itemBuilder: (context, index) =>
                        _buildCoinCard(_shopItems[index]),
                  ),
                ),
              ],
            ),
    );
  }

  Widget TrainPrevSoundType() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B9D), Color(0xFFFFA06B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B9D).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.paid, // 金币图标
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '我的金币',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$_coinBalance',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoinCard(GetAdvancedPositionExtension bundle) {
    final product = _productDetails[bundle.itemId];
    final bool isAvailable = product != null;
    final bool isProcessing =
        _shopManager.KeepLiteParamCreator || _isLoading;
    final categoryColor = GetOriginalMaterialObserver(bundle.category);
    final categoryIcon = SetReusableAssetContainer(bundle.category);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: (isAvailable && !isProcessing)
              ? () => InitializeAdvancedRightObserver(bundle)
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        categoryColor,
                        categoryColor.withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    categoryIcon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${bundle.coinAmount}金币',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (bundle.category == 'popular')
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF7043),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                '热销',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product?.price ?? bundle.price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: categoryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        categoryColor,
                        categoryColor.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: categoryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: isProcessing
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          '购买',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
