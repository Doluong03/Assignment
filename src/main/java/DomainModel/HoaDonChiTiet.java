package DomainModel;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name="HoaDonChiTiet")
public class HoaDonChiTiet implements Serializable {
    @Id
    @ManyToOne
    @JoinColumn(name = "IdHoaDon")
    private HoaDon hoaDon;

    @Id
    @ManyToOne()
    @JoinColumn(name = "IdChiTietSP")
    private ChiTietSP chiTietSP;

    @Column(name = "tongTienSP")
    private Double tongTien;

    @Column(name = "SoLuong")
    private int soLuong;

    @Column(name = "DonGia")
    private Double donGia;

    public HoaDonChiTiet() {
    }

    public HoaDonChiTiet(HoaDon hoaDon, ChiTietSP chiTietSP, int soLuong) {
        this.hoaDon = hoaDon;
        this.chiTietSP = chiTietSP;
        this.donGia = chiTietSP.getGiaBan();
        this.soLuong = soLuong;
        this.tongTien = this.donGia * this.soLuong;

    }

    public HoaDon getHoaDon() {
        return hoaDon;
    }

    public void setHoaDon(HoaDon hoaDon) {
        this.hoaDon = hoaDon;
    }

    public ChiTietSP getChiTietSP() {
        return chiTietSP;
    }

    public void setChiTietSP(ChiTietSP chiTietSP) {
        this.chiTietSP = chiTietSP;
    }

    public Double getTongTien() {
        return tongTien;
    }

    public void setTongTien(Double tongTien) {
        this.tongTien = tongTien;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public Double getDonGia() {
        return donGia;
    }

    public void setDonGia(Double donGia) {
        this.donGia = donGia;
    }
}

