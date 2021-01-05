// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_helper.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class OrderDetailsTableData extends DataClass
    implements Insertable<OrderDetailsTableData> {
  final int quantity;
  final int totalPrice;
  final int orderID;
  final String custId;
  final String productName;
  final String productCategory;
  final String productDesc;
  final bool isDelivered;
  final int price;
  final String category;
  final String imageURL;
  OrderDetailsTableData(
      {@required this.quantity,
      @required this.totalPrice,
      @required this.orderID,
      @required this.custId,
      @required this.productName,
      @required this.productCategory,
      @required this.productDesc,
      @required this.isDelivered,
      @required this.price,
      @required this.category,
      @required this.imageURL});
  factory OrderDetailsTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return OrderDetailsTableData(
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      totalPrice: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_price']),
      orderID:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}order_i_d']),
      custId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}cust_id']),
      productName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name']),
      productCategory: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_category']),
      productDesc: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_desc']),
      isDelivered: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_delivered']),
      price: intType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      imageURL: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_u_r_l']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || totalPrice != null) {
      map['total_price'] = Variable<int>(totalPrice);
    }
    if (!nullToAbsent || orderID != null) {
      map['order_i_d'] = Variable<int>(orderID);
    }
    if (!nullToAbsent || custId != null) {
      map['cust_id'] = Variable<String>(custId);
    }
    if (!nullToAbsent || productName != null) {
      map['product_name'] = Variable<String>(productName);
    }
    if (!nullToAbsent || productCategory != null) {
      map['product_category'] = Variable<String>(productCategory);
    }
    if (!nullToAbsent || productDesc != null) {
      map['product_desc'] = Variable<String>(productDesc);
    }
    if (!nullToAbsent || isDelivered != null) {
      map['is_delivered'] = Variable<bool>(isDelivered);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || imageURL != null) {
      map['image_u_r_l'] = Variable<String>(imageURL);
    }
    return map;
  }

  OrderDetailsTableCompanion toCompanion(bool nullToAbsent) {
    return OrderDetailsTableCompanion(
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      totalPrice: totalPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(totalPrice),
      orderID: orderID == null && nullToAbsent
          ? const Value.absent()
          : Value(orderID),
      custId:
          custId == null && nullToAbsent ? const Value.absent() : Value(custId),
      productName: productName == null && nullToAbsent
          ? const Value.absent()
          : Value(productName),
      productCategory: productCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(productCategory),
      productDesc: productDesc == null && nullToAbsent
          ? const Value.absent()
          : Value(productDesc),
      isDelivered: isDelivered == null && nullToAbsent
          ? const Value.absent()
          : Value(isDelivered),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      imageURL: imageURL == null && nullToAbsent
          ? const Value.absent()
          : Value(imageURL),
    );
  }

  factory OrderDetailsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OrderDetailsTableData(
      quantity: serializer.fromJson<int>(json['quantity']),
      totalPrice: serializer.fromJson<int>(json['totalPrice']),
      orderID: serializer.fromJson<int>(json['orderID']),
      custId: serializer.fromJson<String>(json['custId']),
      productName: serializer.fromJson<String>(json['productName']),
      productCategory: serializer.fromJson<String>(json['productCategory']),
      productDesc: serializer.fromJson<String>(json['productDesc']),
      isDelivered: serializer.fromJson<bool>(json['isDelivered']),
      price: serializer.fromJson<int>(json['price']),
      category: serializer.fromJson<String>(json['category']),
      imageURL: serializer.fromJson<String>(json['imageURL']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'quantity': serializer.toJson<int>(quantity),
      'totalPrice': serializer.toJson<int>(totalPrice),
      'orderID': serializer.toJson<int>(orderID),
      'custId': serializer.toJson<String>(custId),
      'productName': serializer.toJson<String>(productName),
      'productCategory': serializer.toJson<String>(productCategory),
      'productDesc': serializer.toJson<String>(productDesc),
      'isDelivered': serializer.toJson<bool>(isDelivered),
      'price': serializer.toJson<int>(price),
      'category': serializer.toJson<String>(category),
      'imageURL': serializer.toJson<String>(imageURL),
    };
  }

  OrderDetailsTableData copyWith(
          {int quantity,
          int totalPrice,
          int orderID,
          String custId,
          String productName,
          String productCategory,
          String productDesc,
          bool isDelivered,
          int price,
          String category,
          String imageURL}) =>
      OrderDetailsTableData(
        quantity: quantity ?? this.quantity,
        totalPrice: totalPrice ?? this.totalPrice,
        orderID: orderID ?? this.orderID,
        custId: custId ?? this.custId,
        productName: productName ?? this.productName,
        productCategory: productCategory ?? this.productCategory,
        productDesc: productDesc ?? this.productDesc,
        isDelivered: isDelivered ?? this.isDelivered,
        price: price ?? this.price,
        category: category ?? this.category,
        imageURL: imageURL ?? this.imageURL,
      );
  @override
  String toString() {
    return (StringBuffer('OrderDetailsTableData(')
          ..write('quantity: $quantity, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('orderID: $orderID, ')
          ..write('custId: $custId, ')
          ..write('productName: $productName, ')
          ..write('productCategory: $productCategory, ')
          ..write('productDesc: $productDesc, ')
          ..write('isDelivered: $isDelivered, ')
          ..write('price: $price, ')
          ..write('category: $category, ')
          ..write('imageURL: $imageURL')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      quantity.hashCode,
      $mrjc(
          totalPrice.hashCode,
          $mrjc(
              orderID.hashCode,
              $mrjc(
                  custId.hashCode,
                  $mrjc(
                      productName.hashCode,
                      $mrjc(
                          productCategory.hashCode,
                          $mrjc(
                              productDesc.hashCode,
                              $mrjc(
                                  isDelivered.hashCode,
                                  $mrjc(
                                      price.hashCode,
                                      $mrjc(category.hashCode,
                                          imageURL.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OrderDetailsTableData &&
          other.quantity == this.quantity &&
          other.totalPrice == this.totalPrice &&
          other.orderID == this.orderID &&
          other.custId == this.custId &&
          other.productName == this.productName &&
          other.productCategory == this.productCategory &&
          other.productDesc == this.productDesc &&
          other.isDelivered == this.isDelivered &&
          other.price == this.price &&
          other.category == this.category &&
          other.imageURL == this.imageURL);
}

class OrderDetailsTableCompanion
    extends UpdateCompanion<OrderDetailsTableData> {
  final Value<int> quantity;
  final Value<int> totalPrice;
  final Value<int> orderID;
  final Value<String> custId;
  final Value<String> productName;
  final Value<String> productCategory;
  final Value<String> productDesc;
  final Value<bool> isDelivered;
  final Value<int> price;
  final Value<String> category;
  final Value<String> imageURL;
  const OrderDetailsTableCompanion({
    this.quantity = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.orderID = const Value.absent(),
    this.custId = const Value.absent(),
    this.productName = const Value.absent(),
    this.productCategory = const Value.absent(),
    this.productDesc = const Value.absent(),
    this.isDelivered = const Value.absent(),
    this.price = const Value.absent(),
    this.category = const Value.absent(),
    this.imageURL = const Value.absent(),
  });
  OrderDetailsTableCompanion.insert({
    @required int quantity,
    @required int totalPrice,
    this.orderID = const Value.absent(),
    @required String custId,
    @required String productName,
    @required String productCategory,
    @required String productDesc,
    this.isDelivered = const Value.absent(),
    @required int price,
    @required String category,
    @required String imageURL,
  })  : quantity = Value(quantity),
        totalPrice = Value(totalPrice),
        custId = Value(custId),
        productName = Value(productName),
        productCategory = Value(productCategory),
        productDesc = Value(productDesc),
        price = Value(price),
        category = Value(category),
        imageURL = Value(imageURL);
  static Insertable<OrderDetailsTableData> custom({
    Expression<int> quantity,
    Expression<int> totalPrice,
    Expression<int> orderID,
    Expression<String> custId,
    Expression<String> productName,
    Expression<String> productCategory,
    Expression<String> productDesc,
    Expression<bool> isDelivered,
    Expression<int> price,
    Expression<String> category,
    Expression<String> imageURL,
  }) {
    return RawValuesInsertable({
      if (quantity != null) 'quantity': quantity,
      if (totalPrice != null) 'total_price': totalPrice,
      if (orderID != null) 'order_i_d': orderID,
      if (custId != null) 'cust_id': custId,
      if (productName != null) 'product_name': productName,
      if (productCategory != null) 'product_category': productCategory,
      if (productDesc != null) 'product_desc': productDesc,
      if (isDelivered != null) 'is_delivered': isDelivered,
      if (price != null) 'price': price,
      if (category != null) 'category': category,
      if (imageURL != null) 'image_u_r_l': imageURL,
    });
  }

  OrderDetailsTableCompanion copyWith(
      {Value<int> quantity,
      Value<int> totalPrice,
      Value<int> orderID,
      Value<String> custId,
      Value<String> productName,
      Value<String> productCategory,
      Value<String> productDesc,
      Value<bool> isDelivered,
      Value<int> price,
      Value<String> category,
      Value<String> imageURL}) {
    return OrderDetailsTableCompanion(
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      orderID: orderID ?? this.orderID,
      custId: custId ?? this.custId,
      productName: productName ?? this.productName,
      productCategory: productCategory ?? this.productCategory,
      productDesc: productDesc ?? this.productDesc,
      isDelivered: isDelivered ?? this.isDelivered,
      price: price ?? this.price,
      category: category ?? this.category,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<int>(totalPrice.value);
    }
    if (orderID.present) {
      map['order_i_d'] = Variable<int>(orderID.value);
    }
    if (custId.present) {
      map['cust_id'] = Variable<String>(custId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productCategory.present) {
      map['product_category'] = Variable<String>(productCategory.value);
    }
    if (productDesc.present) {
      map['product_desc'] = Variable<String>(productDesc.value);
    }
    if (isDelivered.present) {
      map['is_delivered'] = Variable<bool>(isDelivered.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (imageURL.present) {
      map['image_u_r_l'] = Variable<String>(imageURL.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderDetailsTableCompanion(')
          ..write('quantity: $quantity, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('orderID: $orderID, ')
          ..write('custId: $custId, ')
          ..write('productName: $productName, ')
          ..write('productCategory: $productCategory, ')
          ..write('productDesc: $productDesc, ')
          ..write('isDelivered: $isDelivered, ')
          ..write('price: $price, ')
          ..write('category: $category, ')
          ..write('imageURL: $imageURL')
          ..write(')'))
        .toString();
  }
}

class $OrderDetailsTableTable extends OrderDetailsTable
    with TableInfo<$OrderDetailsTableTable, OrderDetailsTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrderDetailsTableTable(this._db, [this._alias]);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedIntColumn _quantity;
  @override
  GeneratedIntColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedIntColumn _constructQuantity() {
    return GeneratedIntColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalPriceMeta = const VerificationMeta('totalPrice');
  GeneratedIntColumn _totalPrice;
  @override
  GeneratedIntColumn get totalPrice => _totalPrice ??= _constructTotalPrice();
  GeneratedIntColumn _constructTotalPrice() {
    return GeneratedIntColumn(
      'total_price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _orderIDMeta = const VerificationMeta('orderID');
  GeneratedIntColumn _orderID;
  @override
  GeneratedIntColumn get orderID => _orderID ??= _constructOrderID();
  GeneratedIntColumn _constructOrderID() {
    return GeneratedIntColumn('order_i_d', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _custIdMeta = const VerificationMeta('custId');
  GeneratedTextColumn _custId;
  @override
  GeneratedTextColumn get custId => _custId ??= _constructCustId();
  GeneratedTextColumn _constructCustId() {
    return GeneratedTextColumn(
      'cust_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  GeneratedTextColumn _productName;
  @override
  GeneratedTextColumn get productName =>
      _productName ??= _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn(
      'product_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productCategoryMeta =
      const VerificationMeta('productCategory');
  GeneratedTextColumn _productCategory;
  @override
  GeneratedTextColumn get productCategory =>
      _productCategory ??= _constructProductCategory();
  GeneratedTextColumn _constructProductCategory() {
    return GeneratedTextColumn(
      'product_category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _productDescMeta =
      const VerificationMeta('productDesc');
  GeneratedTextColumn _productDesc;
  @override
  GeneratedTextColumn get productDesc =>
      _productDesc ??= _constructProductDesc();
  GeneratedTextColumn _constructProductDesc() {
    return GeneratedTextColumn(
      'product_desc',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isDeliveredMeta =
      const VerificationMeta('isDelivered');
  GeneratedBoolColumn _isDelivered;
  @override
  GeneratedBoolColumn get isDelivered =>
      _isDelivered ??= _constructIsDelivered();
  GeneratedBoolColumn _constructIsDelivered() {
    return GeneratedBoolColumn('is_delivered', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedIntColumn _price;
  @override
  GeneratedIntColumn get price => _price ??= _constructPrice();
  GeneratedIntColumn _constructPrice() {
    return GeneratedIntColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageURLMeta = const VerificationMeta('imageURL');
  GeneratedTextColumn _imageURL;
  @override
  GeneratedTextColumn get imageURL => _imageURL ??= _constructImageURL();
  GeneratedTextColumn _constructImageURL() {
    return GeneratedTextColumn(
      'image_u_r_l',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        quantity,
        totalPrice,
        orderID,
        custId,
        productName,
        productCategory,
        productDesc,
        isDelivered,
        price,
        category,
        imageURL
      ];
  @override
  $OrderDetailsTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'order_details_table';
  @override
  final String actualTableName = 'order_details_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OrderDetailsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price'], _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('order_i_d')) {
      context.handle(_orderIDMeta,
          orderID.isAcceptableOrUnknown(data['order_i_d'], _orderIDMeta));
    }
    if (data.containsKey('cust_id')) {
      context.handle(_custIdMeta,
          custId.isAcceptableOrUnknown(data['cust_id'], _custIdMeta));
    } else if (isInserting) {
      context.missing(_custIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name'], _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_category')) {
      context.handle(
          _productCategoryMeta,
          productCategory.isAcceptableOrUnknown(
              data['product_category'], _productCategoryMeta));
    } else if (isInserting) {
      context.missing(_productCategoryMeta);
    }
    if (data.containsKey('product_desc')) {
      context.handle(
          _productDescMeta,
          productDesc.isAcceptableOrUnknown(
              data['product_desc'], _productDescMeta));
    } else if (isInserting) {
      context.missing(_productDescMeta);
    }
    if (data.containsKey('is_delivered')) {
      context.handle(
          _isDeliveredMeta,
          isDelivered.isAcceptableOrUnknown(
              data['is_delivered'], _isDeliveredMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('image_u_r_l')) {
      context.handle(_imageURLMeta,
          imageURL.isAcceptableOrUnknown(data['image_u_r_l'], _imageURLMeta));
    } else if (isInserting) {
      context.missing(_imageURLMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {orderID};
  @override
  OrderDetailsTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OrderDetailsTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $OrderDetailsTableTable createAlias(String alias) {
    return $OrderDetailsTableTable(_db, alias);
  }
}

class PlanData extends DataClass implements Insertable<PlanData> {
  final String UID;
  final int timestamp;
  final String planID;
  final double enteredAmount;
  final double currentSlidervalue;
  final double firstEMI;
  final double nineMonthsEMI;
  final double lastEMI;
  final double totalPurchase;
  final double yourSavings;
  PlanData(
      {@required this.UID,
      @required this.timestamp,
      @required this.planID,
      @required this.enteredAmount,
      @required this.currentSlidervalue,
      @required this.firstEMI,
      @required this.nineMonthsEMI,
      @required this.lastEMI,
      @required this.totalPurchase,
      @required this.yourSavings});
  factory PlanData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return PlanData(
      UID: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uid']),
      timestamp:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      planID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}plan_i_d']),
      enteredAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}entered_amount']),
      currentSlidervalue: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}current_slidervalue']),
      firstEMI: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_e_m_i']),
      nineMonthsEMI: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}nine_months_e_m_i']),
      lastEMI: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_e_m_i']),
      totalPurchase: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_purchase']),
      yourSavings: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}your_savings']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || UID != null) {
      map['uid'] = Variable<String>(UID);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<int>(timestamp);
    }
    if (!nullToAbsent || planID != null) {
      map['plan_i_d'] = Variable<String>(planID);
    }
    if (!nullToAbsent || enteredAmount != null) {
      map['entered_amount'] = Variable<double>(enteredAmount);
    }
    if (!nullToAbsent || currentSlidervalue != null) {
      map['current_slidervalue'] = Variable<double>(currentSlidervalue);
    }
    if (!nullToAbsent || firstEMI != null) {
      map['first_e_m_i'] = Variable<double>(firstEMI);
    }
    if (!nullToAbsent || nineMonthsEMI != null) {
      map['nine_months_e_m_i'] = Variable<double>(nineMonthsEMI);
    }
    if (!nullToAbsent || lastEMI != null) {
      map['last_e_m_i'] = Variable<double>(lastEMI);
    }
    if (!nullToAbsent || totalPurchase != null) {
      map['total_purchase'] = Variable<double>(totalPurchase);
    }
    if (!nullToAbsent || yourSavings != null) {
      map['your_savings'] = Variable<double>(yourSavings);
    }
    return map;
  }

  PlanCompanion toCompanion(bool nullToAbsent) {
    return PlanCompanion(
      UID: UID == null && nullToAbsent ? const Value.absent() : Value(UID),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      planID:
          planID == null && nullToAbsent ? const Value.absent() : Value(planID),
      enteredAmount: enteredAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(enteredAmount),
      currentSlidervalue: currentSlidervalue == null && nullToAbsent
          ? const Value.absent()
          : Value(currentSlidervalue),
      firstEMI: firstEMI == null && nullToAbsent
          ? const Value.absent()
          : Value(firstEMI),
      nineMonthsEMI: nineMonthsEMI == null && nullToAbsent
          ? const Value.absent()
          : Value(nineMonthsEMI),
      lastEMI: lastEMI == null && nullToAbsent
          ? const Value.absent()
          : Value(lastEMI),
      totalPurchase: totalPurchase == null && nullToAbsent
          ? const Value.absent()
          : Value(totalPurchase),
      yourSavings: yourSavings == null && nullToAbsent
          ? const Value.absent()
          : Value(yourSavings),
    );
  }

  factory PlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlanData(
      UID: serializer.fromJson<String>(json['UID']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
      planID: serializer.fromJson<String>(json['planID']),
      enteredAmount: serializer.fromJson<double>(json['enteredAmount']),
      currentSlidervalue:
          serializer.fromJson<double>(json['currentSlidervalue']),
      firstEMI: serializer.fromJson<double>(json['firstEMI']),
      nineMonthsEMI: serializer.fromJson<double>(json['nineMonthsEMI']),
      lastEMI: serializer.fromJson<double>(json['lastEMI']),
      totalPurchase: serializer.fromJson<double>(json['totalPurchase']),
      yourSavings: serializer.fromJson<double>(json['yourSavings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'UID': serializer.toJson<String>(UID),
      'timestamp': serializer.toJson<int>(timestamp),
      'planID': serializer.toJson<String>(planID),
      'enteredAmount': serializer.toJson<double>(enteredAmount),
      'currentSlidervalue': serializer.toJson<double>(currentSlidervalue),
      'firstEMI': serializer.toJson<double>(firstEMI),
      'nineMonthsEMI': serializer.toJson<double>(nineMonthsEMI),
      'lastEMI': serializer.toJson<double>(lastEMI),
      'totalPurchase': serializer.toJson<double>(totalPurchase),
      'yourSavings': serializer.toJson<double>(yourSavings),
    };
  }

  PlanData copyWith(
          {String UID,
          int timestamp,
          String planID,
          double enteredAmount,
          double currentSlidervalue,
          double firstEMI,
          double nineMonthsEMI,
          double lastEMI,
          double totalPurchase,
          double yourSavings}) =>
      PlanData(
        UID: UID ?? this.UID,
        timestamp: timestamp ?? this.timestamp,
        planID: planID ?? this.planID,
        enteredAmount: enteredAmount ?? this.enteredAmount,
        currentSlidervalue: currentSlidervalue ?? this.currentSlidervalue,
        firstEMI: firstEMI ?? this.firstEMI,
        nineMonthsEMI: nineMonthsEMI ?? this.nineMonthsEMI,
        lastEMI: lastEMI ?? this.lastEMI,
        totalPurchase: totalPurchase ?? this.totalPurchase,
        yourSavings: yourSavings ?? this.yourSavings,
      );
  @override
  String toString() {
    return (StringBuffer('PlanData(')
          ..write('UID: $UID, ')
          ..write('timestamp: $timestamp, ')
          ..write('planID: $planID, ')
          ..write('enteredAmount: $enteredAmount, ')
          ..write('currentSlidervalue: $currentSlidervalue, ')
          ..write('firstEMI: $firstEMI, ')
          ..write('nineMonthsEMI: $nineMonthsEMI, ')
          ..write('lastEMI: $lastEMI, ')
          ..write('totalPurchase: $totalPurchase, ')
          ..write('yourSavings: $yourSavings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      UID.hashCode,
      $mrjc(
          timestamp.hashCode,
          $mrjc(
              planID.hashCode,
              $mrjc(
                  enteredAmount.hashCode,
                  $mrjc(
                      currentSlidervalue.hashCode,
                      $mrjc(
                          firstEMI.hashCode,
                          $mrjc(
                              nineMonthsEMI.hashCode,
                              $mrjc(
                                  lastEMI.hashCode,
                                  $mrjc(totalPurchase.hashCode,
                                      yourSavings.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PlanData &&
          other.UID == this.UID &&
          other.timestamp == this.timestamp &&
          other.planID == this.planID &&
          other.enteredAmount == this.enteredAmount &&
          other.currentSlidervalue == this.currentSlidervalue &&
          other.firstEMI == this.firstEMI &&
          other.nineMonthsEMI == this.nineMonthsEMI &&
          other.lastEMI == this.lastEMI &&
          other.totalPurchase == this.totalPurchase &&
          other.yourSavings == this.yourSavings);
}

class PlanCompanion extends UpdateCompanion<PlanData> {
  final Value<String> UID;
  final Value<int> timestamp;
  final Value<String> planID;
  final Value<double> enteredAmount;
  final Value<double> currentSlidervalue;
  final Value<double> firstEMI;
  final Value<double> nineMonthsEMI;
  final Value<double> lastEMI;
  final Value<double> totalPurchase;
  final Value<double> yourSavings;
  const PlanCompanion({
    this.UID = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.planID = const Value.absent(),
    this.enteredAmount = const Value.absent(),
    this.currentSlidervalue = const Value.absent(),
    this.firstEMI = const Value.absent(),
    this.nineMonthsEMI = const Value.absent(),
    this.lastEMI = const Value.absent(),
    this.totalPurchase = const Value.absent(),
    this.yourSavings = const Value.absent(),
  });
  PlanCompanion.insert({
    @required String UID,
    @required int timestamp,
    @required String planID,
    @required double enteredAmount,
    @required double currentSlidervalue,
    @required double firstEMI,
    @required double nineMonthsEMI,
    @required double lastEMI,
    @required double totalPurchase,
    @required double yourSavings,
  })  : UID = Value(UID),
        timestamp = Value(timestamp),
        planID = Value(planID),
        enteredAmount = Value(enteredAmount),
        currentSlidervalue = Value(currentSlidervalue),
        firstEMI = Value(firstEMI),
        nineMonthsEMI = Value(nineMonthsEMI),
        lastEMI = Value(lastEMI),
        totalPurchase = Value(totalPurchase),
        yourSavings = Value(yourSavings);
  static Insertable<PlanData> custom({
    Expression<String> UID,
    Expression<int> timestamp,
    Expression<String> planID,
    Expression<double> enteredAmount,
    Expression<double> currentSlidervalue,
    Expression<double> firstEMI,
    Expression<double> nineMonthsEMI,
    Expression<double> lastEMI,
    Expression<double> totalPurchase,
    Expression<double> yourSavings,
  }) {
    return RawValuesInsertable({
      if (UID != null) 'uid': UID,
      if (timestamp != null) 'timestamp': timestamp,
      if (planID != null) 'plan_i_d': planID,
      if (enteredAmount != null) 'entered_amount': enteredAmount,
      if (currentSlidervalue != null) 'current_slidervalue': currentSlidervalue,
      if (firstEMI != null) 'first_e_m_i': firstEMI,
      if (nineMonthsEMI != null) 'nine_months_e_m_i': nineMonthsEMI,
      if (lastEMI != null) 'last_e_m_i': lastEMI,
      if (totalPurchase != null) 'total_purchase': totalPurchase,
      if (yourSavings != null) 'your_savings': yourSavings,
    });
  }

  PlanCompanion copyWith(
      {Value<String> UID,
      Value<int> timestamp,
      Value<String> planID,
      Value<double> enteredAmount,
      Value<double> currentSlidervalue,
      Value<double> firstEMI,
      Value<double> nineMonthsEMI,
      Value<double> lastEMI,
      Value<double> totalPurchase,
      Value<double> yourSavings}) {
    return PlanCompanion(
      UID: UID ?? this.UID,
      timestamp: timestamp ?? this.timestamp,
      planID: planID ?? this.planID,
      enteredAmount: enteredAmount ?? this.enteredAmount,
      currentSlidervalue: currentSlidervalue ?? this.currentSlidervalue,
      firstEMI: firstEMI ?? this.firstEMI,
      nineMonthsEMI: nineMonthsEMI ?? this.nineMonthsEMI,
      lastEMI: lastEMI ?? this.lastEMI,
      totalPurchase: totalPurchase ?? this.totalPurchase,
      yourSavings: yourSavings ?? this.yourSavings,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (UID.present) {
      map['uid'] = Variable<String>(UID.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    if (planID.present) {
      map['plan_i_d'] = Variable<String>(planID.value);
    }
    if (enteredAmount.present) {
      map['entered_amount'] = Variable<double>(enteredAmount.value);
    }
    if (currentSlidervalue.present) {
      map['current_slidervalue'] = Variable<double>(currentSlidervalue.value);
    }
    if (firstEMI.present) {
      map['first_e_m_i'] = Variable<double>(firstEMI.value);
    }
    if (nineMonthsEMI.present) {
      map['nine_months_e_m_i'] = Variable<double>(nineMonthsEMI.value);
    }
    if (lastEMI.present) {
      map['last_e_m_i'] = Variable<double>(lastEMI.value);
    }
    if (totalPurchase.present) {
      map['total_purchase'] = Variable<double>(totalPurchase.value);
    }
    if (yourSavings.present) {
      map['your_savings'] = Variable<double>(yourSavings.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanCompanion(')
          ..write('UID: $UID, ')
          ..write('timestamp: $timestamp, ')
          ..write('planID: $planID, ')
          ..write('enteredAmount: $enteredAmount, ')
          ..write('currentSlidervalue: $currentSlidervalue, ')
          ..write('firstEMI: $firstEMI, ')
          ..write('nineMonthsEMI: $nineMonthsEMI, ')
          ..write('lastEMI: $lastEMI, ')
          ..write('totalPurchase: $totalPurchase, ')
          ..write('yourSavings: $yourSavings')
          ..write(')'))
        .toString();
  }
}

class $PlanTable extends Plan with TableInfo<$PlanTable, PlanData> {
  final GeneratedDatabase _db;
  final String _alias;
  $PlanTable(this._db, [this._alias]);
  final VerificationMeta _UIDMeta = const VerificationMeta('UID');
  GeneratedTextColumn _UID;
  @override
  GeneratedTextColumn get UID => _UID ??= _constructUid();
  GeneratedTextColumn _constructUid() {
    return GeneratedTextColumn(
      'uid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedIntColumn _timestamp;
  @override
  GeneratedIntColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedIntColumn _constructTimestamp() {
    return GeneratedIntColumn(
      'timestamp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _planIDMeta = const VerificationMeta('planID');
  GeneratedTextColumn _planID;
  @override
  GeneratedTextColumn get planID => _planID ??= _constructPlanID();
  GeneratedTextColumn _constructPlanID() {
    return GeneratedTextColumn(
      'plan_i_d',
      $tableName,
      false,
    );
  }

  final VerificationMeta _enteredAmountMeta =
      const VerificationMeta('enteredAmount');
  GeneratedRealColumn _enteredAmount;
  @override
  GeneratedRealColumn get enteredAmount =>
      _enteredAmount ??= _constructEnteredAmount();
  GeneratedRealColumn _constructEnteredAmount() {
    return GeneratedRealColumn(
      'entered_amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currentSlidervalueMeta =
      const VerificationMeta('currentSlidervalue');
  GeneratedRealColumn _currentSlidervalue;
  @override
  GeneratedRealColumn get currentSlidervalue =>
      _currentSlidervalue ??= _constructCurrentSlidervalue();
  GeneratedRealColumn _constructCurrentSlidervalue() {
    return GeneratedRealColumn(
      'current_slidervalue',
      $tableName,
      false,
    );
  }

  final VerificationMeta _firstEMIMeta = const VerificationMeta('firstEMI');
  GeneratedRealColumn _firstEMI;
  @override
  GeneratedRealColumn get firstEMI => _firstEMI ??= _constructFirstEMI();
  GeneratedRealColumn _constructFirstEMI() {
    return GeneratedRealColumn(
      'first_e_m_i',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nineMonthsEMIMeta =
      const VerificationMeta('nineMonthsEMI');
  GeneratedRealColumn _nineMonthsEMI;
  @override
  GeneratedRealColumn get nineMonthsEMI =>
      _nineMonthsEMI ??= _constructNineMonthsEMI();
  GeneratedRealColumn _constructNineMonthsEMI() {
    return GeneratedRealColumn(
      'nine_months_e_m_i',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastEMIMeta = const VerificationMeta('lastEMI');
  GeneratedRealColumn _lastEMI;
  @override
  GeneratedRealColumn get lastEMI => _lastEMI ??= _constructLastEMI();
  GeneratedRealColumn _constructLastEMI() {
    return GeneratedRealColumn(
      'last_e_m_i',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalPurchaseMeta =
      const VerificationMeta('totalPurchase');
  GeneratedRealColumn _totalPurchase;
  @override
  GeneratedRealColumn get totalPurchase =>
      _totalPurchase ??= _constructTotalPurchase();
  GeneratedRealColumn _constructTotalPurchase() {
    return GeneratedRealColumn(
      'total_purchase',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yourSavingsMeta =
      const VerificationMeta('yourSavings');
  GeneratedRealColumn _yourSavings;
  @override
  GeneratedRealColumn get yourSavings =>
      _yourSavings ??= _constructYourSavings();
  GeneratedRealColumn _constructYourSavings() {
    return GeneratedRealColumn(
      'your_savings',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        UID,
        timestamp,
        planID,
        enteredAmount,
        currentSlidervalue,
        firstEMI,
        nineMonthsEMI,
        lastEMI,
        totalPurchase,
        yourSavings
      ];
  @override
  $PlanTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? '`plan`';
  @override
  final String actualTableName = '`plan`';
  @override
  VerificationContext validateIntegrity(Insertable<PlanData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _UIDMeta, UID.isAcceptableOrUnknown(data['uid'], _UIDMeta));
    } else if (isInserting) {
      context.missing(_UIDMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp'], _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('plan_i_d')) {
      context.handle(_planIDMeta,
          planID.isAcceptableOrUnknown(data['plan_i_d'], _planIDMeta));
    } else if (isInserting) {
      context.missing(_planIDMeta);
    }
    if (data.containsKey('entered_amount')) {
      context.handle(
          _enteredAmountMeta,
          enteredAmount.isAcceptableOrUnknown(
              data['entered_amount'], _enteredAmountMeta));
    } else if (isInserting) {
      context.missing(_enteredAmountMeta);
    }
    if (data.containsKey('current_slidervalue')) {
      context.handle(
          _currentSlidervalueMeta,
          currentSlidervalue.isAcceptableOrUnknown(
              data['current_slidervalue'], _currentSlidervalueMeta));
    } else if (isInserting) {
      context.missing(_currentSlidervalueMeta);
    }
    if (data.containsKey('first_e_m_i')) {
      context.handle(_firstEMIMeta,
          firstEMI.isAcceptableOrUnknown(data['first_e_m_i'], _firstEMIMeta));
    } else if (isInserting) {
      context.missing(_firstEMIMeta);
    }
    if (data.containsKey('nine_months_e_m_i')) {
      context.handle(
          _nineMonthsEMIMeta,
          nineMonthsEMI.isAcceptableOrUnknown(
              data['nine_months_e_m_i'], _nineMonthsEMIMeta));
    } else if (isInserting) {
      context.missing(_nineMonthsEMIMeta);
    }
    if (data.containsKey('last_e_m_i')) {
      context.handle(_lastEMIMeta,
          lastEMI.isAcceptableOrUnknown(data['last_e_m_i'], _lastEMIMeta));
    } else if (isInserting) {
      context.missing(_lastEMIMeta);
    }
    if (data.containsKey('total_purchase')) {
      context.handle(
          _totalPurchaseMeta,
          totalPurchase.isAcceptableOrUnknown(
              data['total_purchase'], _totalPurchaseMeta));
    } else if (isInserting) {
      context.missing(_totalPurchaseMeta);
    }
    if (data.containsKey('your_savings')) {
      context.handle(
          _yourSavingsMeta,
          yourSavings.isAcceptableOrUnknown(
              data['your_savings'], _yourSavingsMeta));
    } else if (isInserting) {
      context.missing(_yourSavingsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {planID};
  @override
  PlanData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PlanData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PlanTable createAlias(String alias) {
    return $PlanTable(_db, alias);
  }
}

abstract class _$AppBase extends GeneratedDatabase {
  _$AppBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $OrderDetailsTableTable _orderDetailsTable;
  $OrderDetailsTableTable get orderDetailsTable =>
      _orderDetailsTable ??= $OrderDetailsTableTable(this);
  $PlanTable _plan;
  $PlanTable get plan => _plan ??= $PlanTable(this);
  OrdersDao _ordersDao;
  OrdersDao get ordersDao => _ordersDao ??= OrdersDao(this as AppBase);
  PlanDao _planDao;
  PlanDao get planDao => _planDao ??= PlanDao(this as AppBase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orderDetailsTable, plan];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PlanDaoMixin on DatabaseAccessor<AppBase> {
  $PlanTable get plan => attachedDatabase.plan;
}
mixin _$OrdersDaoMixin on DatabaseAccessor<AppBase> {
  $OrderDetailsTableTable get orderDetailsTable =>
      attachedDatabase.orderDetailsTable;
}
