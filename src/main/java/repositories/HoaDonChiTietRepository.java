package repositories;

import DomainModel.HoaDonChiTiet;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HIbernateUtils;
import DomainModel.HoaDonChiTiet;

import java.util.ArrayList;
import java.util.List;

public class HoaDonChiTietRepository {
    private ArrayList<HoaDonChiTiet> list;
    private Session hSession;

    public HoaDonChiTietRepository()
    {
        this.list = new ArrayList<>();
        this.hSession = HIbernateUtils.getFACTORY().openSession();
    }

    public void insert(HoaDonChiTiet hd)
    {
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.persist(hd);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }

    public void update(HoaDonChiTiet hd)
    {
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.merge(hd);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }

    public void delete(HoaDonChiTiet hd)
    {
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.delete(hd);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }

    public HoaDonChiTiet findById(String id)
    {
        return this.hSession.find(HoaDonChiTiet.class, id);
    }

    public List<HoaDonChiTiet> findAll()
    {
        String hql = "SELECT obj FROM HoaDonChiTiet obj";
        Query<HoaDonChiTiet> query = this.hSession.createQuery(hql, HoaDonChiTiet.class);
        return query.getResultList();
    }

    public HoaDonChiTiet findByMa(String ma)
    {
        String hql = "SELECT obj FROM HoaDonChiTiet obj WHERE obj.ma = ?1";
        Query<HoaDonChiTiet> query = this.hSession.createQuery(hql, HoaDonChiTiet.class);
        query.setParameter(1, ma);
        return query.getSingleResult();
    }
}
