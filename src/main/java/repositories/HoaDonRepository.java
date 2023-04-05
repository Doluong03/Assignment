package repositories;

import DomainModel.HoaDon;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HIbernateUtils;
import viewModel.QLHoaDon;

import java.util.ArrayList;
import java.util.List;

public class HoaDonRepository {
    private ArrayList<QLHoaDon> list;
    private Session hSession;

    public HoaDonRepository()
    {
        this.list = new ArrayList<>();
        this.hSession = HIbernateUtils.getFACTORY().openSession();
    }

    public void insert(HoaDon hd)
    {
        this.hSession = HIbernateUtils.getFACTORY().openSession();
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

    public void update(HoaDon hd)
    {
        this.hSession = HIbernateUtils.getFACTORY().openSession();
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.merge(hd);
            transaction.commit();
            hSession.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }

    public void delete(HoaDon hd)
    {
        this.hSession = HIbernateUtils.getFACTORY().openSession();
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

    public HoaDon findById(String id)
    {
        return this.hSession.find(HoaDon.class, id);
    }

    public List<HoaDon> findAll()
    {
        this.hSession = HIbernateUtils.getFACTORY().openSession();
        String hql = "SELECT obj FROM HoaDon obj";
        Query<HoaDon> query = this.hSession.createQuery(hql, HoaDon.class);
        return query.getResultList();
    }

    public HoaDon findByMa(String ma)
    {
        this.hSession = HIbernateUtils.getFACTORY().openSession();
        String hql = "SELECT obj FROM HoaDon obj WHERE obj.ma = ?1";
        Query<HoaDon> query = this.hSession.createQuery(hql, HoaDon.class);
        query.setParameter(1, ma);
        return query.getSingleResult();
    }
}
