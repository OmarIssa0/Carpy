import 'package:car_store/core/utils/app_styles.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        title: Text(
          "help".tr(context), // style: AppStyles.semiBold24
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "1. مقدمة",
                style: AppStyles.semiBold18,
              ),
              const SizedBox(height: 10),
              const Text(
                "مرحبًا بك في قسم المساعدة في Carpy. هنا يمكنك العثور على إجابات للأسئلة الشائعة، أدلة استخدام، وطريقة الاتصال بنا إذا كنت بحاجة إلى دعم إضافي",
                style: AppStyles.regular14,
              ),
              const SizedBox(height: 35),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2. الأسئلة الشائعة (FAQ)",
                    style: AppStyles.semiBold18,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "س: كيف يمكنني تسجيل الدخول إلى تطبيق Carpy؟",
                    style: AppStyles.regular16,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ج: يمكنك تسجيل الدخول باستخدام حساب Google الخاص بك أو إنشاء حساب جديد عبر إدخال بريدك الإلكتروني وكلمة المرور.",
                    style: AppStyles.regular14,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "س: ماذا أفعل إذا نسيت كلمة المرور؟",
                    style: AppStyles.regular16,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'ج: يمكنك استخدام خاصية "نسيت كلمة المرور" على شاشة تسجيل الدخول لإعادة تعيين كلمة المرور الخاصة بك عبر البريد الإلكتروني.',
                    style: AppStyles.regular14,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "س: هل أحتاج إلى اتصال بالإنترنت لاستخدام التطبيق؟",
                    style: AppStyles.regular16,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'ج: نعم، تحتاج إلى اتصال بالإنترنت لاستخدام معظم ميزات التطبيق، مثل استعراض البيانات والتفاعل مع الخدمات.',
                    style: AppStyles.regular14,
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Text(
                "3. التواصل معنا",
                style: AppStyles.semiBold18,
              ),
              const SizedBox(height: 10),
              const Text(
                "إذا لم تتمكن من العثور على الإجابة التي تبحث عنها أو إذا كنت بحاجة إلى دعم إضافي، لا تتردد في الاتصال بنا عبر:",
                style: AppStyles.regular14,
              ),
              const SizedBox(height: 10),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    const Text(
                      "البريد الإلكتروني: ",
                      style: AppStyles.regular14,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _sendEmail();
                      },
                      child: Text(
                        "storecar85@gmail.com",
                        style: AppStyles.regular14.copyWith(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _sendEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'storecar85@gmail.com',
    queryParameters: {
      'subject': 'دعم Carpy',
    },
  );

  try {
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      // رسالة توضيحية عند عدم القدرة على فتح تطبيق البريد الإلكتروني
      throw 'لا يمكن فتح تطبيق البريد الإلكتروني. تحقق من أنك قمت بتثبيت تطبيق بريد إلكتروني.';
    }
  } catch (e) {
    // معالجة الأخطاء
    print('حدث خطأ: $e');
  }
}
