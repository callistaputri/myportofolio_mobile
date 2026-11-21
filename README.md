# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Tugas 7

1. Widget tree merupakan struktur hierarki yang menghgambarkan bagaimana widget-widget disusun dalam sebuah aplikasi flutter. Setiap widget dapat memiliki widget lain sebagai child sehingga membentuk struktur yang bertingkat. Hubungan parent-child memungkinkan widget parent mengatur tata letak, tampilan, dan sifat widget child. Contoh, pada aplikasi myportofolio mobile, scaffold menjadi parent yang memiliki AppBar dan body. Lalu, body berisi padding, column, dan widget-widget lainnya. Dengan memakai widget tree, struktur interface aplikasi jadi lebih terorganisir dan mudah dikelola.

2. MaterialApp -> root widget aplikasi dan menyediakan konfigurasi tema serta navigasi
Scaffold -> menyediakan struktur dasar page aplikasi
AppBar -> menampilkan bagian header
Text -> menampilkan teks seperti judul, informasi profil, nama tombol
StatelessWidget -> dasar widget yang tampilannya tidak bergantung pada perubahan state internal
Padding -> memberi jarak di sekitar widget
Column -> menyusun widget secara vertikal
Row -> menyusun widget secara horizontal
Center -> menempatkan child di bagian tengah
Card -> menampilkan informasi profil dalam bentuk kartu
Container -> mengatur ukuran, padding, dan tampilan suatu widget
SizedBox -> memberi jarak atau ukuran tertentu
GridView.count -> menampilkan kumpulan tombol dalam bentuk grid dengan jumlah kolom yang ditentukan
Material -> menyediakan permukaan warna dan bentuk tertentu untuk tombol
InkWell -> memberi interaksi saat pengguna menekan button
Icon -> menampilkan icon pada setiap button
SnackBar -> menampilkan pesan sementara setelah user menekan button
ScaffoldMessenger -> mengelola dan menampilkan SnackBar pada Scaffold
InfoCard -> widget custom untuk menampilkan info NPM, nama, kelas
ItemCard -> widget custom untuk menampilkan tombol portofolio

Selain itu, proyek ini juga menggunakan ThemeData dan ColorScheme.fromSeed untuk mengatur tema dan skema warna aplikasi.

3. MaterialApp adalah widget utama yang menyediakan konfigurasi dasar untuk aplikasi flutter yang menggunakan material design. MaterialApp berfungsi untuk mengatur tema aplikasi, navigasi, judul aplikasi, dan halaman utama yang pertama ditampilkan. Widget ini umumnya digunakan sebagai root widget karena menyediakan konfigurasi global yang dapat digunakan oleh widget-widget di bawahnya. Pada myportofolio mobile, MaterialApp digunakan untuk mengatur tema aplikasi melalui ThemeData dan menentukan MyHomePage sebagai halaman utama

4. StatelessWidget adalah widget yang tidak memiliki state internal yang bisa berubah selama widget tersebut digunakan. Tampilan yang dihasilkan bergantung pada konfigurasi atau data yang diberikan saat widget dibuat. Sementara StatefulWidget adalah widget yang punya state yang dapat berubah selama aplikasi berjalan. Perubahan state tersebut bisa menyebabkan widget membangun ulang tampilannya menggunakan metode setState(). 

StatelessWidget sebaiknya digunakan saat tampilan widget bersifat statis dan tidak butuh perubahan state internal. Sebaliknya, StatefulWidget digunakan saat widget butuh interaksi atau perubahan data yang memengaruhi tampilannya

5. BuildContext adalah objek yang menunjukkan posisi suatu widget dalam widget tree. BuildContext penting karena digunakan untuk mengakses informasi dari widget parent. Di dalam metode build, contohnya digunakan untuk mengambil tema aplikasi melalui Theme.of(context), ukuran layar melalui MediaQuery.of(context), dan menampilkan SnackBar melalui ScaffoldMessenger.of(context).

