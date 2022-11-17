
## Perbedaan Navigator.push dan Navigator.pushReplacement

Method push() pada widget navigator akan menambahkan route page baru ke dalam stack route yang diatur oleh Navigator. Method pushReplacment() akan mengganti route lama (route yang berada pada top of the stack) dengan route baru.

## Widget yang dipakai dalam Project ini
- TextFormField, untuk membuat Form Field yang berisikan TextField
- ListView.builder, Membuat array widget linier yang scrollable.
- Card, Widget untuk menampilkan kumpulan data pada rounded corner 
- SizedBox, Membuat kotak dengan ukuran tetap.
- SingleChildScrollView, untuk membuat kotak dimana widgetnya menjadi scrollable

## jenis-jenis event yang ada pada Flutter
- onTap
- onClick
- onChanged
- onHover
- onSaved

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator bekerja berdasarkan prinsip Stack. Halaman yang sedang ditampilkan akan berada di top of stack. Sesuai dengan tipe data Stack, Navigator dapat melakukan operasi seperti push dan pop. 

## Implementasi checklist
- Membuat drawer serta routing pada widget drawer
- Membuat model untuk budget (form) dan halaman Tambah Budget
- Membuat halaman Data budget (list)