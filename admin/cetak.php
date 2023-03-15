<?php
require 'functions.php';
if(isset($_GET['id'])){
    $id_transaksi=$_GET['id'];
}
$query = 'SELECT transaksi.*,member.nama_member , detail_transaksi.total_harga, detail_transaksi.total_bayar FROM transaksi INNER JOIN member ON member.id_member = transaksi.member_id INNER JOIN detail_transaksi ON detail_transaksi.transaksi_id = transaksi.id_transaksi WHERE transaksi.id_transaksi = ' . $_GET['id'];
$data = ambilsatubaris($conn,$query);
?>
<style>
table{
    border-collapse:collapse;
}
</style>
    <center><h2>STRUK LAUNDRY SAYAA</h2></center>
    <hr>
    <table>
    <tr>
    <td>Kode Invoice: <?php echo$data['kode_invoice']; ?></td>
    </tr>  
    <td>Pesanan Atas Nama: <?php echo$data['nama_member']; ?></td>
    </table>
 <table class="table" id="table" border="1" align="center" cellpadding="10">
                        <thead>
                            <tr>
                               
                                <th>Tanggal Transaksi</th>
                                <th>Total Harga</th>
                                <th>Total Bayar</th>
                                <th>Kembalian</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                       
                                <tr>
                            
                                    <td><?php echo$data['tgl_pembayaran']; ?></td>
                                    <td><?php echo$data['total_harga']; ?></td>
                                    <td><?php echo$data['total_bayar']; ?></td>                                    
                                    <td><?php echo$data['total_bayar'] - $data['total_harga']; ?></td>
                                    <td><?php echo$data['status_bayar']; ?></td>
                                </tr>
                         
                        </tbody>
                    </table>
<script>window.print()</script>