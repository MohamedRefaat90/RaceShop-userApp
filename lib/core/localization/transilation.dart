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
          'welcome': "Welcome Back",
          'welcomDesc':
              'Dolor nulla officia et minim aliquip consectetur do adipisicing deserunt id voluptate nulla. Qui ad quis do esse commodo.',
          'email': "Email",
          'password': "Password",
          "phone": "Phone",
          'donthaveAcc': "if You Don't have Account",
          'forgetPassword': 'forgetPassword',

          // Signup Screen
          "name": "username",
          "enterName": "Enter Name",
          "enterEmail": "Enter Email",
          "enterPhone": "Enter Your Phone",
          "enterPass": "Enter Password",
          "passConfirm": "Confirm Password",
          "signup": "Sign up",
          'haveAcc': "Have Account ",

          // Forget Pass Screen
          "forgetPass": "Forget Password",
          "forgetPassDesc": "Enter your Email to Recive Varification Code",
          "check": "Check",

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
          "nameless5": "Name can't Less than 5",
          "emailless5": "Email can't Less than 5",
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
          'welcome': "مرحبا بك",
          'welcomDesc':
              " هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأهاء",
          'email': "البريد الالكتروني",
          'password': "كلمة السر",
          "phone": "رقم الهاتف",
          'donthaveAcc': "اذا لم يكن لديك حساب",

          // Signup Screen
          "name": "الاسم",
          "enterEmail": "ادخل الايميل",
          "enterPass": "ادخل كلمة السر",
          "passConfirm": "تأكيد كلمة السر",
          "enterName": "ادخل اسمك",
          "enterPhone": "ادخل رقم الهاتف",
          'forgetPassword': 'نسيت كلمة السر',
          'haveAcc': "لديك حساب قم ",
          "signup": "تسجيل حساب",

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
          "nameless5": "الاسم لا يمكن ان يكون اقل من 5 احرف",
          "emailless5": "الايميل لا يجب ان يكون اقل من 5 احرف",
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
        }
      };
}
