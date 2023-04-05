package repositories;

import DomainModel.ChiTietSP;
import DomainModel.HoaDonChiTiet;
import DomainModel.KhachHang;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HIbernateUtils;
import viewModel.QLChiTietSP;
import viewModel.QLHoaDonCT;

import java.util.ArrayList;
import java.util.List;

public class ChiTietSpRepository {
    private ArrayList<QLChiTietSP> list;
    private ArrayList<QLHoaDonCT> list2 ;
    private Session hSession;
    public ChiTietSpRepository()
    {
        this.list = new ArrayList<>();
        this.list2 = new ArrayList<>();
        this.hSession = HIbernateUtils.getFACTORY().openSession();
    }


    public void insert(ChiTietSP chiTietSP)
    {
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.persist(chiTietSP);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }

    public void update(ChiTietSP chiTietSP)
    {
        this.hSession = HIbernateUtils.getFACTORY().openSession();
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.merge(chiTietSP);
            transaction.commit();
            this.hSession.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }
    public void delete(ChiTietSP chiTietSP)
    {        this.hSession = HIbernateUtils.getFACTORY().openSession();
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.delete(chiTietSP);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }
    public void addCart(HoaDonChiTiet qlct, ArrayList<HoaDonChiTiet> List, ChiTietSP chiTietSP) {
        boolean found  = false;
        for (HoaDonChiTiet x : List) {
            if (x.getChiTietSP().getMa().equals(qlct.getChiTietSP().getMa())) {
                x.setSoLuong(x.getSoLuong() + 1);
                x.setTongTien(x.getDonGia()*x.getSoLuong());
                found = true;
                break;
            }
        }

        if (!found) {
            List.add(qlct);
        }
    }

    public List<ChiTietSP> findAll()
    {
        this.hSession = HIbernateUtils.getFACTORY().openSession();
        String hql = "SELECT obj FROM ChiTietSP obj";
        Query<ChiTietSP> query = this.hSession.createQuery(hql, ChiTietSP.class);
        return query.getResultList();
    }

    public ChiTietSP findByMa(String ma)
    {
        this.hSession = HIbernateUtils.getFACTORY().openSession();
        String hql = "SELECT obj FROM ChiTietSP obj WHERE obj.ma = ?1";
        Query<ChiTietSP> query = this.hSession.createQuery(hql, ChiTietSP.class);
        query.setParameter(1, ma);
        return query.getSingleResult();
    }

    public HoaDonChiTiet findByMa2(String ma , ArrayList<HoaDonChiTiet> List) {
        for (int i = 0; i < List.size(); i++) {
            HoaDonChiTiet x = List.get(i);
            if (x.getChiTietSP().getMa().equals(ma)) {
                return List.get(i);
            }
        }
        return null;
    }
}