import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('privacy policy'.tr(context)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "1. مقدمة",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "تقدّر Carpy خصوصية مستخدميها وتحترمها. توضح سياسة الخصوصية هذه كيفية جمع واستخدام وحماية المعلومات الشخصية التي نجمعها من خلال تطبيقنا.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "2. المعلومات التي نجمعها",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "نقوم بجمع المعلومات التالية:\nمعلومات تسجيل الدخول: إذا قمت بتسجيل الدخول عبر Google، فسنحصل على معلومات أساسية مثل اسمك وعنوان بريدك الإلكتروني. إذا قمت بإنشاء حساب مباشرة في التطبيق، فسنطلب منك تقديم معلومات مثل الاسم وعنوان البريد الإلكتروني وكلمة المرور. \nمعلومات الاستخدام: نقوم بجمع معلومات حول كيفية استخدامك للتطبيق، مثل الصفحات التي تزورها ومدة استخدامك للتطبيق. \nمعلومات الموقع: قد نقوم بجمع معلومات عن موقعك الجغرافي إذا كنت تفعل ذلك عبر إعدادات التطبيق.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "3. كيفية استخدام المعلومات",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "نستخدم المعلومات التي نجمعها للأغراض التالية: \nلتوفير وتحسين خدماتنا: مثل تحسين تجربة المستخدم وتخصيص المحتوى بناءً على تفضيلاتك.\nللتواصل معك: مثل إرسال إشعارات مهمة أو تحديثات حول التطبيق.\nلأغراض أمان: مثل التحقق من حسابك ومنع الاحتيال.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "4. كيفية حماية المعلومات",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "نستخدم تقنيات أمان حديثة لحماية المعلومات التي نجمعها، بما في ذلك:\nتشفير البيانات: لضمان أن المعلومات الشخصية تظل سرية وآمنة.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "5. مشاركة المعلومات",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "لا نشارك معلوماتك الشخصية مع أطراف ثالثة إلا في الحالات التالية:\nمع مزودي الخدمات: مثل Firebase، الذين يساعدوننا في تشغيل التطبيق وتحسينه. هؤلاء الأطراف ملزمون بحماية المعلومات الشخصية بموجب اتفاقيات حماية بيانات صارمة.بموجب القانون: إذا طلبت السلطات المختصة الكشف عن المعلومات.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "6. حقوق المستخدمين",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "لديك الحق في الوصول إلى المعلومات التي نحفظها عنك، وطلب تصحيحها، أو حذفها. يمكنك الاتصال بنا عبر storecar85@gmail.com لممارسة هذه الحقوق.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "7. تغييرات في سياسة الخصوصية",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "قد نقوم بتحديث سياسة الخصوصية هذه من وقت لآخر. سنعلمك بأي تغييرات جوهرية عبر إشعار في التطبيق أو عبر البريد الإلكتروني.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "8. الاتصال بنا",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "إذا كان لديك أي أسئلة أو استفسارات حول سياسة الخصوصية هذه، يرجى الاتصال بنا عبر storecar85@gmail.com.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
