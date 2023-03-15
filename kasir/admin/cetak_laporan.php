<?php
$title = 'laporan';
require 'functions.php';
$penjualan = ambildata($conn,"SELECT SUM(detail_transaksi.total_harga) AS total,COUNT(detail_transaksi.paket_id) as jumlah_paket,paket.nama_paket,transaksi.tgl_pembayaran FROM detail_transaksi
INNER JOIN transaksi ON transaksi.id_transaksi = detail_transaksi.transaksi_id 
INNER JOIN paket ON paket.id_paket = detail_transaksi.paket_id
WHERE transaksi.status_bayar = 'dibayar' GROUP BY detail_transaksi.paket_id");
?>
<style>
    table{
        border-collapse: collapse;
    }
</style>
<center>
    <h2>LAPORAN LAUNDRY SAYYA</h2>
</center>
<hr>
 <table class="table" id="table" border="1" align="center" cellpadding="10">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Paket</th>
                                <th>Jumlah Transaksi</th>
                                <th>Tanggal Transaksi</th>
                                <th>Total Hasil</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no=1; foreach($penjualan as $transaksi): ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= htmlspecialchars($transaksi['nama_paket']); ?></td>
                                    <td><?= htmlspecialchars($transaksi['jumlah_paket']); ?></td>
                                    <td><?= htmlspecialchars($transaksi['tgl_pembayaran']); ?></td>
                                    <td><?= htmlspecialchars($transaksi['total']); ?></td>                                    
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
<script>window.print()</script>
