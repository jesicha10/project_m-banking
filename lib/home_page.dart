import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Koperasi Undiksha", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/jessy.jpg',
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _infoCard("Nasabah", "Jesicha Damayanti Manurung"),
                        SizedBox(height: 3),
                        _infoCard("Total Saldo Anda", "Rp. 1.200.000"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuItem(Icons.account_balance_wallet, "Cek Saldo"),
                  _buildMenuItem(Icons.send, "Transfer"),
                  _buildMenuItem(Icons.savings, "Deposito"),
                  _buildMenuItem(Icons.payment, "Pembayaran"),
                  _buildMenuItem(Icons.attach_money, "Pinjaman"),
                  _buildMenuItem(Icons.history, "Mutasi"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 245, 251),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Butuh Bantuan?",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "0878-1234-1024",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(Icons.phone, color: Colors.blue[900], size: 60),
                  ],
                ),
              ),
            ),

            // BAGIAN ICON (SETTING, SCAN, PROFILE)
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 234, 245, 251), // Kotak abu-abu untuk semua ikon
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Membulat di atas
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomItem(Icons.settings, "Setting"),
                  _buildScanButton(),
                  _buildBottomItem(Icons.person, "Profile"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk ikon Setting & Profile dalam kotak abu-abu
  Widget _buildBottomItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 40, color: Colors.blue[900]),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[900]),
        ),
      ],
    );
  }

  // Widget untuk tombol Scan yang berada dalam lingkaran biru
  Widget _buildScanButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[900], // Warna biru untuk lingkaran tengah
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Icon(Icons.qr_code_scanner, size: 50, color: Colors.white),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 245, 251),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.blue[700]),
          SizedBox(height: 8),
          Text(label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title\n",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black),
            ),
            TextSpan(
              text: value,
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
