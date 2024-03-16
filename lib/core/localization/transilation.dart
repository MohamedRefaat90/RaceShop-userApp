import 'package:get/get.dart';

class MyTransilation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          // Language Screen
          "chooseLang": "Choose Language",

          // onBoarding Screen
          "chooseProduct": "Choose Product",
          "easypay": "Easy & Safe Payment",
          "trackOrder": "Track You Order",
          "continue": "Continue",
          "skip": "Skip",
          "lorem":
              "Dolor nulla officia et minim aliquip consectetur do adipisicing deserunt id voluptate nulla. Qui ad quis do esse commodo.",

          // Login Screen
          "signin": 'Sign in',
          'welcome': "Welcome To Race Shop",
          'welcomDesc':
              'Dolor nulla officia et minim aliquip consectetur do adipisicing deserunt id voluptate nulla. Qui ad quis do esse commodo.',
          'email': "Email",
          'password': "Password",
          "phone": "Phone",
          'donthaveAcc': "if You Don't have Account",
          'forgetPassword': 'forgetPassword',

          // Signup Screen
          'firstName': "First Name",
          'lastName': "Last Name",
          "enterName": "Enter Name",
          "enterEmail": "Enter Email",
          "enterPhone": "Enter Your Phone",
          "enterPass": "Enter Password",
          "passConfirm": "Confirm Password",
          "signup": "Sign up",
          'haveAcc': "Have Account ",
          "passReq":
              "need at least 1 lowercase , 1 uppercase , 1 symbol  , 1 number",
          "EmailalreadyExist": "Email Already Exist",
          // Forget Pass Screen
          "forgetPass": "Forget Password",
          "forgetPassDesc": "Enter your Email to Recive Varification Code",
          "check": "Check",
          "confirmationtoken": "confirmation token has been sent to the email",
          "UseOTP":
              "Use the OTP that was sent to your Email to verify your Email",

          // Varification Screen
          "verify": "Verifiy Code",
          "varificationTitle": "Varification Process",
          "varificationDesc": "Enter OTP Recived on Your Email",
          "resendOTP": "Resend OTP",

          // ResetPass Screen
          "resetPassTitle": "Reset Password",
          "newPass": "New Password",
          "reset": "ٌReset",

          // Success Reset Password
          "succuesResetPass": "Your New Password Ready",

          // checkEmail
          "checkEmailTitle": "Check Email",
          "checkEmailDesc":
              "Enter Code you Recived on Email to Complete Signup",

          // Success Sginup
          "successSignup":
              "Congratulation Your Registration Complete Succesfuly",

          // Validate Fields
          "notEmpty": "Field Must Not Be Empty",
          "namenotValid": "username Not Valid",
          "emailnotValid": "Email Not Valid",
          "phonenotValid": "Phone Not Valid",
          "nameless5": "Name can't Less than 3",
          "emailless5": "Email can't Less than 3",
          "phoneless11": "Phone can't Less than 11",
          "passless8": "Password can't Less than 8",

          "namelarger30": "Name can't Larger than 30",
          "emaillarger30": "Email can't Larger than 30",
          "phonelarger13": "Phone can't Larger than 13",
          "passlarger30": "Password can't Larger than 30",

          "passNotMatch": "Passwords Not Match",
          // Alert Exit App
          "alertTitle": "Close App",
          "alertDesc": "Are You Sure Wanna Leave The App",
          "yes": "Yes",
          "no": "No",
          "apply": "Apply",
          // Home
          "findProduct": "Find Product",
          "offerTitle": "Winter Suprise",
          "offerDesc": "Cashback 20%",
          "productForYou": "Products For You",
          "offerThisMonth": "Offer This Month",
          "Categories": "Categories",
          "Offers": "Offers",
          "More": "More",
          "Home": "Home",
          "Settings": "Settings",
          "Favorite": "Favorite",

          // CategoryProducts
          "Filters": "Filters",
          "highestPrice": "Highest Price",
          "lowestPrice": "Lowest Price",
          'MostRecent': "Most Recent",
          'Oldest': "Oldest",

          // Product Details
          "ColorsandSizes": "Colors and Sizes",
          "AddtoCart": "Add to Cart",
          "SelectColor&SizePlease": "Select Color & Size Please",

          // Settings
          "OrdersHistory": "Orders History",
          "Address": "Address",
          "Aboutus": "About us",
          "Contactus": "Contact us",
          'Calling': 'Calling',
          'WhatsApp': 'WhatsApp',
          'DarkMode': 'Dark Mode',
          "Languages": "Languages",
          'Arabic': 'Arabic',
          'English': 'English',
          "Logout": "Logout",

          // Orders
          "Orders": "Orders",
          "Cancel": "Cancel",
          "Canceled": "Canceled",
          "pending": "Pending",
          "OrderDetails": "Order Details",
          "OrderNumber:": "Order Number : ",
          "PaymentType:": "Payment Type : ",
          "OrderPrice:": "Order Price : ",
          "ShippingPrice:": "Shipping Price : ",
          "Coupon:": "Coupon : ",
          "CouponDiscount:": "Coupon Discount : ",
          "ShippingTime:Within": "Shipping Time : With in ",
          "Shipping": "Shipping",
          "Days": " Days ",
          "OrderStatus:": "Order Status : ",
          "TotalPrice:": "Total Price : ",
          "Color:": "Color : ",
          "Size:": "Size : ",
          "Quantity:": "Quantity : ",
          "DeliveryDetails": "DeliveryDetails",
          'Street:': 'Street : ',
          'Building:': 'Building :  ',
          'Floor:': 'Floor : ',
          'Apartment:': 'Apartment : ',
          'Zone:': 'Zone : ',
          'DeliveyTime:': 'Delivey Time : ',
          "within": "with in ",

          // Favourites
          "Favourites": "Favourites",

          // Cart
          'Cart': 'Cart',
          "HaveaCopun": "Have a Copun",
          "CopunName": "Copun Name",
          'Price': 'Price',
          "TotalPrice": "Total Price",
          'Discount': 'Discount',
          'YouSaved': 'You Saved',
          "CheckOut": "CheckOut",
          "CheckoutDetails": "Checkout Details",
          "YouHave": "You Have ",
          "iteminYourCart": " item in Your Cart",
          'PaymentMethod': 'Payment Method',
          "ChoosePaymentMethod": "Choose Payment Method",
          "PaymentWhenReciveTheOrder": "Payment When Recive The Order",
          "Installments up to 60 months": "Installments up to 60 months",
          "DeliveryAddress": "DeliveryAddress",
          "YouNotAddAnyAddressYet": "You Not Add Any Address Yet",
          "Order": "Order",
          "Bill": "Bill",
          "BillID:": "Bill ID : ",
          "YouMustChooseDeliveryAddress&PaymentMethod":
              "You Must Choose Delivery Address & Payment Method",
          "CongratulationYourOrderisCompelete":
              "Congratulation Your Order is Compelete",
          "UseThisBillIDToNearestFawryMachineForCompeleteYourPurchase":
              "Use This Bill ID To Nearest Fawry Machine For Compelete Your Purchase",
          "ConfirmOrder": "Confirm Order",
          "ItemAddedToCart": "Item Added To Cart",
          "ThereisNoMoreQuintityForThisProduct":
              "There is No More Quintity For This Product",
          "ProductRemovedFromYourCart": "Product Removed From Your Cart",
          "CouponNotValid": "Coupon Not Valid",
          "ViewCart": "View Cart",
          "EnterVodaCash": "Enter Your Vodafone Cash",

          // Address
          "youcan'tAddmorethan3Addresses":
              "you can't Add more than 3 Addresses",
          "YouDon'tAddAnyAddressyet": "You Don't Add Any Address yet",
          "AddressDetials": "Address Detials",
          "AddressName": "Address Name",
          "Home/Work": "Home / Work",
          "Submit": "Submit",
          "Street": "Street",
          "Building": "Building",
          "Floor": "Floor",
          "Apartment": "Apartment",
          "EnterNumber": "Enter Number",
          "PickaLocationtoContinue": "Pick a Location to Continue",
          "completed": "Completed",
          "cash": "Cash",
          "online": "Online",
          "NoProductsWereFound": "No Products Were Found",
          "userorpaswwordnotCorrecttryagain":
              "Email or paswword not Correct try again",
          "Add": "Add"
        },
        "ar": {
          // Language Screen
          "chooseLang": "اختار اللغة",

          // onBoarding Screen
          "chooseProduct": "اختار منتجاتك",
          "easypay": "وسائل دفع سهلة و أمنة",
          "trackOrder": "تتبع طلبك",
          "continue": "التالي",
          "skip": "تخطي",
          "lorem":
              " هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأهاء",

          // Login Screen
          "signin": 'تسجيل الدخول',
          'welcome': "مرحبا بك في ريس شوب",
          'welcomDesc':
              " هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأهاء",
          'email': "البريد الالكتروني",
          'password': "كلمة السر",
          "phone": "رقم الهاتف",
          'donthaveAcc': "اذا لم يكن لديك حساب",

          // Signup Screen
          "name": "الاسم",
          'firstName': "الاسم الاول",
          'lastName': "الاسم الاخير",
          "enterEmail": "ادخل الايميل",
          "enterPass": "ادخل كلمة السر",
          "passConfirm": "تأكيد كلمة السر",
          "enterName": "ادخل اسمك",
          "enterPhone": "ادخل رقم الهاتف",
          'forgetPassword': 'نسيت كلمة السر',
          'haveAcc': "لديك حساب قم ",
          "signup": "تسجيل حساب",
          "passReq": "يجب ان يتكون من حرف كبير و صغير و رمز و رقم",
          "EmailalreadyExist": "هذا البريد الأيكتروني مستخدم مسبقا",
          "confirmationtoken": "تم ارسال رمز التحقق الي بريدك الالكتروني",
          "UseOTP": "استخدم رمز التحيقق المرسل الي بريدك الالكتروني",

          // Forget Pass Screen
          "forgetPass": "نسيت كلمة المرور",
          "forgetPassDesc": "ادخل البريد الالكتروني للحصول علي رمز التحقق",
          "check": "تحقق",

          // Varification Screen
          "verify": "تحقق من الرمز",
          "varificationTitle": "عملية التحقق",
          "varificationDesc": "ادخل رمز التحقق المرسل علي بريدك الالكتروني",
          "resendOTP": "اعادة ارسال رمز التحقق",

          // ResetPass Screen
          "resetPassTitle": "ضبط كلمة سر جديدة",
          "newPass": "كلمة السر الجديدة",
          "reset": "تعين كلمة السر الجديدة",

          // Success Reset Password
          "succuesResetPass": "كلمة السر الجديدة جاهزة",

          // check Email
          "checkEmailTitle": "التحقق من البريد الالكتروني",
          "checkEmailDesc":
              "ادخل الرمز الذي حصلت عليه من البريد الابكتروني لاكمال عملية التسجيل",

          // Success Signup
          "successSignup": "تهانينا لقد اتممت علمية التسجيل بنجاح",

          // Validate Fields
          "notEmpty": "الحقل لا يجب ان يكون فارغا",
          "namenotValid": "الاسم غير صالح",
          "emailnotValid": "البريد الايكتروني غير صالح",
          "phonenotValid": "رقم الهاتف غير صالح",
          "nameless5": "الاسم لا يمكن ان يكون اقل من 3 احرف",
          "emailless5": "الايميل لا يجب ان يكون اقل من 3 احرف",
          "phoneless11": "رقم الهاتف لا يجب ان يكون اقل من 11 رقم",
          "passless8": "كلمة السر لا تجب ان تكون اقل من 8 احرف",

          "namelarge30": "الاسم لا يمكن ان يكون اكبر من 30 حرف",
          "emaillarge30": "الايميل لا يجب ان يكون اكبر من 30 حرف",
          "phonelarge13": "رقم الهاتف لا يجب ان يكون اكبر من 13 رقم",
          "passlarge30": "كلمة السر لا تجب ان تكون اكبر من 30 حرف",

          "passNotMatch": "كلمة السر لا تتطابق",
          // Alert Exit App
          "alertTitle": "أغلاق التطبيق",
          "alertDesc": "هل انت من متاكد من رغبتك في مغادرة التطبيق؟",
          "yes": "نعم",
          "no": "لا",
          "Apply": "تطبيق",
          // Home
          "findProduct": "البحث عن منتج",
          "offerTitle": "عروض الشتاء",
          "offerDesc": "كاش باك 20%",
          "productForYou": "منتجات لك",
          "offerThisMonth": "عروض هذا الشهر",
          "Categories": "الأقسام",
          "Offers": "العروض",
          "More": "المزيد",
          "Home": "الرئيسية",
          "Settings": "الأعدادات",
          "Favorite": "المفضلة",

          // CategoryProducts
          "Filters": "عرض حسب",
          "highestPrice": "الأعلي سعراَ",
          "lowestPrice": "الأقل سعراّ",
          'MostRecent': "الأحدث",
          'Oldest': "الأقدم",

          // Product Details
          "ColorsandSizes": "الالوان و المقاسات",
          "AddtoCart": "أضافة الي السلة",
          "SelectColor&SizePlease": "من فضلك اختار اللون و المقاس",

          // Settings
          "OrdersHistory": "سجل الطلبات",
          "Address": "العناويين",
          "Aboutus": "عنا",
          "Contactus": "تواصل معنا",
          'Calling': 'اتصال',
          'WhatsApp': 'واتساب',
          'DarkMode': 'الوضع المظلم',
          "Languages": "اللغة",
          'Arabic': 'العربية',
          'English': 'الانجليزية',
          "Logout": "تسجيل الخروج",

          // Orders
          "Orders": "الطلبات",
          "Cancel": "الغاء",
          "Canceled": "ملغي",
          "pending": "معلق",
          "OrderDetails": " تفاصيل الطلب",
          "OrderNumber:": " رقم الطلب : ",
          "PaymentType:": " طريقة الدفع : ",
          "OrderPrice:": " سعر الطلب : ",
          "ShippingPrice:": " سعر الشحن : ",
          "Coupon:": "أسم الكوبون : ",
          "CouponDiscount:": " خصم الكوبون : ",
          "ShippingTime:Within": "وقت الشحن : خلال ",
          "Shipping": "الشحن",
          "Days": " أيام ",
          "OrderStatus:": " حالة الطلب : ",
          "TotalPrice:": " السعر الكلي : ",
          "Color:": " اللون : ",
          "Size:": " المقاس : ",
          "Quantity:": " الكمية : ",
          "DeliveryDetails": "تفاصيل الشحن",
          'Street:': ' الشارع : ',
          'Building:': ' المبني  : ',
          'Floor:': ' الدور : ',
          'Apartment:': ' الشقة : ',
          'Zone:': ' المنطقة : ',
          'DeliveyTime:': ' وقت التوصيل : ',
          "within": " خلال ",

          // Favourites
          "Favourites": "المفضلة",

          // Cart
          'Cart': 'سلة الطلبات',
          "HaveaCopun": "أمتلك كوبون خصم",
          "CopunName": "كود الكوبون",
          'Price': 'السعر',
          "TotalPrice": "السعر الكلي",
          'Discount': 'الخصم',
          'YouSaved': 'لقد وفرت',
          "CheckOut": "تأكيد الطلب",
          "CheckoutDetails": "تفاصيل تأكيد الطلب",
          "Bill": "الفاتورة",
          "BillID:": "رقم الفاتورة : ",
          "YouHave": " تمتلك ",
          "iteminYourCart": "منتج في سلة طلباتك",
          "ChoosePaymentMethod": "اختر طريقة الدفع",
          'PaymentMethod': 'طريقة الدفع',
          "PaymentWhenReciveTheOrder": "أدفع عند استلام الطلب",
          "Installmentsupto60months": "التقسيط حتي 60 شهر",
          "DeliveryAddress": "عنوان التوصيل",
          "YouNotAddAnyAddressYet": "لم تقم بأضافة اي عنوان ",
          "Order": "أطلب",
          "YouMustChooseDeliveryAddress&PaymentMethod":
              "يجب عليك اختيار طريقة الدفع و عنوان التوصيل",
          "CongratulationYourOrderisCompelete":
              "تهانينا لقد اكتمل الطلب الخاص بك",
          "UseThisBillIDToNearestFawryMachineForCompeleteYourPurchase":
              "استخدم كود هذه الفاتورة لأقرب ماكينة فوري لأتمام عملية الشراء",
          "ConfirmOrder": "تأكيد الطلب",
          "ItemAddedToCart": "تم أضافة المنتج الي سلتك",
          "ThereisNoMoreQuintityForThisProduct":
              "لا يوجد كمية متاحة من هذا المنتج",
          "ProductRemovedFromYourCart": "تم حذف المنتج من سلتك",
          "CouponNotValid": "الكوبون غير صالح",
          "ViewCart": "الذهاب للسلة",

          // Address
          "youcan'tAddmorethan3Addresses":
              "لا يمكنك أضافة أكثر من ثلاثة عناويين",
          "YouDon'tAddAnyAddressyet": "لم تقم بأضافة اي عنوان توصيل",
          "AddressDetials": "تفاصيل العنوان",
          "AddressName": "اسم العنوان",
          "Home/Work": "المنزل / العمل",
          "Street": "الشارع",
          "Building": "المبني",
          "Floor": "الدور",
          "Apartment": "الشقة",
          "Submit": "تأكيد",
          "EnterNumber": "يجب ادخال ارقام",
          "PickaLocationtoContinue": "اختار موقعك علي الخريطة",
          "completed": "مكتمل",
          "cash": " نقدي ",
          "online": " اونلاين ",
          "EnterVodaCash": "أدخل محفظة فودافون كاش",

          "NoProductsWereFound": "لم يتم ايجاد اي منتج",
          "userorpaswwordnotCorrecttryagain":
              "الأيميل المستخدم او كلمة السر غير صحيحة حاول مرة اخري",
          "Add": "أضافة"
        }
      };
}
