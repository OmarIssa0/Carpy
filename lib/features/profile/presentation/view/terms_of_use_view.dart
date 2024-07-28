import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';

class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('terms of use'.tr(context)),
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
                "تحدد شروط الاستخدام هذه القواعد والشروط التي تنطبق على استخدامك لتطبيق Carpy. باستخدامك للتطبيق، فإنك توافق على الالتزام بهذه الشروط. إذا كنت لا توافق على أي من هذه الشروط، يرجى عدم استخدام التطبيق.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "2. حساب المستخدم",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "إنشاء الحساب: يمكنك تسجيل الدخول عبر Google أو إنشاء حساب جديد مباشرة في التطبيق. يجب أن تقدم معلومات دقيقة وحديثة.أمان الحساب: أنت مسؤول عن الحفاظ على سرية معلومات تسجيل الدخول الخاصة بك، وأنت مسؤول عن جميع الأنشطة التي تحدث تحت حسابك.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "3. حقوق الملكية",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "الملكية الفكرية: جميع حقوق الملكية الفكرية المتعلقة بالتطبيق (بما في ذلك ولكن لا تقتصر على العلامات التجارية وحقوق النشر) تعود إلى Carpy. لا يحق لك استخدام أي من هذه الحقوق دون الحصول على إذن صريح منا.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "4. سلوك المستخدم",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "المحظورات: لا يجوز لك استخدام التطبيق بأي شكل من الأشكال غير قانوني أو ضار، بما في ذلك إرسال محتوى غير لائق أو غير قانوني أو انتهاك حقوق الآخرين.الإبلاغ: إذا كنت تعتقد أن هناك انتهاكًا لهذه الشروط، يمكنك الإبلاغ عن ذلك عبر البريد الإلكتروني storecar85@gmail.com.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "5. إخلاء المسؤولية",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "خدمات الطرف الثالث: قد يحتوي التطبيق على روابط إلى خدمات أو مواقع ويب تابعة لأطراف ثالثة. نحن غير مسؤولين عن محتوى أو سياسات الخصوصية لتلك الأطراف الثالثة.عدم ضمان: نعمل جاهدين لضمان أن يكون التطبيق متاحًا وخاليًا من الأخطاء، ولكن لا نقدم أي ضمانات بشأن استمرارية توافره أو خلوه من الأخطاء.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "6. تعديل الشروط",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "نحتفظ بالحق في تعديل هذه الشروط من وقت لآخر. سنقوم بإبلاغك بأي تغييرات جوهرية عبر إشعار في التطبيق أو عبر البريد الإلكتروني. استمرارك في استخدام التطبيق بعد التعديلات يعني أنك تقبل الشروط المعدلة.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "7. إنهاء الاستخدام",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "يمكننا إنهاء أو تعليق وصولك إلى التطبيق في أي وقت إذا كنت تنتهك هذه الشروط أو إذا قررنا أن ذلك ضروري للحفاظ على سلامة التطبيق والمستخدمين.",
                style: AppStyles.regular14,
              ),
              SizedBox(height: 35),
              Text(
                "8. الاتصال بنا",
                style: AppStyles.semiBold18,
              ),
              SizedBox(height: 10),
              Text(
                "إذا كان لديك أي أسئلة أو استفسارات حول شروط الاستخدام هذه، يرجى الاتصال بنا عبر البريد الإلكتروني storecar85@gmail.com.",
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