6. Hot reload memungkinkan perubahan kode ditampilkan tanpa mengulang aplikasi dari awal dan tetap mempertahankan state. Sementara itu, hot restart menjalankan ulang aplikasi dari awal sehingga state di reset. Hot reload digunakan untuk perubahan tampilan atau kode biasa, sedangkan hot restart atau full restart diperlukan saat perubahan memengaruhi inisialisasi aplikasi, konfigurasi native, atau dependencies tertentu.

AI Disclosure

Dalam proses mengerjakan Tugas 7, saya menggunakan AI tools seperti ChatGPT sebagai alat bantu ketika mengalami kesulitan dalam memahami materi, mengimplementasikan fitur, atau menemukan error pada project saya.

Saya menggunakan AI untuk membantu memahami cara mengembangkan aplikasi mobile menggunakan Flutter, mengubah informasi profil sesuai identitas saya, menambahkan custom color pada setiap ItemCard, serta mengatur custom color palette menggunakan ThemeData dan ColorScheme. Saya juga menggunakan AI untuk membantu memahami penggunaan SnackBar, mengecek struktur kode, dan memastikan tidak terdapat error melalui perintah flutter analyze.

Saat mengalami kesulitan, biasanya saya memberikan potongan kode atau pesan error yang muncul kepada AI untuk membantu memahami penyebabnya dan mencari solusi. Setelah itu, saya mencoba menerapkan solusi yang diberikan ke dalam project dan mengecek kembali apakah hasilnya sudah sesuai dengan instruksi tugas.

### Tugas 8

1. Navigator.push() digunakan untuk membuka halaman baru di tanpa menghapus halaman sebelumnya, sedangkan Navigator.pushReplacement() membuka halaman baru dan menggantikan halaman sebelumnya. Sementara itu, Navigator.pop() digunakan untuk membuka formulir Add Education dari project card, sedangkan opsi Home pada drawer menggunakan Navaigator.pushReplacement() untuk kembali ke halaman utama

2. Scaffold berfungsi untuk kerangka utama halaman, AppBar sebagai bagian atas halaman, dan Drawer sebagai menu navigasi. Contoh saya memakai warna pink Color(0xFFF1B4AF) di AppBar dan DrawerHeader agar halaman utama dan formulir memiliki tampilan yang senada.

3. Saya memilih tata letak sederhana agar formulir mudah digunakan. SizedBox digunakan untuk mengatur jarak antar input agar lebih rapi, sedangkan SingleChildScrollView memungkinkan pengguna menggeser halaman saat formulir tidak muat di ukuran layar

4. GlobalKey<FormState> digunakan untuk mengakses dan mengelola kondisi Form. Validator memeriksa apakah input sudah memenuhi aturan sedangkan validate() menjalankan seluruh validasi saat tombol save ditekan. Contoh, kolom nama institusi tidak boleh dikosongkan. Pemilihan jenis input atau keyboard saja belum cukup karena tidak menjamin data yang dimasukkan benar, sehingga validasi tetap perlu dilakukan

AI Disclosure

Dalam proses mengerjakan Tugas 8, saya menggunakan AI tools seperti Claude AI sebagai alat bantu untuk memahami materi dan konsep yang belum sepenuhnya saya pahami.

Saya menggunakan AI untuk mempelajari konsep navigasi pada Flutter, seperti Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(), memahami fungsi Scaffold, AppBar, dan Drawer, serta mempelajari cara kerja Form, GlobalKey<FormState>, dan validasi input.

Selain itu, ketika menemukan error yang sulit diatasi atau penyebabnya tidak berhasil saya temukan sendiri, saya mengirimkan potongan kode dan pesan error kepada AI untuk membantu memahami kemungkinan penyebab masalah tersebut.

Saya menggunakan AI dengan mengajukan pertanyaan mengenai konsep atau kendala yang saya temui, kemudian mempelajari penjelasan yang diberikan agar dapat memahami materi.