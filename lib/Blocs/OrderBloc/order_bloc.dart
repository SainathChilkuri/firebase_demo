import 'package:firebase_demo/Blocs/OrderBloc/order_event.dart';
import 'package:firebase_demo/Blocs/OrderBloc/order_states.dart';
import 'package:firebase_demo/DataSource/Databas/database_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderEvents,OrderState>{
  OrderBloc() : super(OrderInitialState());

  @override
  Stream<OrderState> mapEventToState(OrderEvents event) async*{
    if(event is OrderInitialDataLoad){
      var details  = await AppBase().ordersDao.getOrderDetails(event.UID);
      if(details.length<=0){
        yield OrderEmptyState();
      }else{
        yield OrderLoadState(orderDetail: details);
      }
    }
   if(event is OrderInsertEvent){
     try{
       var result = await AppBase().ordersDao.insertOrderDetails(event.orderDetail);
       print("--------------------------------");
       print(result);
       print("--------------------------------");
       if(result!=0){
         var details  = await AppBase().ordersDao.getOrderDetails(event.orderDetail.custId);
         print("--------------------------------");
         print(details);
         if(details.length>0){
           yield OrderLoadState(orderDetail: details);
         }else{
           yield OrderEmptyState();
         }
       }else{
         yield OrderEmptyState();
       }
     }catch(e){
       yield OrderLoadFailState();
     }
   }
   if(event is OrderDeleteEvent){
     var result = AppBase().ordersDao.deleteOrderDetails(event.orderDetailsTableData);
     if(result!=0){
       print("Order Deleted Succesfully");
       var details  = await AppBase().ordersDao.getOrderDetails(event.orderDetailsTableData.custId);
       if(details.length<=0){
         yield OrderEmptyState();
       }else{
         yield OrderLoadState(orderDetail: details);
       }
     }else{
       print("Delete Failed");
     }
   }
  }

}