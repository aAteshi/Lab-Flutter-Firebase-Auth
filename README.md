ไฟล์ main.dart
WidgetsFlutterBinding.ensureInitialized();
ใช้เพื่อให้แน่ใจว่า Flutter ทำงานถูกต้องก่อนเรียกใช้งาน Firebase
await Firebase.initializeApp(...)
ใช้เพื่อเริ่มต้น Firebase โดยโหลดค่าจาก firebase_options.dart
-----------------------------------------------------------
ไฟล์ firebase_options.dart - ค่ากำหนด Firebase
ตรวจสอบว่าแอปรันบน Android, iOS, Web, Mac, Windows แล้วคืนค่า FirebaseOptions ที่เหมาะสม
ใช้ค่าเชื่อมต่อกับ Firebase เช่น apiKey, appId, projectId, เป็นต้น
-----------------------------------------------------------
ไฟล์ login_screen.dart - หน้าเข้าสู่ระบบ
StatefulWidget ใช้เก็บสถานะของหน้าเข้าสู่ระบบ
TextEditingController ใช้รับข้อมูล อีเมลและรหัสผ่าน
ใช้ FirebaseAuth.instance.signInWithEmailAndPassword(email, password);
ถ้า สำเร็จ → นำผู้ใช้ไปยังหน้า HomeScreen
ถ้า ล้มเหลว → แจ้งเตือนข้อผิดพลาด
-----------------------------------------------------------
เช็คว่ารหัสผ่าน ตรงกัน หรือไม่
ใช้ FirebaseAuth.instance.createUserWithEmailAndPassword(email, password);
ถ้าสำเร็จ → กลับไปหน้า LoginScreen
-----------------------------------------------------------
ไฟล์ home_screen.dart - หน้าหลัก
แสดงหน้า Home หลังจากเข้าสู่ระบบ
-----------------------------------------------------------
การจัดการ Forgot Password (เพิ่มใน login_screen.dart)
ใช้ FirebaseAuth.instance.sendPasswordResetEmail(email: email);
ส่งอีเมลเพื่อรีเซ็ตรหัสผ่าน
-----------------------------------------------------------
สรุปการทำงาน
✅ เข้าสู่ระบบ (login_screen.dart) → เช็คอีเมลและรหัสผ่านผ่าน Firebase
✅ สร้างบัญชีใหม่ (create_account_screen.dart) → สร้างบัญชี Firebase
✅ ลืมรหัสผ่าน (_forgotPassword()) → ส่งอีเมลเปลี่ยนรหัสผ่าน
✅ Firebase Authentication ใช้ signInWithEmailAndPassword() และ createUserWithEmailAndPassword()
